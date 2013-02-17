from .models import Establishment
from rest_framework import serializers
import json

class PointField(serializers.WritableField):
    type_name = 'PointField'

    def to_native(self, value):
        # Convert object to string
        return 'ST_SetSRID(ST_MakePoint(223.234, 123.1234)'

    def from_native(self, value):
        # Convert string to object
        return ''

class EstablishmentSerializer(serializers.HyperlinkedModelSerializer):
    # todo: Make sure to store points in the database correctly.
    # location = PointField()

    class Meta:
        model = Establishment
        fields = ('name', 'establishment_code', 'description')


