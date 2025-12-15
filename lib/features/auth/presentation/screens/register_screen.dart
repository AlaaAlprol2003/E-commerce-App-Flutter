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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool securePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(vertical: 85.0, horizontal: 12),
          child: Column(
            children: [
              Image.asset(ImageAssets.routeLogo, height: 71.h, width: 237.w),
              SizedBox(height:60.h),
              // Text("Welcome Back To Route",style: GoogleFonts.poppins(fontSize: 24.sp,fontWeight: FontWeight.w600,color: ColorsManager.white),),
              // Text("Please sign in with your mail",style: GoogleFonts.poppins(fontSize: 16.sp,fontWeight: FontWeight.w300,color: ColorsManager.white),),
              LabelTextWidget(text: "Full Name"),
              SizedBox(height: 24.h),
              CustomTextFormField(hintText: "enter your full name"),
              SizedBox(height: 20.h),
              LabelTextWidget(text: "Mobile Number"),
              SizedBox(height: 24.h),
              CustomTextFormField(
                hintText: "enter your mobile no.",
                keyboard: TextInputType.phone,
              ),
              SizedBox(height: 20.h),
              LabelTextWidget(text: "E-mail address"),
              SizedBox(height: 24.h),
              CustomTextFormField(
                hintText: "enter your email address",
                keyboard: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.h),
              LabelTextWidget(text: "Password"),
              SizedBox(height: 24.h),
              CustomTextFormField(
                hintText: "enter your password",
                isSecure: securePassword,
                suffIcon: IconButton(
                  onPressed: toggleBetweenSecureAndNotSecurePassword,
                  icon: Icon(
                    securePassword
                        ? Icons.visibility_off_rounded
                        : Icons.visibility,
                  ),
                ),
                keyboard: TextInputType.visiblePassword,
              ),
              SizedBox(height:16.h),
              Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Already Have Account?",style: GoogleFonts.poppins(fontSize: 18.sp,fontWeight: FontWeight.w500,color: ColorsManager.white),),
                CustomTextButton(text: "Login",onPressed: (){
                  Navigator.pushReplacementNamed(context, Routes.login);
                },)


              ],),
              SizedBox(height: 30.h),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  onPressed: (){},
                  labelText: "Sign Up",
                  textColor: ColorsManager.blue,
                  radius: 15,
                  padding: 23,
                  bgColor: ColorsManager.white,
                ),
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
