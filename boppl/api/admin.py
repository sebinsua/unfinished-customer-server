from django.contrib.gis import admin
from models import (Establishment, EstablishmentBarPerson, EstablishmentLoyalty,
                    Stock, Product, ProductPrice, ProductInstruction, Category, CategoryOfCategory)

admin.site.register(Establishment, admin.GeoModelAdmin)
admin.site.register(EstablishmentBarPerson, admin.ModelAdmin)
admin.site.register(EstablishmentLoyalty, admin.ModelAdmin)

admin.site.register(Stock, admin.ModelAdmin)
admin.site.register(Product, admin.ModelAdmin)
admin.site.register(ProductPrice, admin.ModelAdmin)
admin.site.register(ProductInstruction, admin.ModelAdmin)

admin.site.register(Category, admin.ModelAdmin)
admin.site.register(CategoryOfCategory, admin.ModelAdmin)