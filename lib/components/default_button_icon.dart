import 'package:flutter/material.dart';

import 'package:foodly/size_config.dart';

import '../constants.dart';

class DefaultButtonWithIcon extends StatelessWidget {
  final Widget icon;
  final String text;
  final VoidCallback press;
  final Color color;
  const DefaultButtonWithIcon({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
    required this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: ElevatedButton(
        onPressed: press,
        style: buttonWithIconStyle(color),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Expanded(
              child: Text(
                text.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(14),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                    color: kWhiteColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
