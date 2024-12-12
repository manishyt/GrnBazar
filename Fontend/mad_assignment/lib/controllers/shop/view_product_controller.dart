import 'package:get/get.dart';

import '../../models/shop/view_product_models.dart';
import '../../services/shop/view_product_service.dart';

class ProductController extends GetxController {
  var isLoading = false.obs; // Observable for loading state
  var products = <ViewProductModel>[].obs; // Observable list for products

  // Fetch products from the API
  Future<void> fetchProducts() async {
    try {
      isLoading(true); // Start loading
      final fetchedProducts = await ViewProductService().fetchProducts();
      products.addAll(fetchedProducts); // Assign data to observable list
    } catch (e) {
      print('Error fetching products: $e');
      Get.snackbar('Error', 'Failed to fetch products: $e',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false); // Stop loading
    }
  }
}
