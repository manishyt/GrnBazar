import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mad_assignment/controllers/user/user_login_preference.dart';
import 'package:mad_assignment/routes.dart';

void main() {
  GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GrnBazar());
}

class GrnBazar extends StatelessWidget {
  GrnBazar({Key? key}) : super(key: key);
  final SessionController sessionController = Get.put(SessionController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/register',
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
      getPages: Routes.route,
      debugShowCheckedModeBanner: false,
      title: 'GrnBazar',
      theme: ThemeData(
        // Use Material 3 for modern design
        useMaterial3: true,

        // Dynamic color scheme based on seed color
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

        // Customizing AppBar and Typography
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 78, 16, 185),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
