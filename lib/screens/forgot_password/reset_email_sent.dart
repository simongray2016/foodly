import 'package:flutter/material.dart';
import 'package:foodly/controllers/forgot_password_controller.dart';
import 'package:get/get.dart';

class ResetEmailSentScreen extends StatelessWidget {
  static String routeName = "/reset_email_sent";
  final ForgotPasswordController _forgotPasswordController =
      Get.find<ForgotPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot password"),
      ),
      body: Column(children: [
        Text(_forgotPasswordController.email),
        TextButton(
          onPressed: () => _forgotPasswordController.sendPasswordResetEmail(),
          child: Text('send'),
        )
      ]),
    );
  }
}
