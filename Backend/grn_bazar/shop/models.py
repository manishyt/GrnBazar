from django.db import models
from account.models import User
# Assuming you have a common base model for all products


class BaseProduct(models.Model):
    
    name = models.CharField(max_length=100)
    price = models.FloatField()
    image = models.ImageField(upload_to='products')
    description = models.TextField()

    # class Meta:
    #     abstract = True


class Fruits(BaseProduct):
    # Additional fields specific to fruits, if any
    pass


class Vegetables(BaseProduct):
    # Additional fields specific to Mens, if any
    pass


class Grains(BaseProduct):
    # Additional fields specific to MensWatches, if any
    pass


class Fertilizers(BaseProduct):
    # Additional fields specific to WomensHandbags, if any
    pass


class DairyProducts(BaseProduct):
    # Additional fields specific to WomensGlasses, if any
    pass


class BaseCartWhiteList(models.Model):
    user = models.ForeignKey(
        User, related_name='basecartwhitelist', on_delete=models.CASCADE)
    product = models.ForeignKey(
        BaseProduct, related_name='product', on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)

    # def get_queryset(self):
    #     user = self.request.user
    #     id = user.id
    #     return BaseCartWhiteList.objects.filter(pk=id)

    def __str__(self):
        return self.product.name


class Cart(BaseCartWhiteList):
    # add the necessary fields here that can override
    pass


class Whitelist(BaseCartWhiteList):
    pass


class Checkout(models.Model):

    user = models.ForeignKey(
        User, related_name='checkouts', on_delete=models.SET_NULL, null=True)
    product = models.ForeignKey(
        BaseProduct, related_name="product_checkout", on_delete=models.SET_NULL, null=True)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    email = models.EmailField(max_length=100)

    # country_choices = [('Nepal', 'Nepal'), ('India', 'India'),
    #                    ('Pakistan', 'Pakistan'), ('Japan', 'Japan')]
    # city_choices = [('Kathmandu', 'Kathmandu'), ('Lalitpur',
    #                                              'Lalitpur'), ('Bhaktapur', 'Bhaktapur')]
    # payment_method_choices = [
    #     ('esewa', 'eSewa'), ('khalti', 'Khalti'), ('visa', 'Visa'), ('cash', 'Cash')]

    country = models.CharField(max_length=100)
    city = models.CharField(max_length=100)
    address = models.TextField()
    mobile_number = models.IntegerField()
    order_note = models.TextField()
    payment_method = models.CharField(
        max_length=100)
    total_bill = models.FloatField(default=0)
    order_status = models.CharField(max_length=100, default="Pending", choices=[
        ('Pending', 'Pending'), ('Delivered', 'Delivered')])

    # def get_queryset(self):
    #     user = self.request.user
    #     return Checkout.objects.filter(user=user)

    def __str__(self):
        return f'{self.user.email} - {self.product.name}'


class PrintBill(Checkout):
    pass
