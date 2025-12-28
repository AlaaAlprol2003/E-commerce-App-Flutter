// ignore_for_file: must_be_immutable

import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSideBar extends StatefulWidget {
 const CustomSideBar({super.key});

  @override
  State<CustomSideBar> createState() => _CustomSideBarState();
}

class _CustomSideBarState extends State<CustomSideBar> {
  int selectedCategory = 0;

  List<String> categories = [
    "Alaa",
    "Ahmed",
    "Fathi",
    "Alprol",
    "Mohamed",
    "Mustafa",
    "Mustafa",
    "Mustafa",
    "Mustafa",
    "Mustafa",
    "Mustafa",
    "Mustafa",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          bottomLeft: Radius.circular(16.r),
        ),
        border: Border(left: BorderSide(color: ColorsManager.darkBlue)),
        color: ColorsManager.blue.withValues(alpha: .5),
      ),
      child: ListView.separated(
        itemBuilder: (context, index) => Padding(
          padding: REdgeInsets.symmetric(horizontal: 20.0, vertical: 34),
          child: InkWell(
            onTap: (){
           
             
            },
            child: Text(categories[index], textAlign: TextAlign.center)),
        ),
        separatorBuilder: (context, index) => Divider(),
        itemCount: categories.length,
      ),
    );
  }
}
