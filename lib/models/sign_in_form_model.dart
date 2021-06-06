class SignInForm {
  String? email = '';
  String? password = '';
  bool isValid = false;

  SignInForm({this.email = '', this.password = ''});

  SignInForm.clear() : this();

  SignInForm copyWith({String? email, String? password}) {
    return SignInForm(
        email: email ?? this.email, password: password ?? this.password);
  }
}
