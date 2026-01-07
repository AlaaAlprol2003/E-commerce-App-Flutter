import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/data/models/register_request.dart';
import 'package:e_commerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
@singleton
class RegisterUseCase {
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});

  Future<Either<Failure, void>> call(RegisterRequest request) {
    return authRepository.register(request);
  }
}
