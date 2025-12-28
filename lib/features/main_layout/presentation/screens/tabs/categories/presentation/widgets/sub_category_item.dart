import 'package:e_commerce/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoryItem extends StatelessWidget {
  const SubCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50.w,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Image.asset(ImageAssets.offer, fit: BoxFit.cover),
      ),
    );
  }
}
