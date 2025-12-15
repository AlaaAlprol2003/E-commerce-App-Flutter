import 'package:e_commerce/core/resources/assets_manager.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/core/routes_manager/routes.dart';
import 'package:e_commerce/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:e_commerce/features/auth/presentation/widgets/label_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool securePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  REdgeInsets.only(top:85 ,left:12,right: 12,bottom: MediaQuery.of(context).viewInsets.bottom ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  ImageAssets.routeLogo,
                  height: 71.h,
                  width: 237.w,
                ),
              ),
              SizedBox(height: 70.h),
              Text(
                "Welcome Back To Route",
                style: GoogleFonts.poppins(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorsManager.white,
                ),
              ),
              Text(
                "Please sign in with your mail",
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                  color: ColorsManager.white,
                ),
              ),
              SizedBox(height: 40.h),
              LabelTextWidget(text: "User Name"),
              SizedBox(height: 24.h),
              CustomTextFormField(hintText: "enter your name", radius: 15),
              SizedBox(height: 32.h),
              LabelTextWidget(text: "Password"),
              SizedBox(height: 24.h),
              CustomTextFormField(
                hintText: "enter your password",
                keyboard: TextInputType.visiblePassword,
                isSecure: securePassword,
                suffIcon: IconButton(
                  onPressed: toggleBetweenSecureAndNotSecurePassword,
                  icon: Icon(
                    securePassword
                        ? Icons.visibility_off_rounded
                        : Icons.visibility,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CustomTextButton(text: "Forget Password", onPressed: () {}),
              ),
              SizedBox(height: 56.h),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  labelText: "Login",
                  textColor: ColorsManager.blue,
                  radius: 15,
                  padding: 24,
                  bgColor: ColorsManager.white,
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have Account?",
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorsManager.white,
                    ),
                  ),
                  CustomTextButton(
                    text: "Create Account",
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.register);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void toggleBetweenSecureAndNotSecurePassword() {
    setState(() {
      securePassword = !securePassword;
    });
  }
}
