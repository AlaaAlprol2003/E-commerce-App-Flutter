import 'package:e_commerce/config/theme_manager/theme_manager.dart';
import 'package:e_commerce/core/routes_manager/router.dart';
import 'package:e_commerce/core/routes_manager/routes.dart';
import 'package:e_commerce/features/auth/data/data_sources/local/auth_shared_prefs_local_data_source.dart';
import 'package:e_commerce/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart';
import 'package:e_commerce/features/auth/data/repositories_impl/auth_repository_impl.dart';
import 'package:e_commerce/features/auth/domain/use_cases/login_use_case.dart';
import 'package:e_commerce/features/auth/domain/use_cases/register_use_case.dart';
import 'package:e_commerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(
        registerUseCase: RegisterUseCase(
          authRepository: AuthRepositoryImpl(
            authRemoteDataSource: AuthApiRemoteDataSource(),
            authLocalDataSource: AuthSharedPrefsLocalDataSource(),
          ),
        ),
        loginUseCase: LoginUseCase(
          authRepository: AuthRepositoryImpl(
            authRemoteDataSource: AuthApiRemoteDataSource(),
            authLocalDataSource: AuthSharedPrefsLocalDataSource(),
          ),
        ),
      ),
      child: const ECommerce(),
    ),
  );
}

class ECommerce extends StatelessWidget {
  const ECommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.register,
          onGenerateRoute: GetRoute.router,
          theme: ThemeManager.light,
          darkTheme: ThemeManager.dark,
          themeMode: ThemeMode.light,
          locale: Locale("en"),
        );
      },
    );
  }
}
