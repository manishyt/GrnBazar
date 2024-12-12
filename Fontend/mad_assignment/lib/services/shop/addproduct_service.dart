import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:mad_assignment/services/connection.dart';

class AddProductService {
  // Submit product data to the API (Post method example)
  Future<void> submitProductData({
    required String name,
    required String price,
    required String description,
    required String userId,
    required File? image,
  }) async {
    final urls = Uri.parse(
        '${url}api/farmer/shop/product/'); // Replace with your actual API URL

    final request = http.MultipartRequest('POST', urls);

    // Add form fields
    request.fields['name'] = name;
    request.fields['price'] = price;
    request.fields['description'] = description;
    request.fields['user_id'] = userId;

    // Add the image file to the request if available
    if (image != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          image.path,
        ),
      );
    }

    // Send the request and await response
    final response = await request.send();

    if (response.statusCode == 201) {
      // If statusCode is 201, show success message
      Get.snackbar("Success", "Product added successfully.");
      Get.toNamed('/view_product');
    } else if (response.statusCode == 400) {
      // If statusCode is 400, handle failure
      Get.snackbar("Error", "Failed to add product. Please try again.");
    } else {
      // Handle other status codes
      Get.snackbar("Error", "Something went wrong. Please try again.");
    }
  }
}
