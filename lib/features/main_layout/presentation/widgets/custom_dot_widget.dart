// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDotWidget extends StatelessWidget {
   CustomDotWidget({super.key, required this.isSelectedIndex});
  final bool isSelectedIndex;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      curve: Curves.easeInOut,
      height: 10.h,
      width: 10.w,
      decoration: BoxDecoration(
        color:  isSelectedIndex ? ColorsManager.darkBlue : ColorsManager.white,
        borderRadius: BorderRadius.circular(60),
      ),
    );
  }
}
