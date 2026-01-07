import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.labelText,
    required this.textColor,
    this.suffIcon,
    required this.radius,
    required this.padding, required this.bgColor, this.icon,

    this.iconAlignment = IconAlignment.start, required this.onPressed, this.hrPadding
  });
  final String labelText;
  final Color textColor;
  final IconData? suffIcon;
  final double radius;
  final double padding;
  final Color bgColor;
  final Widget? icon;
  final IconAlignment? iconAlignment;
  final VoidCallback onPressed;
  final double? hrPadding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        padding: REdgeInsets.symmetric(vertical: padding,horizontal: hrPadding ?? 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius.r),
        ),
      ),
      icon: icon ,
      
      iconAlignment:iconAlignment,
      label: Text(
        labelText,
        style: GoogleFonts.poppins(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}
