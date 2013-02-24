from rest_framework import generics, mixins
from rest_framework.decorators import api_view
from rest_framework.reverse import reverse
from rest_framework.response import Response

from .models import Establishment, User
from .serializers import (EstablishmentSerializer, UserSerializer)

# The default response could look like this, but I will probably just leave it default for now:
# {
#     metadata: {
#         status_code: null,
#         status_message: null
#     },
#     body {
#         ...
#     }
# }

@api_view(['GET'])
def api_root(request, format=None):
    """
    The entry endpoint of our API.
    """
    return Response({
        'settings': reverse('settings-detail', request=request),
        'terms-of-service': reverse('terms-of-service-detail', request=request),
        'establishments': reverse('establishment-list', request=request),
        'users': reverse('user-list', request=request),
    })

class SettingsDetail(generics.SingleObjectAPIView):

    def get(self, request):
        return Response(self.get_data())

    def get_data(self):
        return {
            "settings": True
        }

class TermsOfServiceDetail(generics.SingleObjectAPIView):

    def get(self, request):
        return Response(self.get_data())

    def get_data(self):
        return {
            "terms-of-service": True
        }

class EstablishmentList(generics.ListCreateAPIView):
    """
    API endpoint that represents a list of establishments.
    """
    model = Establishment
    serializer_class = EstablishmentSerializer

class UserList(generics.CreateAPIView):
    """
    API endpoint that represents a list of users.
    """
    model = User
    serializer_class = UserSerializer

