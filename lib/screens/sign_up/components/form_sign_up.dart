import 'package:flutter/material.dart';
import 'package:foodly/components/default_button.dart';
import 'package:foodly/components/form_control.dart';
import 'package:foodly/constants.dart';

class FormSignUp extends StatelessWidget {
  const FormSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormControl(
            label: "Full name",
            isValid: true,
          ),
          SizedBox(height: kDefaultPadding),
          FormControl(
            label: "Email address",
            isValid: true,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: kDefaultPadding),
          FormControl(
            label: "Password",
            obscure: true,
            isValid: true,
          ),
          SizedBox(height: kDefaultPadding),
          DefaultButton(
            text: "Sign up",
            press: () => print("press sign up"),
          ),
        ],
      ),
    );
  }
}
