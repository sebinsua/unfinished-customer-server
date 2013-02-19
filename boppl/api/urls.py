from django.conf.urls import patterns, url, include
from rest_framework.urlpatterns import format_suffix_patterns
from .views import EstablishmentList

import admin # This enables the admin from this module.

urlpatterns = patterns('api.views',
    url(r'^$', 'api_root'),
    url(r'^establishments/?$', EstablishmentList.as_view(), name='establishment-list'),
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