import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIndicatorWidget extends StatelessWidget {
  const CustomIndicatorWidget({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      width:isSelected? 20 : 10.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60.r),
        border: BoxBorder.all(color: ColorsManager.blue),
        color:isSelected ?  ColorsManager.blue : ColorsManager.white
      ),
    );
  }
}