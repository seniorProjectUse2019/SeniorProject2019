from django.urls import path
from django.conf.urls import url
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    # path('data', views.view_data, name='data'),
    path('room', views.view_room, name='room'),
    path('room/<uuid:pk>', views.room_detail, name='room-detail'),
    path('room/<uuid:pk>/show-data', views.data_list, name='room-data'),
]

# for make changes to user in the room
urlpatterns += [
    path('room/<uuid:pk>/user', views.user_in_the_room, name='user-in-the-room'),
    path('user/add/<uuid:pk>', views.user_add, name='add-user'),
    path('user/add/<int:pk>/room/<uuid:id>', views.user_that_will_be_add, name='selected-user'),
    path('room/<uuid:id>/user/<int:pk>/delete', views.delete_user, name='delete-user'),
]



