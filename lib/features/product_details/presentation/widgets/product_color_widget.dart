import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductColorWidget extends StatelessWidget {
  const ProductColorWidget({super.key, required this.color, required this.isSelected});
  final Color color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.w,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80.r),
        color: color,
      ),
      child: isSelected ? Icon(Icons.check,color: ColorsManager.white,) : null,
    );
  }
}
