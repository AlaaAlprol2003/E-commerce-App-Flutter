class RegisterRequest {
  final String name;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      rePassword: json['rePassword'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['rePassword'] = rePassword;
    data['phone'] = phone;
    return data;
  }
}
