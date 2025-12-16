import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/data/models/login_request.dart';
import 'package:e_commerce/features/auth/data/models/register_request.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> register(RegisterRequest request);
  Future<Either<Failure, void>> login(LoginRequest request);
}
