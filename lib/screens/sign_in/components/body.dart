import 'package:flutter/material.dart';
import 'package:foodly/controllers/auth_controller.dart';
import 'package:foodly/controllers/sign_in_form_controller.dart';
import 'package:foodly/screens/forgot_password/forgot_password_screen.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  final SignInFormController? _signInFormController =
      Get.find<SignInFormController>();
  final AuthController? _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  onChanged: (email) =>
                      _signInFormController?.updateValue(email: email),
                ),
                TextField(
                  onChanged: (password) =>
                      _signInFormController?.updateValue(password: password),
                ),
                TextButton(
                  onPressed: () => _signInFormController?.submit(),
                  child: Text('Sign in'),
                ),
                TextButton(
                  onPressed: () async {
                    await _authController?.signInWithGoogle();
                  },
                  child: Text('Google'),
                ),
                TextButton(
                  onPressed: () => _authController?.signInWithFacebook(),
                  child: Text('Facebook'),
                ),
                TextButton(
                  onPressed: () => Get.toNamed(ForgotPasswordScreen.routeName),
                  child: Text('Reset password'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
