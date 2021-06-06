class User {
  final String email;
  final String userName;

  const User({required this.email, required this.userName});

  const User.empty() : this(email: '', userName: '');

  bool isEmpty() => email == '' && userName == '';
}
