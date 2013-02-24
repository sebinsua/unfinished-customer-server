from django.db import models
from django_extensions.db.fields import UUIDField
from django.contrib.gis.db.models import PointField, GeoManager

class Establishment(models.Model):
    establishment_id = UUIDField(primary_key=True) # This field type is a guess.
    name = models.TextField(blank=True)
    location = PointField(blank=True) # This field type is a guess.
    description = models.TextField(blank=True)
    photo_url = models.TextField(blank=True)
    table_map_url = models.TextField(blank=True)
    table_map_graph = models.TextField(blank=True)
    establishment_code = models.TextField(blank=True)

    objects = GeoManager()

    class Meta:
        db_table = u'Establishment'

class EstablishmentLoyalty(models.Model):
    establishment_loyalty_id = UUIDField(primary_key=True) # This field type is a guess.
    establishment = models.ForeignKey(Establishment)
    name = models.TextField(blank=True)
    instructions = models.TextField(blank=True)
    class Meta:
        db_table = u'EstablishmentLoyalty'

class Stock(models.Model):
    stock_id = UUIDField(primary_key=True) # This field type is a guess.
    establishment = models.ForeignKey(Establishment, null=True, blank=True)
    name = models.TextField(blank=True)
    type = models.TextField(blank=True)
    stock_level = models.IntegerField(null=True, blank=True)
    in_stock = models.BooleanField()
    class Meta:
        db_table = u'Stock'

class Category(models.Model):
    category_id = UUIDField(primary_key=True) # This field type is a guess.
    establishment = models.ForeignKey(Establishment, null=True, blank=True)
    name = models.TextField(blank=True)
    type = models.TextField(blank=True)
    visibility = models.BooleanField()
    class Meta:
        db_table = u'Category'

class Product(models.Model):
    product_id = UUIDField(primary_key=True) # This field type is a guess.
    stock = models.ForeignKey(Stock, null=True, blank=True)
    establishment = models.ForeignKey(Establishment, null=True, blank=True)
    name = models.TextField(blank=True)
    type = models.TextField(blank=True)
    photo_url = models.TextField(blank=True)
    category = models.ForeignKey(Category, null=True, blank=True)
    class Meta:
        db_table = u'Product'

class ProductPrice(models.Model):
    product_price_id = UUIDField(primary_key=True) # This field type is a guess.
    product = models.ForeignKey(Product, null=True, blank=True)
    quantity = models.IntegerField(null=True, blank=True)
    in_stock = models.BooleanField()
    price = models.TextField(blank=True) # This field type is a guess.
    class Meta:
        db_table = u'ProductPrice'

class EstablishmentBarPerson(models.Model):
    establishment_bar_person_id = UUIDField(primary_key=True) # This field type is a guess.
    establishment = models.ForeignKey(Establishment, null=True, blank=True)
    name = models.TextField(blank=True)
    class Meta:
        db_table = u'EstablishmentBarPerson'

class CategoryOfCategory(models.Model):
    category_of_category_id = UUIDField(primary_key=True) # This field type is a guess.
    parent = models.ForeignKey(Category, null=True, blank=True, related_name='parent_category')
    child = models.ForeignKey(Category, null=True, blank=True, related_name='child_category')
    class Meta:
        db_table = u'CategoryOfCategory'

class User(models.Model):
    user_id = UUIDField(primary_key=True) # This field type is a guess.
    name = models.TextField(blank=False)
    avatar_url = models.TextField(blank=True)
    invite_code = models.TextField(blank=True)
    class Meta:
        db_table = u'User'

class UserCredit(models.Model):
    user_credit_id = UUIDField(primary_key=True) # This field type is a guess.
    user = models.ForeignKey(User, null=True, blank=True)
    amount = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'UserCredit'

class ProductInstruction(models.Model):
    product_instruction_id = UUIDField(primary_key=True) # This field type is a guess.
    product = models.ForeignKey(Product, null=True, blank=True)
    name = models.TextField(blank=True)
    class Meta:
        db_table = u'ProductInstruction'

class UserFriend(models.Model):
    user_friend_id = UUIDField(primary_key=True) # This field type is a guess.
    user = models.ForeignKey(User, null=True, blank=True, related_name='user_with_friend')
    friend = models.ForeignKey(User, null=True, blank=True, related_name='friend_of_user')
    class Meta:
        db_table = u'UserFriend'

