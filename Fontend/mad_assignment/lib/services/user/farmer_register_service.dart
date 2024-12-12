import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mad_assignment/services/connection.dart';

class FarmerRegisterService {
  Future<http.Response> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String country,
    required String city,
    required String passsword,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("${url}api/farmer_register/"),
        body: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'phone_number': phoneNumber,
          'country': country,
          'city': city,
          'password': passsword,
          'password2': passsword,
          'is_farmer': 'true'
        },
      );
      return response;
    } catch (e) {
      if (kDebugMode) {
        print("error during registration:$e");
      }
      rethrow;
    }
  }
}
