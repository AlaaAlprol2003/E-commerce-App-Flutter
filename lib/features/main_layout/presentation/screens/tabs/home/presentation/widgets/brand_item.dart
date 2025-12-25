// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/entities/brand_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BrandItem extends StatelessWidget {
   BrandItem({super.key, required this.brand});
  final BrandEntity brand;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 20.h,
      width: 20.w,
      decoration: BoxDecoration(
        border: BoxBorder.all(color: ColorsManager.blue),
        
        borderRadius: BorderRadius.circular(80.r),
      ),
      child: Stack(
        children: [
          CachedNetworkImage(
              imageUrl: brand.image,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          Text(
            brand.name,
            style: GoogleFonts.poppins(
              fontSize: 25.sp,
              fontWeight: FontWeight.w600,
              color: ColorsManager.white,
            ),
          ),
        ],
      ),
    );
  }
}
