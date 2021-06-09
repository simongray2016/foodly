import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodly/constants.dart';
import 'package:foodly/components/default_button_icon.dart';
import 'package:foodly/screens/sign_up/components/form_sign_up.dart';

class Body extends StatelessWidget {
  final String svgFacebook = 'assets/icons/facebook.svg';
  final String svgGoogle = 'assets/icons/google.svg';

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
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // https://fluttermaster.com/method-chaining-using-cascade-in-dart/
                        print('Already have account?');
                        HapticFeedback.vibrate();
                      },
                  )
                ],
              ),
            ),
            SizedBox(height: kDefaultPadding),
            FormSignUp(),
            SizedBox(height: kDefaultPadding),
            Center(
              child: Text(
                "By Signing up you agree to our Terms\nConditions & Privacy Policy.",
                textAlign: TextAlign.center,
                style: TextStyle(color: kGrayColor),
              ),
            ),
            SizedBox(height: kDefaultPadding),
            Center(child: Text('Or')),
            SizedBox(height: kDefaultPadding),
            DefaultButtonWithIcon(
              text: "Connect with Facebook",
              icon: SvgPicture.asset(svgFacebook),
              color: kAccentDarkBlueColor,
              press: () => print('press sign up Facebook'),
            ),
            SizedBox(height: kDefaultPadding),
            DefaultButtonWithIcon(
              text: "Connect with Google",
              icon: SvgPicture.asset(svgGoogle),
              color: kAccentBlueColor,
              press: () => print('press sign up Google'),
            ),
          ],
        ),
      ),
    );
  }
}
