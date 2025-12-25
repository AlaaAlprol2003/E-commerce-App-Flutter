import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSectionWidget extends StatelessWidget {
  const CustomSectionWidget({super.key, required this.sectionName});
  final String sectionName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          sectionName,
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: ColorsManager.darkBlue,
          ),
        ),
        Spacer(),
        Text(
          "view all",
          style: GoogleFonts.poppins(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
