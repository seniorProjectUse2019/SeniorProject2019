"""Condo URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.views.generic import RedirectView
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('admin/', admin.site.urls),  # admin site
    path('login/', auth_views.auth_login, name='login'),  # login site
    path('logout/', auth_views.auth_logout, name='logout'),  # logout site
    path('oauth/', include('social_django.urls', namespace='social')),  # login using lone site
]

# Add Django site authentication urls (for login, logout, password management)
urlpatterns += [
    path('accounts/', include('django.contrib.auth.urls')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

# for payment application
urlpatterns += {
    path('payment/', include('payment.urls')),
}

# for homedetail application
urlpatterns += {
    path('homedetail/', include('homedetail.urls'))
}

# for notification application
urlpatterns += {
    path('notification/', include('notification.urls'))
}
# Add URL maps to redirect the base URL to our application
urlpatterns += [
    path('', RedirectView.as_view(url='/homedetail/', permanent=True)),
]






