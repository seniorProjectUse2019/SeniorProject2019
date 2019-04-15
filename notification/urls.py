from django.urls import path
from . import views

urlpatterns = [
    path('notification/', views.view_notification, name='notification'),
    path('notification/<int:pk>', views.detail_notification, name='notification-detail'),
    path('notification/specific/<int:pk>', views.detail_notification_specific, name='specific-notification-detail'),

]