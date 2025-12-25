// ignore_for_file: must_be_immutable

import 'package:e_commerce/core/resources/assets_manager.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/presentation/widgets/custom_dot_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAddWidget extends StatelessWidget {
  CustomAddWidget({super.key, required this.selectedIndex});
  final int selectedIndex;
  List<String> offers = [
    (ImageAssets.offer),
    (ImageAssets.offer),
    (ImageAssets.offer),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: REdgeInsets.symmetric(horizontal: 5),

      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              offers[selectedIndex],
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          Padding(
            padding: REdgeInsets.symmetric(vertical: 30.0, horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "UP TO\n25% OFF",
                  style: GoogleFonts.poppins(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.darkBlue,
                  ),
                ),
                Text(
                  "For all Headphones\n& AirPods",
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorsManager.darkBlue,
                  ),
                ),
                SizedBox(height: 20.h),
                CustomElevatedButton(
                  labelText: "Shop Now",
                  textColor: ColorsManager.white,
                  radius: 10,
                  padding: 10,
                  hrPadding: 10,
                  bgColor: ColorsManager.blue,
                  onPressed: () {},
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 10,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8.w,
              children: List.generate(
                3,
                (index) =>
                    CustomDotWidget(isSelectedIndex: selectedIndex == index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
