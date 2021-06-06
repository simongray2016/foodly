import 'package:foodly/controllers/auth_controller.dart';
import 'package:foodly/controllers/forgot_password_controller.dart';
import 'package:foodly/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitBinding {
  static Future<void> init() async {
    await Get.putAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance());
    Get.put<UserController>(UserController());
    Get.put<AuthController>(AuthController());
    Get.lazyPut(() => ForgotPasswordController());
  }
}
