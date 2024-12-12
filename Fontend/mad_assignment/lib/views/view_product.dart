import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../services/connection.dart'; // Assuming the `url` is defined here

class ViewProduct extends StatefulWidget {
  @override
  _ViewProductState createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  bool isLoading = true;
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    // Ensure the 'url' variable is defined correctly in your connection.dart file
    final Uri endpoint =
        Uri.parse('$url/api/farmer/shop/view-all-own-product/');
    try {
      final response = await http.get(endpoint);
      if (response.statusCode == 200) {
        setState(() {
          // Parse the response body into a list of products
          products = jsonDecode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        Get.snackbar(
          'Error',
          'Failed to load products: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Show a user-friendly message in case of error
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Products",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : products.isEmpty
              ? const Center(child: Text('No products found'))
              : ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Image.network(
                          "$url${product['image']}",
                          width: 50,
                          height: 50,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.image),
                        ),
                        title: Text(product['name'] ?? 'Unknown Product'),
                        subtitle: Text(
                            'Rs. ${product['price']?.toStringAsFixed(2) ?? '0.00'}'),
                        onTap: () {
                          Get.to(() => ProductDetailScreen(product: product));
                        },
                      ),
                    );
                  },
                ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name'] ?? 'Product Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "$url${product['image']}",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image),
            ),
            const SizedBox(height: 16),
            Text(
              product['name'] ?? 'Unknown Product',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Rs. ${product['price']?.toStringAsFixed(2) ?? '0.00'}',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 16),
            Text(
              product['description'] ?? 'No description available.',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
