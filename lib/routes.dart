import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'screens/home/home_screen.dart';
import 'screens/sign_in/sign_in_screen.dart';
import 'screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};

final List<GetPage> getPages = [
  GetPage(
    name: SplashScreen.routeName,
    page: () => SplashScreen(),
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
