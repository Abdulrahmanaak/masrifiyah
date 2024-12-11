class SignIn {
  final String name;
  final String email;
  final String password;

  SignIn({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory SignIn.fromJson(Map<String, dynamic> json) {
    return SignIn(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }
}
