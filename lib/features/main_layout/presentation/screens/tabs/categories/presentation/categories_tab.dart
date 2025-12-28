// ignore_for_file: must_be_immutable

import 'package:e_commerce/core/resources/assets_manager.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/core/widgets/custom_search_section.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/presentation/widgets/sub_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
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
    return SingleChildScrollView(
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(ImageAssets.route),
            SizedBox(height: 18.h),
            CustomSearchSection(onPressed: () {}),
            SizedBox(height: 16.h),
            SizedBox(
              height: 724.h,
              child: Row(
                children: [
                  Container(
                    width: 160.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        bottomLeft: Radius.circular(16.r),
                      ),
                      border: Border(
                        left: BorderSide(color: ColorsManager.darkBlue),
                      ),
                      color: ColorsManager.blue.withValues(alpha: .5),
                    ),
                    child: ListView.builder(
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          selectedCategory = index;
                          setState(() {});
                        },
                        child: Container(
                          padding: REdgeInsets.symmetric(
                            vertical: 40,
                            horizontal: 20,
                          ),
                          color: selectedCategory == index
                              ? ColorsManager.offwhite
                              : Colors.transparent,
                          child: Text(
                            categories[index],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),

                      itemCount: categories.length,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: REdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            height: 150.h,

                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(ImageAssets.offer),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Expanded(
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),

                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10.h,
                                    mainAxisSpacing: 30.w,
                                  ),
                              itemBuilder: (context, index) =>
                                  SubCategoryItem(),
                              itemCount: 8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
