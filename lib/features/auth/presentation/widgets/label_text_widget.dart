import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelTextWidget extends StatelessWidget {
  const LabelTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.white,
        ),
      ),
    );
  }
}
