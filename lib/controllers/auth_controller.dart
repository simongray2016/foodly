import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodly/screens/home/home_screen.dart';
import 'package:foodly/screens/sign_in/sign_in_screen.dart';
import 'package:foodly/screens/splash/splash_screen.dart';
import 'package:foodly/screens/walkthrough/walkthrough_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../enums.dart';

class AuthController extends GetxController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Rx<AuthState> _authState = Rx<AuthState>(AuthState.Unknow);
  SharedPreferences? _sharedPreferences;
  StreamController<bool> _appOnInit = StreamController<bool>();

  AuthState get authState => _authState.value;

  @override
  void onInit() async {
    await appOnInit();
    getSharedPreferences();
    mapAuthStateChanges();
    handleAuthStateChanged();
    super.onInit();
  }

  @override
  void onClose() {
    _appOnInit.close();
    super.onClose();
  }

  appInit() {
    _appOnInit.add(true);
  }

  Future appOnInit() async {
    await _appOnInit.stream.firstWhere((isInit) => isInit);
  }

  void getSharedPreferences() {
    _sharedPreferences = Get.find<SharedPreferences>();
  }

  void mapAuthStateChanges() {
    _firebaseAuth.authStateChanges().listen((user) {
      _authState.value =
          user != null ? AuthState.Authenticated : AuthState.Unauthenticated;
    });
  }

  handleAuthStateChanged() {
    _authState.listen((state) {
      switch (state) {
        case AuthState.Unknow:
          Get.offAllNamed(SplashScreen.routeName);
          break;
        case AuthState.Authenticated:
          Get.offAllNamed(HomeScreen.routeName);
          break;
        case AuthState.Unauthenticated:
          bool isLauched = _sharedPreferences?.getBool('isLauched') ?? false;
          Get.offAllNamed(
              isLauched ? SignInScreen.routeName : WalkthroughScreen.routeName);
          break;
      }
    });

    Future<void> signInWithEmailAndPassword({
      required String email,
      required String password,
    }) async {
      try {
        UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } catch (e) {}
    }

    Future<void> signOut() async {
      try {
        await _firebaseAuth.signOut();
      } catch (e) {}
    }
  }
}
