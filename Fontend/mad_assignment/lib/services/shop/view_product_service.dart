import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/shop/view_product_models.dart';

class ViewProductService {
  Future<List<ViewProductModel>> fetchProducts() async {
    const String url =
        'http://192.168.101.5:8000/api/farmer/shop/view-all-own-product/';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => ViewProductModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
