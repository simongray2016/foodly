import 'package:flutter/material.dart';
import 'package:foodly/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Create Account",
            style: heading1Style,
          ),
          Text(
            "Enter your Name, Email and Password\nfor sign up.",
            style: TextStyle(color: kGrayColor),
          ),
          GestureDetector(
            child: Text(
              "Already have account?",
              style: TextStyle(color: kPrimaryColor),
            ),
            onTap: () => print('tap'),
          ),
        ],
      ),
    );
  }
}
