from django.shortcuts import render
from homedetail.models import Room
from notification.models import SpecificNotification, GlobalNotificaiton
# Create your views here.


def view_notification(request):
    user = request.user
    room = Room.objects.filter(UserID=user.pk)
    global_notification = GlobalNotificaiton.objects.all()

    return render(request, 'notification/notification_list.html', {'global': global_notification})


def detail_notification(request, pk):
    global_notification = GlobalNotificaiton.objects.filter(id__exact=pk)
    return render(request, 'notification/notification_detail.html', {'notification': global_notification}
                  )


def detail_notification_specific(request, pk):
    specific_notification = SpecificNotification.objects.filter(id__exact=pk)
    return render(request, 'notification/specific_notification_detail.html', {'notification': specific_notification})


