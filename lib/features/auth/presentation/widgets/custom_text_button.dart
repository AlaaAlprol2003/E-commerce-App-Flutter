import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: ColorsManager.white,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: ColorsManager.white,
          decorationThickness: 2
        ),
      ),
    );
  }
}
