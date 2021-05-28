import 'package:flutter/material.dart';
import 'package:foodly/constants.dart';
import 'package:foodly/size_config.dart';

class DefaultOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback press;

  const DefaultOutlineButton(
      {Key? key, required this.text, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: OutlinedButton(
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
              color: kPrimaryColor),
        ),
        style: outlineButtonStyle,
        onPressed: press,
      ),
    );
  }
}
