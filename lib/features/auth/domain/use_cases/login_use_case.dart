import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/data/models/login_request.dart';
import 'package:e_commerce/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});
  Future<Either<Failure, void>> call(LoginRequest request) {
    return authRepository.login(request);
  }
}
