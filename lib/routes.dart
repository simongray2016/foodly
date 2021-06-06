import 'package:foodly/screens/forgot_password/forgot_password_screen.dart';
import 'package:foodly/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

import 'controllers/sign_in_form_controller.dart';
import 'screens/forgot_password/reset_email_sent.dart';
import 'screens/home/home_screen.dart';
import 'screens/sign_in/sign_in_screen.dart';
import 'screens/walkthrough/walkthrough_screen.dart';

final List<GetPage> getPages = [
  GetPage(
    name: SplashScreen.routeName,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: WalkthroughScreen.routeName,
    page: () => WalkthroughScreen(),
  ),
  GetPage(name: SignInScreen.routeName, page: () => SignInScreen(), bindings: [
    BindingsBuilder(() {
      Get.put(SignInFormController());
    })
  ]),
  GetPage(
    name: ForgotPasswordScreen.routeName,
    page: () => ForgotPasswordScreen(),
  ),
  GetPage(
    name: ResetEmailSentScreen.routeName,
    page: () => ResetEmailSentScreen(),
  ),
  GetPage(
    name: HomeScreen.routeName,
    page: () => HomeScreen(),
  ),
];
