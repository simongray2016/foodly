import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: kWhiteColor,
    fontFamily: "Mulish",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    // inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: kWhiteColor,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: kTextColor),
    textTheme: TextTheme(
      headline6: TextStyle(color: kTextColor, fontSize: 18),
    ),
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: bodyStyle,
    bodyText2: bodyStyle,
    headline1: heading1Style,
    headline2: heading2Style,
    headline3: heading3Style,
    caption: captionStyle,
  );
}

// InputDecorationTheme inputDecorationTheme() {
//   OutlineInputBorder outlineInputBorder = OutlineInputBorder(
//     borderRadius: BorderRadius.circular(28),
//     borderSide: BorderSide(color: kTextColor),
//     gapPadding: 10,
//   );
//   return InputDecorationTheme(
//     floatingLabelBehavior: FloatingLabelBehavior.always,
//     contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
//     enabledBorder: outlineInputBorder,
//     focusedBorder: outlineInputBorder,
//     border: outlineInputBorder,
//   );
// }
