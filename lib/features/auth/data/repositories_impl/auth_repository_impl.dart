import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/errors/app_exceptions.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:e_commerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:e_commerce/features/auth/data/models/login_request.dart';
import 'package:e_commerce/features/auth/data/models/login_response.dart';
import 'package:e_commerce/features/auth/data/models/register_request.dart';
import 'package:e_commerce/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });
  AuthRemoteDataSource authRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;
  @override
  Future<Either<Failure, void>> register(RegisterRequest request) async {
    try {
      await authRemoteDataSource.register(request);

      return Right(null);
    } on AppExceptions catch (ex) {
      return Left(Failure(message: ex.message));
    }
  }

  @override
  Future<Either<Failure, void>> login(LoginRequest request) async {
    try {
      final response = await authRemoteDataSource.login(request);
      await authLocalDataSource.saveToken(response.token);
      return Right(null);
    } on AppExceptions catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
