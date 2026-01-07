import 'package:e_commerce/features/auth/data/models/login_request.dart';
import 'package:e_commerce/features/auth/data/models/register_request.dart';
import 'package:e_commerce/features/auth/domain/use_cases/login_use_case.dart';
import 'package:e_commerce/features/auth/domain/use_cases/register_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.registerUseCase, required this.loginUseCase})
    : super(AuthInit());
  RegisterUseCase registerUseCase;
  LoginUseCase loginUseCase;

  void register(RegisterRequest request) async {
    emit(RegisterLoading());
    final result = await registerUseCase(request);
    result.fold(
      ifLeft: (failure) {
        emit(RegisterFailure(message: failure.message));
      },
      ifRight: (_) {
        emit(RegisterSuccess());
      },
    );
  }

  void login(LoginRequest request) async {
    emit(LoginLoading());
    final result = await loginUseCase(request);
    result.fold(
      ifLeft: (failure) {
        emit(LoginFailure(message: failure.message));
      },
      ifRight: (_) {
        emit(LoginSuccess());
      },
    );
  }
}

abstract class AuthState {}

class AuthInit extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterFailure extends AuthState {
  String message;
  RegisterFailure({required this.message});
}

class RegisterSuccess extends AuthState {}

class LoginLoading extends AuthState {}

class LoginFailure extends AuthState {
  String message;
  LoginFailure({required this.message});
}

class LoginSuccess extends AuthState {}
