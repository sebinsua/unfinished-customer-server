from django.conf.urls import patterns, url, include
from rest_framework.urlpatterns import format_suffix_patterns
from .views import EstablishmentList, UserList

import admin # This enables the admin from this module.

uuid4 = "[0-9a-f]{8}-?([0-9a-f]{4}-?){3}[0-9a-f]{12}"
urlpatterns = patterns('api.views',
    url(r'^$', 'api_root'),
    # url(r'^settings$', None),
    # url(r'^terms-of-service$', None),
    url(r'^users$', UserList.as_view(), name="user-list"),
    # url(r'^user/(?P<pk>' + uuid4 + ')/session$', None, name="user-session-detail"),
    # url(r'^user/(?P<pk>' + uuid4 + ')/account$', None, name="user-account-detail"),
    # url(r'^user/(?P<pk>' + uuid4 + ')/profile$', None, name="user-profile-detail"),
    # url(r'^user/(?P<pk>' + uuid4 + ')/payment-history$', None, name="user-payment-history-detail"),
    # url(r'^user/(?P<pk>' + uuid4 + ')/order/:order_id$', None, name="user-order-detail"),
    # url(r'^user/(?P<pk>' + uuid4 + ')/invited-users$', None, name),

    url(r'^establishments$', EstablishmentList.as_view(), name='establishment-list'),
    # url(r'^establishment/(?P<pk>' + uuid4 + ')/menu$', None),
    # url(r'^user/(?P<pk>' + uuid4 + ')/product-categories$', None),

    # url(r'^user/(?P<pk>' + uuid4 + ')/cart$', None),

    # url(r'^user/(?P<pk>' + uuid4 + ')/payment-methods$', None),
    # url(r'^user/(?P<pk>' + uuid4 + ')/voucher-codes$', None),
    # url(r'^user/(?P<pk>' + uuid4 + ')/payment-method/(?P<payment_method_id>' + uuid4 + ')', None),

    # url(r'^establishment/(?P<pk>' + uuid4 + ')/orders$', None)
)
# GET /settings/
# GET /terms-of-service/

# POST /users
# POST|GET|DELETE /user/:user_id/session (contains the cart as well as other information.)
# GET|POST|PUT|PATCH /user/:user_id/account
# GET|POST|PUT|PATCH /user/:user_id/profile

# GET /user/:user_id/payment-history
# GET /user/:user_id/order/:order_id

# POST /user/:user_id/invited-users

# GET /establishments
# GET /establishment/:establishment_id/menu
# GET /user/:user_id/product-categories

# POST|PUT|PATCH|DELETE /user/:user_id/cart

# GET /user/:user_id/payment-methods
# POST|GET /user/:user_id/voucher-codes
# POST /user/:user_id/payment-methods
# GET|PUT|PATCH|DELETE /user/:user_id/payment-method/:payment_method_id

# POST /establishment/:establishment_id/orders

# Format suffixes
urlpatterns = format_suffix_patterns(urlpatterns, allowed=['json', 'api'])

# Default login/logout views
urlpatterns += patterns('',
    url(r'^api-auth/?', include('rest_framework.urls', namespace='rest_framework'))
)