import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/domain/entities/sub_category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoryItem extends StatelessWidget {
  const SubCategoryItem({super.key, required this.subcategoryEntity});
  final SubCategoryEntity subcategoryEntity;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r),
      border: Border.all(color: ColorsManager.lightBlue,width: 2.w),
      color: Color(0xFF2C4C64) ,
      boxShadow: [BoxShadow(color: ColorsManager.black,blurRadius: 4,offset: Offset(15, 15)),],
      
      ),
      child: Text(subcategoryEntity.name,textAlign: TextAlign.center,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500,color: ColorsManager.offwhite ),)
    );
  }
}
