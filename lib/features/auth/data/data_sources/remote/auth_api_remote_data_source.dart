import 'package:dio/dio.dart';
import 'package:e_commerce/core/errors/app_exceptions.dart';
import 'package:e_commerce/core/resources/constatnt_manager.dart';
import 'package:e_commerce/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:e_commerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:e_commerce/features/auth/data/models/login_request.dart';
import 'package:e_commerce/features/auth/data/models/login_response.dart';
import 'package:e_commerce/features/auth/data/models/register_request.dart';
import 'package:e_commerce/features/auth/data/models/register_response.dart';

class AuthApiRemoteDataSource implements AuthRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstatnt.baseUrl));
  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final response = await dio.post(
        ApiConstatnt.registerEndPoint,
        data: request.toJson(),
      );
      return RegisterResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {}
      throw RemoteException(message: message ?? "Failed to register");
    }
  }

  @override
  Future<LoginResponse> login(LoginRequest requset) async {
    try {
      final response = await dio.post(
        ApiConstatnt.loginEndPoint,
        data: requset.toJson(),
      );
      return LoginResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data["message"];
      }
      throw RemoteException(message: message ?? "Failed to login");
    }
  }
}
