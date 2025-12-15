import 'package:e_commerce/config/theme_manager/theme_manager.dart';
import 'package:e_commerce/core/routes_manager/router.dart';
import 'package:e_commerce/core/routes_manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const ECommerce());
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
