import 'package:e_commerce/features/auth/data/models/user.dart';

class RegisterResponse {
  final String message;
  final User user;
  final String token;

  RegisterResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['message'],
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }
}
