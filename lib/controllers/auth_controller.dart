import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:foodly/controllers/user_controller.dart';
import 'package:foodly/screens/home/home_screen.dart';
import 'package:foodly/screens/sign_in/sign_in_screen.dart';
import 'package:foodly/screens/splash/splash_screen.dart';
import 'package:foodly/screens/walkthrough/walkthrough_screen.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../enums.dart';

class AuthController extends GetxController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Rx<AuthState> _authState = Rx<AuthState>(AuthState.Unknow);
  SharedPreferences? _sharedPreferences;
  UserController? _userController;
  StreamController<bool> _appOnInit = StreamController<bool>();

  AuthState get authState => _authState.value;

  @override
  void onInit() async {
    await appOnInit();
    getSharedPreferences();
    getUserController();
    mapAuthStateChanges();
    handleAuthStateChanged();
    super.onInit();
  }

  @override
  void onClose() {
    _appOnInit.close();
    super.onClose();
  }

  void appInit() {
    _appOnInit.add(true);
  }

  Future<void> appOnInit() async {
    await _appOnInit.stream.firstWhere((isInit) => isInit);
  }

  void getSharedPreferences() {
    _sharedPreferences = Get.find<SharedPreferences>();
  }

  void getUserController() {
    _userController = Get.find<UserController>();
  }

  void mapAuthStateChanges() {
    _firebaseAuth.authStateChanges().listen((user) {
      _authState.value =
          user != null ? AuthState.Authenticated : AuthState.Unauthenticated;
    });
  }

  void handleAuthStateChanged() {
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
  }

  void setUser(UserCredential userCredential) {
    _userController?.setUser(
        email: userCredential.user!.email ?? '',
        displayName: userCredential.user!.displayName ?? '');
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      setUser(userCredential);
    } catch (e) {
      throw e;
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Once signed in, return the UserCredential
        final UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);

        setUser(userCredential);
      } else {
        throw 'Google user is null';
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        // Create a credential from the access token
        final facebookAuthCredential =
            FacebookAuthProvider.credential(result.accessToken!.token);

        // Once signed in, return the UserCredential
        final UserCredential userCredential = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);

        setUser(userCredential);
      } else {
        throw result;
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      _userController?.setUserEmpty();
    } catch (e) {
      throw e;
    }
  }
}
