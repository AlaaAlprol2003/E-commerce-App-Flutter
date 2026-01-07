import 'package:e_commerce/config/theme_manager/theme_manager.dart';

import 'package:e_commerce/core/di/service_locator.dart';

import 'package:e_commerce/core/presentation/cart_cubit.dart';
import 'package:e_commerce/core/routes_manager/router.dart';
import 'package:e_commerce/core/routes_manager/routes.dart';

import 'package:e_commerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_commerce/features/product_details/provider/product_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator.get<AuthCubit>()),
        BlocProvider(create: (context) => serviceLocator.get<CartCubit>()),
      ],

      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProductDetailsProvider()),
        ],
        child: ECommerce(),
      ),
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
          initialRoute: Routes.mainLayout,
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
