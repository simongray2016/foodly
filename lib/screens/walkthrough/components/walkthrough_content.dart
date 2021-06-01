import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  final String heading, text, image;

  SplashContent(
      {required this.heading, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(flex: 2),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
        Spacer(),
        Text(
          heading,
          style: headingLineStyle,
        ),
        Spacer(),
        Text(
          text,
          textAlign: TextAlign.center,
          style: bodyStyle,
        )
      ],
    );
  }
}