class UserPaymentCard(models.Model):
    user_payment_card_id = UUIDField(primary_key=True) # This field type is a guess.
    user = models.ForeignKey(User, null=True, blank=True)
    name = models.TextField(blank=True)
    last_4_digits = models.TextField(blank=True)
    expiry_date = models.TextField(blank=True)
    data = models.TextField(blank=True)
    class Meta:
        db_table = u'UserPaymentCard'

class CompositeProduct(models.Model):
    composite_product_id = UUIDField(primary_key=True) # This field type is a guess.
    name = models.TextField(blank=True)
    type = models.TextField(blank=True)
    query = models.TextField(blank=True)
    category = models.ForeignKey(Category, null=True, blank=True)
    class Meta:
        db_table = u'CompositeProduct'

class UserFavourite(models.Model):
    user_favourite_id = UUIDField(primary_key=True) # This field type is a guess.
    user = models.ForeignKey(User, null=True, blank=True)
    product = models.ForeignKey(Product, null=True, blank=True)
    establishment = models.ForeignKey(Establishment, null=True, blank=True)
    class Meta:
        db_table = u'UserFavourite'

class Tab(models.Model):
    tab_id = UUIDField(primary_key=True) # This field type is a guess.
    owner_type = models.TextField(blank=True)
    owner = models.TextField(blank=True) # This field type is a guess.
    type = models.TextField(blank=True)
    identifier = models.TextField(blank=True)
    data = models.TextField(blank=True)
    class Meta:
        db_table = u'Tab'

class Customer(models.Model):
    customer_id = UUIDField(primary_key=True) # This field type is a guess.
    user = models.ForeignKey(User, null=True, blank=True)
    establishment = models.ForeignKey(Establishment, null=True, blank=True)
    class Meta:
        db_table = u'Customer'

# class DjangoSite(models.Model):
#     id = models.IntegerField(primary_key=True)
#     domain = models.CharField(max_length=100)
#     name = models.CharField(max_length=50)
#     class Meta:
#         db_table = u'django_site'
#
# class DjangoSession(models.Model):
#     session_key = models.CharField(max_length=40, primary_key=True)
#     session_data = models.TextField()
#     expire_date = models.DateTimeField()
#     class Meta:
#         db_table = u'django_session'
#
# class DjangoContentType(models.Model):
#     id = models.IntegerField(primary_key=True)
#     name = models.CharField(max_length=100)
#     app_label = models.CharField(max_length=100)
#     model = models.CharField(max_length=100)
#     class Meta:
#         db_table = u'django_content_type'
#
# class AuthPermission(models.Model):
#     id = models.IntegerField(primary_key=True)
#     name = models.CharField(max_length=50)
#     content_type = models.ForeignKey(DjangoContentType)
#     codename = models.CharField(max_length=100)
#     class Meta:
#         db_table = u'auth_permission'
#
# class AuthGroup(models.Model):
#     id = models.IntegerField(primary_key=True)
#     name = models.CharField(max_length=80, unique=True)
#     class Meta:
#         db_table = u'auth_group'
#
# class AuthGroupPermissions(models.Model):
#     id = models.IntegerField(primary_key=True)
#     group = models.ForeignKey(AuthGroup)
#     permission = models.ForeignKey(AuthPermission)
#     class Meta:
#         db_table = u'auth_group_permissions'
#
# class AuthUser(models.Model):
#     id = models.IntegerField(primary_key=True)
#     username = models.CharField(max_length=30, unique=True)
#     first_name = models.CharField(max_length=30)
#     last_name = models.CharField(max_length=30)
#     email = models.CharField(max_length=75)
#     password = models.CharField(max_length=128)
#     is_staff = models.BooleanField()
#     is_active = models.BooleanField()
#     is_superuser = models.BooleanField()
#     last_login = models.DateTimeField()
#     date_joined = models.DateTimeField()
#     class Meta:
#         db_table = u'auth_user'
#
# class AuthUserUserPermissions(models.Model):
#     id = models.IntegerField(primary_key=True)
#     user = models.ForeignKey(AuthUser)
#     permission = models.ForeignKey(AuthPermission)
#     class Meta:
#         db_table = u'auth_user_user_permissions'
#
# class AuthUserGroups(models.Model):
#     id = models.IntegerField(primary_key=True)
#     user = models.ForeignKey(AuthUser)
#     group = models.ForeignKey(AuthGroup)
#     class Meta:
#         db_table = u'auth_user_groups'
