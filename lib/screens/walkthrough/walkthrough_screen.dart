import 'package:flutter/material.dart';

import './components/body.dart';

class WalkthroughScreen extends StatelessWidget {
  static String routeName = "/walkthrough";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
