import 'package:get/get.dart';

import 'auth_controller.dart';

class ForgotPasswordController extends GetxController {
  Rx<String> _email = Rx<String>('');
  AuthController? _authController;
  String get email => _email.value;
  set email(String value) => _email.value = value;

  @override
  void onInit() {
    _authController = Get.find<AuthController>();
    super.onInit();
  }

  Future<void> sendPasswordResetEmail() async {
    await _authController?.sendPasswordResetEmail(email: _email.value);
  }
}
