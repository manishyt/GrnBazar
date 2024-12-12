import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../services/user/farmer_register_service.dart';

class FarmerRegisterController extends GetxController {
  final FarmerRegisterService farmerRegisterService = FarmerRegisterService();
  final box = GetStorage();

  Future<void> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String country,
    required String city,
    required String password,
  }) async {
    final response = await farmerRegisterService.registerUser(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      country: country,
      city: city,
      passsword: password,
    );

    if (response.statusCode == 201) {
      Get.snackbar("Registration Success", "You r registered successfully ");
      box.write('email', email);
      box.write('password', password);
      Get.toNamed('/farmer_login');
    } else {
      //Registration Failed
      Get.snackbar("Registration Failed", "Please fill all the  fields");
    }
  }
}

// class UpdateRegisterController extends GetxController {
//   final UpdateRegisterService _updateRegisterService = UpdateRegisterService();
//   final box = GetStorage();

//   Future<void> updateUser({
//     String? firstName,
//     String? lastName,
//     String? email,
//     String? phoneNumber,
//     String? country,
//     String? city,
//     String? password,
//   }) async {
//     final response = await _updateRegisterService.updateUser(
//         firstName: firstName,
//         lastName: lastName,
//         email: email,
//         phoneNumber: phoneNumber,
//         country: country,
//         city: city,
//         passsword: password);

//     if (response.statusCode == 206) {
//       Get.snackbar("Registration Success", "You r registered successfully ");
//       box.write('email', email);
//       box.write('password', password);
//       Get.toNamed('/home');
//     } else {
//       //Registration Failed
//       Get.snackbar("Registration Failed", "Please fill all the  fields");
//     }
//   }
// }
