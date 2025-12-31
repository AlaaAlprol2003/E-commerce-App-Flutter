import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.text,
    this.fontSize = 18,
    this.textColor = ColorsManager.blue,
    this.fontWeight = FontWeight.w500,
    this.textAlign = TextAlign.center,
  });
  final String text;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        fontSize: fontSize?.sp,

        color: textColor,
        fontWeight: fontWeight,
      ),
    );
  }
}
