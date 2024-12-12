import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:mad_assignment/services/shop/addproduct_service.dart';

class AddProductController extends GetxController {
  // Reactive variables to store the selected image file and form data
  var image = Rx<File?>(null);
  var name = ''.obs;
  var price = ''.obs;
  var description = ''.obs;
  var userId = 'UserID Placeholder'.obs; // You can replace with actual user ID

  final AddProductService productService = AddProductService();

  // Function to pick an image from the gallery
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path); // Store the image file
    }
  }

  // Function to submit data to the API
  Future<void> submitProductData() async {
    try {
      await productService.submitProductData(
        name: name.value,
        price: price.value,
        image: image.value,
        description: description.value,
        userId: userId.value,
      );
      print('Product data submitted successfully');
    } catch (e) {
      print('Failed to submit product data: $e');
    }
  }
}
