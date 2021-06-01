import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodly/screens/home/home_screen.dart';
import 'package:foodly/screens/sign_in/sign_in_screen.dart';
import 'package:foodly/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../enums.dart';

class AuthController extends GetxController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Rx<AuthState> authState = Rx<AuthState>(AuthState.Unknow);

  @override
  void onInit() {
    _firebaseAuth.authStateChanges().listen((user) {
      authState.value =
          user != null ? AuthState.Authenticated : AuthState.Unauthenticated;
    });
    handleAuthStateChanged();
    super.onInit();
  }

  handleAuthStateChanged() {
    authState.listen((state) {
      switch (state) {
        case AuthState.Unknow:
          Get.offAllNamed(SplashScreen.routeName);
          break;
        case AuthState.Authenticated:
          Get.offAllNamed(HomeScreen.routeName);
          break;
        case AuthState.Unauthenticated:
          Get.offAllNamed(SignInScreen.routeName);
          break;
      }
    });
  }
}
