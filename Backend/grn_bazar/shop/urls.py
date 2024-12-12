
from django.urls import include, path
from shop import views
from rest_framework.routers import DefaultRouter
# router = DefaultRouter()
# router.register('product', views.BaseProductView, basename='product')
# router.register('cloths', views.MensClothsView, basename="cloths")
# router.register('shoes', views.MensShoesView, basename="shoes")
# router.register('watches', views.MensWatchesView, basename="wathces")
# router.register('handbags', views.WomensHandbagsView, basename="handbags")
# router.register('glasses', views.WomensGlassesView, basename="glasses")
# # router.register(r'cart', views.CartView, basename='cart')
# router.register('whitelist', views.WhiteListView, basename='whitelist')
# router.register('basecartwhitelist', views.BeseCartWhitelistView,
#                 basename='basecartwhitelist')
# router.register('checkout', views.CheckOutView, basename='checkout')
urlpatterns = [
    # path('shop/', include(router.urls)),
    path('shop/product/', views.BaseProductView.as_view()),
    path('shop/fruits/', views.FruitsView.as_view()),
    path('shop/vegetables/', views.VegetablesView.as_view()),
    path('shop/grains/', views.GrainsView.as_view()),
    path('shop/fertilizers/', views.FertilizersView.as_view()),
    path('shop/dairyProducts/', views.DairyProductsView.as_view()),
    path('shop/cart/', views.CartView.as_view()),
    path('shop/whitelist/', views.WhiteListView.as_view()),
    path('shop/basecartwhitelist/', views.BeseCartWhitelistView.as_view()),
    path('shop/checkout/', views.CheckOutView.as_view()),


    path('farmer/shop/product/', views.BaseProductView.as_view()),
    path('farmer/shop/fruits/', views.FruitsView.as_view()),
    path('farmer/shop/vegetables/', views.VegetablesView.as_view()),
    path('farmer/shop/grains/', views.GrainsView.as_view()),
    path('farmer/shop/fertilizers/', views.FertilizersView.as_view()),
    path('farmer/shop/dairyProducts/', views.DairyProductsView.as_view()),
    path('farmer/shop/view-all-own-product/',views.ViewOwnProductFarmer.as_view())


]
