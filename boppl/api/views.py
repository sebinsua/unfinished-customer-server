from rest_framework import generics
from rest_framework.decorators import api_view
from rest_framework.reverse import reverse
from rest_framework.response import Response

from .models import Establishment
from .serializers import EstablishmentSerializer

@api_view(['GET'])
def api_root(request, format=None):
    """
    The entry endpoint of our API.
    """
    return Response({
        'establishments': reverse('establishment-list', request=request),
    })

class EstablishmentList(generics.ListCreateAPIView):
    """
    API endpoint that represents a list of establishments.
    """
    model = Establishment
    serializer_class = EstablishmentSerializer
