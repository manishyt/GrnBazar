import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mad_assignment/models/user/account_model.dart';
import 'package:mad_assignment/services/connection.dart';

class AccountService {
  Future<AccountModel> fetchAccountData() async {
    var box = GetStorage();

    String email = box.read('email');
    if (kDebugMode) {
      print(Uri.parse("${url}api/register/$email/"));
    }

    var response = await http.get(
      Uri.parse("${url}api/register/$email/"),
    );
    if (response.statusCode == 200) {
      return accountModelFromJson(response.body);
    } else {
      if (kDebugMode) {
        print("network erro");
      }
      throw Exception("nework error");
    }
  }
}

class UpdateAccountService {
  Future<http.Response> updateUser({
    String? firstName,
    String? lastName,
    required String email, // Must not be null
    String? phoneNumber,
    String? country,
    String? city,
  }) async {
    if (email.isEmpty) {
      throw ArgumentError("Email is required and cannot be empty");
    }

    try {
      final response = await http.patch(
        Uri.parse("${url}api/register/$email/"),
        body: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'phone_number': phoneNumber,
          'country': country,
          'city': city,
        },
      );
      return response;
    } catch (e) {
      if (kDebugMode) {
        print("Error during update: $e");
      }
      rethrow;
    }
  }
}
