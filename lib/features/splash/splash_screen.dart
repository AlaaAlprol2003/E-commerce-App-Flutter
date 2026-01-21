// ignore_for_file: use_build_context_synchronously


import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/core/routes_manager/routes.dart';
import 'package:e_commerce/core/widgets/custom_animated_text2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(Duration(seconds: 15), () {
      Navigator.pushReplacementNamed(context, Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorsManager.blue,
              ColorsManager.white.withValues(alpha: .4),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: CustomAnimatedText.scaleAnimatedText(text: "Route", fontSize: 100.sp, fontWeight: FontWeight.w900,color: ColorsManager.blue),
      ),
    );
  }
}
