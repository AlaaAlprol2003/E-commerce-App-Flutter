import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.radius = 15,
    this.keyboard = TextInputType.text,
    this.isSecure = false,
    this.suffIcon, required this.controller,  this.validator,
    this.borderColor = ColorsManager.white, this.preIcon
  });
  final String hintText;
  final TextInputType keyboard;
  final double radius;
  final bool isSecure;
  final Widget? suffIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Color? borderColor;
  final Widget? preIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboard,
      obscureText: isSecure,
      cursorColor: ColorsManager.darkBlue,
      decoration: InputDecoration(
        hintText: hintText,
        
        hintStyle: GoogleFonts.poppins(
          fontSize: 18.sp,
          fontWeight: FontWeight.w300,
          color: ColorsManager.black.withValues(alpha: .7),
        ),
        suffixIcon: suffIcon,
        prefixIcon: preIcon,
        prefixIconColor: ColorsManager.blue,
        suffixIconColor: ColorsManager.grey,
        filled: true,
        fillColor: ColorsManager.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.r),
          borderSide: BorderSide(color: borderColor ?? ColorsManager.white, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.r),
          borderSide: BorderSide(color: borderColor ?? ColorsManager.white, width: 1.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.r),
          borderSide: BorderSide(color: Colors.red, width: 1.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.r),
          borderSide: BorderSide(color: Colors.red, width: 1.w),
        ),
      ),
    );
  }
}
