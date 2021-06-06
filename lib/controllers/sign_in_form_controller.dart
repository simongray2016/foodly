import 'package:foodly/models/sign_in_form_model.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class SignInFormController extends GetxController {
  Rx<SignInForm> _signInForm = Rx<SignInForm>(SignInForm());
  AuthController? _authController;

  SignInForm get signInForm => _signInForm.value;

  @override
  void onInit() {
    _authController = Get.find<AuthController>();
    super.onInit();
  }

  void updateValue({String? email, String? password}) {
    _signInForm.value =
        _signInForm.value.copyWith(email: email, password: password);
  }

  void submit() async {
    try {
      await _authController?.signInWithEmailAndPassword(
          email: _signInForm.value.email!,
          password: _signInForm.value.password!);
    } catch (e) {
      print('error: $e');
    }
  }
}
