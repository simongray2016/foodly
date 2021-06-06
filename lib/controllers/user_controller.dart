import 'package:foodly/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<User> _user = Rx<User>(User.empty());

  User get user => _user.value;

  void setUser({required String email, required String displayName}) =>
      _user.value = User(email: email, userName: displayName);

  void setUserEmpty() => _user.value = User.empty();
}
