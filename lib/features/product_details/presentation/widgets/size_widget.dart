import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SizeWidget extends StatelessWidget {
  const SizeWidget({super.key, required this.size, required this.isSelected});
  final int size;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80.r),
        color: isSelected ? ColorsManager.blue : Colors.transparent,
      ),
      child: Text(
        size.toString(),
        style: GoogleFonts.poppins(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: isSelected ? ColorsManager.white : ColorsManager.darkBlue,
        ),
      ),
    );
  }
}
