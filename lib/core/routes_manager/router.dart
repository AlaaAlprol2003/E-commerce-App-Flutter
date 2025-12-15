// ignore_for_file: body_might_complete_normally_nullable

import 'package:e_commerce/core/routes_manager/routes.dart';
import 'package:e_commerce/features/auth/presentation/screens/login_screen.dart';
import 'package:e_commerce/features/auth/presentation/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';

abstract class GetRoute {
  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case Routes.register:
        {
          return CupertinoPageRoute(builder: (context) => RegisterScreen());
        }
      case Routes.login:
        {
          return CupertinoPageRoute(builder: (context) => LoginScreen());
        }
    }
  }
}
