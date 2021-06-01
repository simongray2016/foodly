import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(child: Text('loading')),
    );
  }
}
