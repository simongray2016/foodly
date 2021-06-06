import 'package:flutter/material.dart';
import 'package:foodly/controllers/forgot_password_controller.dart';
import 'package:foodly/screens/forgot_password/reset_email_sent.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgor_password";
  final ForgotPasswordController _forgotPasswordController =
      Get.find<ForgotPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot password"),
      ),
      body: Column(children: [
        TextField(
          onChanged: (value) => _forgotPasswordController.email = value,
        ),
        TextButton(
          onPressed: () async {
            await _forgotPasswordController.sendPasswordResetEmail();
            Get.toNamed(ResetEmailSentScreen.routeName);
          },
          child: Text('send'),
        )
      ]),
    );
  }
}
