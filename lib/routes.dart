import 'package:flutter/widgets.dart';
import 'package:foodly/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

import 'screens/home/home_screen.dart';
import 'screens/sign_in/sign_in_screen.dart';
import 'screens/walkthrough/walkthrough_screen.dart';

final Map<String, WidgetBuilder> routes = {
  WalkthroughScreen.routeName: (context) => WalkthroughScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};

final List<GetPage> getPages = [
  GetPage(
    name: SplashScreen.routeName,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: WalkthroughScreen.routeName,
    page: () => WalkthroughScreen(),
  ),
  GetPage(
    name: SignInScreen.routeName,
    page: () => SignInScreen(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: HomeScreen.routeName,
    page: () => HomeScreen(),
    transition: Transition.rightToLeft,
  ),
];
