# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#     * Rearrange models' order
#     * Make sure each model has one field with primary_key=True
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin.py sqlcustom [appname]'
# into your database.

from django.db import models

class EstablishmentLoyalty(models.Model):
    establishment_loyalty_id = models.TextField(primary_key=True) # This field type is a guess.
    establishment = models.ForeignKey(Establishment)
    name = models.TextField(blank=True)
    instructions = models.TextField(blank=True)
    class Meta:
        db_table = u'EstablishmentLoyalty'

class Stock(models.Model):
    stock_id = models.TextField(primary_key=True) # This field type is a guess.
    establishment = models.ForeignKey(Establishment, null=True, blank=True)
    name = models.TextField(blank=True)
    type = models.TextField(blank=True)
    stock_level = models.IntegerField(null=True, blank=True)
    in_stock = models.BooleanField(null=True, blank=True)
    class Meta:
        db_table = u'Stock'

class ProductPrice(models.Model):
    product_price_id = models.TextField(primary_key=True) # This field type is a guess.
    product = models.ForeignKey(Product, null=True, blank=True)
    quantity = models.IntegerField(null=True, blank=True)
    in_stock = models.BooleanField(null=True, blank=True)
    price = models.TextField(blank=True) # This field type is a guess.
    class Meta:
        db_table = u'ProductPrice'

class Establishment(models.Model):
    establishment_id = models.TextField(primary_key=True) # This field type is a guess.
    name = models.TextField(blank=True)
    location = models.TextField(blank=True) # This field type is a guess.
    description = models.TextField(blank=True)
    photo_url = models.TextField(blank=True)
    table_map_url = models.TextField(blank=True)
    table_map_graph = models.TextField(blank=True)
    establishment_code = models.TextField(blank=True)
    class Meta:
        db_table = u'Establishment'

class Product(models.Model):
    product_id = models.TextField(primary_key=True) # This field type is a guess.
    stock = models.ForeignKey(Stock, null=True, blank=True)
    establishment = models.ForeignKey(Establishment, null=True, blank=True)
    name = models.TextField(blank=True)
    type = models.TextField(blank=True)
    photo_url = models.TextField(blank=True)
    category = models.ForeignKey(Category, null=True, blank=True)
    class Meta:
        db_table = u'Product'

class EstablishmentBarPerson(models.Model):
    establishment_bar_person_id = models.TextField(primary_key=True) # This field type is a guess.
    establishment = models.ForeignKey(Establishment, null=True, blank=True)
    name = models.TextField(blank=True)
    class Meta:
        db_table = u'EstablishmentBarPerson'

class CategoryOfCategory(models.Model):
    category_of_category_id = models.TextField(primary_key=True) # This field type is a guess.
    parent = models.ForeignKey(Category, null=True, blank=True)
    child = models.ForeignKey(Category, null=True, blank=True)
    class Meta:
        db_table = u'CategoryOfCategory'

class UserCredit(models.Model):
    user_credit_id = models.TextField(primary_key=True) # This field type is a guess.
    user = models.ForeignKey(User, null=True, blank=True)
    amount = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'UserCredit'

class ProductInstruction(models.Model):
    product_instruction_id = models.TextField(primary_key=True) # This field type is a guess.
    product = models.ForeignKey(Product, null=True, blank=True)
    name = models.TextField(blank=True)
    class Meta:
        db_table = u'ProductInstruction'

class UserFriend(models.Model):
    user_friend_id = models.TextField(primary_key=True) # This field type is a guess.
    user = models.ForeignKey(User, null=True, blank=True)
    friend = models.ForeignKey(User, null=True, blank=True)
    class Meta:
        db_table = u'UserFriend'

class UserPaymentCard(models.Model):
    user_payment_card_id = models.TextField(primary_key=True) # This field type is a guess.
    user = models.ForeignKey(User, null=True, blank=True)
    name = models.TextField(blank=True)
    last_4_digits = models.TextField(blank=True)
    expiry_date = models.TextField(blank=True)
    data = models.TextField(blank=True)
    class Meta:
        db_table = u'UserPaymentCard'

