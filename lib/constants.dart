import 'package:flutter/material.dart';
import 'package:foodly/size_config.dart';

const kPrimaryColor = Color(0xFF22A45D);

const kAccentColor = Color(0xFFEF9920);
const kAccentBlueColor = Color(0xFF4285F4);
const kAccentDarkBlueColor = Color(0xFF395998);

const kTextColor = Color(0xFF010F07);
const kGrayColor = Color(0xFF868686);
const kMediumGrayColor = Color(0xFFF3F2F2);
const kLightGrayColor = Color(0xFFFBFBFB);
const kWhiteColor = Color(0xFFFFFFFF);

const kAnimationDuration = Duration(milliseconds: 250);
const kDefaultPadding = 20.0;

// Note: Unlock when needed!
// const kGradientColor = LinearGradient(
//   begin: Alignment.topLeft,
//   end: Alignment.bottomRight,
//   colors: [kPrimaryColor, kAccentBlueColor],
// );

final heading1Style = TextStyle(
  // fontSize: getProportionateScreenWidth(34),
  fontSize: 34,
  color: kTextColor,
  height: 1.5,
);

final heading2Style = TextStyle(
  // fontSize: getProportionateScreenWidth(28),
  fontSize: 28,
  color: kTextColor,
  height: 1.5,
);

final heading3Style = TextStyle(
  // fontSize: getProportionateScreenWidth(24),
  fontSize: 24,
  color: kTextColor,
  height: 1.5,
);

final headingLineStyle = TextStyle(
  // fontSize: getProportionateScreenWidth(30),
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: kTextColor,
  height: 1.5,
);

final subHeadingLineStyle = TextStyle(
  // fontSize: getProportionateScreenWidth(30),
  fontSize: 20,
  color: kTextColor,
  height: 1.5,
);

final bodyStyle = TextStyle(
  // fontSize: getProportionateScreenWidth(16),
  fontSize: 16,
  color: kTextColor,
  height: 1.5,
);

final captionStyle = TextStyle(
  // fontSize: getProportionateScreenWidth(16),
  fontSize: 12,
  color: kTextColor,
  height: 1.5,
);

final ButtonStyle textButtonStyle = TextButton.styleFrom(
  primary: kPrimaryColor,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16.0)),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
);

final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
  primary: kPrimaryColor,
  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16.0)),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
);

final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
  primary: kPrimaryColor,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
).copyWith(
  side: MaterialStateProperty.resolveWith<BorderSide>(
    (Set<MaterialState> states) {
      return BorderSide(
        color: kPrimaryColor,
        width: 1,
      ); // Defer to the widget's default.
    },
  ),
);

ButtonStyle buttonWithIconStyle(Color primaryColor) => ElevatedButton.styleFrom(
      primary: primaryColor,
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );

final InputDecoration textfieldStyle = InputDecoration(
  contentPadding: EdgeInsets.symmetric(
    vertical: kDefaultPadding / 4,
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: kMediumGrayColor),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: kGrayColor),
  ),
);
