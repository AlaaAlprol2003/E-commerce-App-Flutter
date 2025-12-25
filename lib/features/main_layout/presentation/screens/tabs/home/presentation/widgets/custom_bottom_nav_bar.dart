import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, required this.index});
  final int index ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: REdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: ColorsManager.darkBlue,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.r),
          topLeft: Radius.circular(15.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundColor: ColorsManager.white,
            child: Icon(Icons.home_outlined, color: ColorsManager.blue),
          ),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Icon(Icons.grid_view_outlined, color: ColorsManager.white),
          ),
          CircleAvatar(child: Icon(Icons.favorite_outline)),
          CircleAvatar(child: Icon(Icons.person_outline)),
        ],
      ),
    );
  }
}