class CompositeProduct(models.Model):
    composite_product_id = models.TextField(primary_key=True) # This field type is a guess.
    name = models.TextField(blank=True)
    type = models.TextField(blank=True)
    query = models.TextField(blank=True)
    category = models.ForeignKey(Category, null=True, blank=True)
    class Meta:
        db_table = u'CompositeProduct'

class User(models.Model):
    user_id = models.TextField(primary_key=True) # This field type is a guess.
    name = models.TextField(blank=True)
    avatar_url = models.TextField(blank=True)
    invite_code = models.TextField(blank=True)
    class Meta:
        db_table = u'User'

class Category(models.Model):
    category_id = models.TextField(primary_key=True) # This field type is a guess.
    establishment = models.ForeignKey(Establishment, null=True, blank=True)
    name = models.TextField(blank=True)
    type = models.TextField(blank=True)
    visibility = models.BooleanField(null=True, blank=True)
    class Meta:
        db_table = u'Category'

class UserFavourite(models.Model):
    user_favourite_id = models.TextField(primary_key=True) # This field type is a guess.
    user = models.ForeignKey(User, null=True, blank=True)
    product = models.ForeignKey(Product, null=True, blank=True)
    establishment = models.ForeignKey(Establishment, null=True, blank=True)
    class Meta:
        db_table = u'UserFavourite'

class Tab(models.Model):
    tab_id = models.TextField(primary_key=True) # This field type is a guess.
    owner_type = models.TextField(blank=True)
    owner = models.TextField(blank=True) # This field type is a guess.
    type = models.TextField(blank=True)
    identifier = models.TextField(blank=True)
    data = models.TextField(blank=True)
    class Meta:
        db_table = u'Tab'

class Customer(models.Model):
    customer_id = models.TextField(primary_key=True) # This field type is a guess.
    user = models.ForeignKey(User, null=True, blank=True)
    establishment = models.ForeignKey(Establishment, null=True, blank=True)
    class Meta:
        db_table = u'Customer'

class AuthGroupPermissions(models.Model):
    id = models.IntegerField(primary_key=True)
    group = models.ForeignKey(AuthGroup)
    permission = models.ForeignKey(AuthPermission)
    class Meta:
        db_table = u'auth_group_permissions'

class AuthGroup(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=80, unique=True)
    class Meta:
        db_table = u'auth_group'

class AuthUserUserPermissions(models.Model):
    id = models.IntegerField(primary_key=True)
    user = models.ForeignKey(AuthUser)
    permission = models.ForeignKey(AuthPermission)
    class Meta:
        db_table = u'auth_user_user_permissions'

class AuthUserGroups(models.Model):
    id = models.IntegerField(primary_key=True)
    user = models.ForeignKey(AuthUser)
    group = models.ForeignKey(AuthGroup)
    class Meta:
        db_table = u'auth_user_groups'

class AuthUser(models.Model):
    id = models.IntegerField(primary_key=True)
    username = models.CharField(max_length=30, unique=True)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=75)
    password = models.CharField(max_length=128)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    is_superuser = models.BooleanField()
    last_login = models.DateTimeField()
    date_joined = models.DateTimeField()
    class Meta:
        db_table = u'auth_user'

class AuthPermission(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)
    content_type = models.ForeignKey(DjangoContentType)
    codename = models.CharField(max_length=100)
    class Meta:
        db_table = u'auth_permission'

class DjangoContentType(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=100)
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)
    class Meta:
        db_table = u'django_content_type'

class DjangoSession(models.Model):
    session_key = models.CharField(max_length=40, primary_key=True)
    session_data = models.TextField()
    expire_date = models.DateTimeField()
    class Meta:
        db_table = u'django_session'

class DjangoSite(models.Model):
    id = models.IntegerField(primary_key=True)
    domain = models.CharField(max_length=100)
    name = models.CharField(max_length=50)
    class Meta:
        db_table = u'django_site'

