from django.conf.urls import patterns, url, include
from rest_framework.urlpatterns import format_suffix_patterns
from .views import EstablishmentList

import admin # This enables the admin from this module.

urlpatterns = patterns('api.views',
    url(r'^$', 'api_root'),
    url(r'^establishments/?$', EstablishmentList.as_view(), name='establishment-list'),
)

# Format suffixes
urlpatterns = format_suffix_patterns(urlpatterns, allowed=['json', 'api'])

# Default login/logout views
urlpatterns += patterns('',
    url(r'^api-auth/?', include('rest_framework.urls', namespace='rest_framework'))
)