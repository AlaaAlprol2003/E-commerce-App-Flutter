import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category,required this.index});
  final CategoryEntity category;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100.h,
          width: 100.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: CachedNetworkImage(
              imageUrl:index == 2 ? "https://i.pinimg.com/736x/23/4c/78/234c78d367f937a8a1c8c5dde3603d00.jpg" :category.image,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          category.name,
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
