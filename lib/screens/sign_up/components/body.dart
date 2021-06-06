import 'package:flutter/material.dart';
import 'package:foodly/components/default_button.dart';
import 'package:foodly/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Account",
              style: heading1Style,
            ),
            Text.rich(
              TextSpan(
                text: "Enter your Name, Email and Password\nfor sign up. ",
                style: TextStyle(color: kGrayColor),
                children: [
                  TextSpan(
                    text: "Already have account?",
                    style: TextStyle(color: kPrimaryColor),
                  )
                ],
              ),
            ),
            SizedBox(height: kDefaultPadding),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  formControl(label: "FULL NAME"),
                  SizedBox(height: kDefaultPadding),
                  formControl(
                    label: "EMAIL ADDRESS",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: kDefaultPadding),
                  formControl(label: "PASSWORD", obscureText: true),
                  SizedBox(height: kDefaultPadding),
                  DefaultButton(
                    text: "SIGN UP",
                    press: () => print(
                      "press",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: kDefaultPadding),
            SizedBox(
              width: double.infinity,
              child: Text(
                "By Signing up you agree to our Terms\nConditions & Privacy Policy.",
                textAlign: TextAlign.center,
                style: TextStyle(color: kGrayColor),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column formControl({
    required String label,
    TextInputType? keyboardType,
    bool? obscureText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: kGrayColor,
            height: 1,
          ),
        ),
        TextField(
          style: bodyStyle,
          obscuringCharacter: "*",
          cursorColor: kPrimaryColor,
          decoration: textfieldStyle,
          keyboardType: keyboardType,
          obscureText: obscureText ?? false,
        ),
      ],
    );
  }
}
