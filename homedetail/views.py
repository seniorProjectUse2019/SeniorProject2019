from homedetail.models import Room, DataType, Data, UserInTheRoom
from django.contrib.auth.models import User
from django.views import generic
from django.views.generic import TemplateView, DeleteView
from django.urls import reverse_lazy
from django.shortcuts import render, get_object_or_404
from django.contrib.auth.decorators import login_required
from .filters import UserAddFilter
from .forms import UserAddForm

# Create your views here.


def room_detail(request, pk):
    user = request.user
    room = Room.objects.filter(RoomId=pk)
    return render(request, 'homedetail/room_detail.html', {'room_detail': room})


def user_in_the_room(request, pk):
    room = Room.objects.filter(RoomId=pk)
    room_number = room.get()
    room_id = room.values('RoomId').get()
    print(room_id['RoomId'])
    user_room = UserInTheRoom.objects.filter(RoomId=room.get())
    owner = user_room.filter(status='O')
    tenant = user_room.filter(status='T')
    initiate = owner.exists()

    if not initiate:  # make sure the room owner is in the room
        UserInTheRoom(User=request.user,
                      RoomId=room.get(),
                      status='O').save()  # create owner in the room
        return render(request, 'homedetail/user_list.html', {'room_number': room_number,
                                                             'user_room': user_room,
                                                             'owner': owner,
                                                             'tenant': tenant})
    else:
        return render(request, 'homedetail/edit_user_in_the_room.html', {'room_number': room_number,
                                                                         'user_room': user_room,
                                                                         'owner': owner,
                                                                         'room_id': room_id['RoomId'],
                                                                         'tenant': tenant})


def delete_user(request, pk, id):
    wanted_user = get_object_or_404(User, id=pk)
    selected_room = Room.objects.filter(RoomId=id).get()
    user_to_be_delete = UserInTheRoom.objects.filter(User=wanted_user).filter(RoomId=selected_room)
    user_to_be_delete.delete()

    return render(request, 'homedetail/delete_user.html', {'selected_user': wanted_user,
                                                           'selected_room': selected_room})


def user_add(request, pk):
    room = Room.objects.filter(RoomId=pk)
    room_id = room.values('RoomId').get()
    add_another_user = UserAddFilter(request.GET, queryset=User.objects.filter(is_staff=False))
    return render(request, 'homedetail/user_add.html', {'filter': add_another_user,
                                                        'room_id': room_id['RoomId']})


def user_that_will_be_add(request, pk, id):
    user = User.objects.filter(id=pk)
    room = Room.objects.filter(RoomId=id)
    if request.method == 'GET':
        form = UserAddForm(user=request.user)
        form.initial['User'] = user.get()
        form.initial['RoomId'] = room.get()
        return render(request, 'homedetail/select_user_add.html', {'form': form})
    if request.method == 'POST':
        form = UserAddForm(request.POST, user=request.user)
        print(form)
        if form.is_valid():
            selected_user = form.cleaned_data['User']
            selected_room = form.cleaned_data['RoomId']
            new_user = UserInTheRoom(User=selected_user,
                                     RoomId=selected_room,
                                     status='T')
            new_user.save()
            return render(request, 'homedetail/tenant_created.html', {'new_user': new_user})
        else:
            print(request.FILES)
            print(form.errors)
            return render(request, 'homedetail/select_user_add.html', {'form': form})


def view_room(request):
    user = request.user
    room = UserInTheRoom.objects.filter(User=user.id)
    return render(request, 'homedetail/room_list.html', {'room_list': room})


def data_list(request, pk, room_filter=None):
    data = Data.objects.filter(RoomId=pk)
    if room_filter:
        room_filter = get_object_or_404(Room)
        data = data.filter(RoomId=room_filter)
    return render(request, 'homedetail/data_in_the_room.html', {'data': data})


class DataDetailView(generic.DetailView):
    model = Data


class DataListView(generic.ListView):
    model = Data
    paginate_by = 10


@login_required
def index(request):
    """View function for home page of site."""

    # Generate counts of some of the main objects
    num_rooms = Room.objects.all().count()

    # Available books (status = 'a')
    room_avilable = Room.objects.filter(status__exact='a').count()

    # The 'all()' is implied by default.
    num_datas = Data.objects.count()

    context = {
        'num_rooms': num_rooms,
        'room_avilable': room_avilable,
        'num_datas': num_datas,
    }

    # Render the HTML template index.html with the data in the context variable
    return render(request, 'index.html', context=context)
