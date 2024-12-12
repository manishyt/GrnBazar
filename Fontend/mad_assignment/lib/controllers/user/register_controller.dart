import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mad_assignment/services/user/register_service.dart';

class RegisterController extends GetxController {
  final RegisterService registerService = RegisterService();
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
    final response = await registerService.registerUser(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        country: country,
        city: city,
        passsword: password);

    if (response.statusCode == 201) {
      Get.snackbar("Registration Success", "You r registered successfully ");
      box.write('email', email);
      box.write('password', password);
      Get.toNamed('/login');
    } else {
      //Registration Failed
      Get.snackbar("Registration Failed", "Please fill all the  fields");
    }
  }
}
