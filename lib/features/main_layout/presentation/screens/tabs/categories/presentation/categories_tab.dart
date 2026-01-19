// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/resources/assets_manager.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/core/widgets/custom_search_section.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/presentation/cubit/sub_categories_cubit.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/presentation/widgets/sub_category_item.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/presentation/cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  int selectedCategory = 2;
  String categoryImage =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSo902AJh8YABzJv5X57j3qt5N9Oupn7SmMsw&s";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 8.0, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(ImageAssets.route),
            SizedBox(height: 18.h),
            CustomSearchSection(),
            SizedBox(height: 16.h),
            SizedBox(
              height: 724.h,
              child: Row(
                children: [
                  BlocBuilder<CategoriesCubit, CategoriesState>(
                    builder: (context, state) {
                      if (state is CategoriesLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is CategoriesError) {
                        return Center(
                          child: Text(
                            state.message,
                            style: TextStyle(color: ColorsManager.black),
                          ),
                        );
                      } else if (state is CategoriesSuccess) {
                        var categoriesData = state.categories;
                        return Container(
                          width: 160.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.r),
                              bottomLeft: Radius.circular(16.r),
                            ),
                            border: Border(
                              left: BorderSide(color: ColorsManager.darkBlue),
                            ),
                            color: Color(0xFF2C4C64),
                          ),
                          child: ListView.builder(
                            itemCount: categoriesData.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                selectedCategory = index;
                                categoryImage = index == 2
                                    ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSo902AJh8YABzJv5X57j3qt5N9Oupn7SmMsw&s"
                                    : categoriesData[index].image;
                                context
                                    .read<SubCategoriesCubit>()
                                    .getSubCategories(categoriesData[index].id);
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
                                  categoriesData[index].name,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: selectedCategory == index
                                        ? ColorsManager.darkBlue
                                        : ColorsManager.offwhite,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      return SizedBox();
                    },
                  ),
                  BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
                    builder: (context, state) {
                      if (state is SubCategoriesLoading) {
                        return Expanded(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } else if (state is SubCategoriesfailure) {
                        return Expanded(
                          child: Center(
                            child: Text(
                              state.message,
                              style: TextStyle(color: ColorsManager.black),
                            ),
                          ),
                        );
                      } else if (state is SubCategoriesSuccess) {
                        var subCategories = state.subCategories;

                        return Expanded(
                          child: Padding(
                            padding: REdgeInsets.symmetric(horizontal: 4.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 200.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.r),
                                    
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16.r),
                                    child: CachedNetworkImage(
                                      imageUrl: categoryImage,
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),

                                SizedBox(height: 16.h),
                                Expanded(
                                  child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10.w,
                                          mainAxisSpacing: 20.h,
                                        ),
                                    itemBuilder: (context, index) =>
                                        SubCategoryItem(
                                          subcategoryEntity:
                                              subCategories[index],
                                        ),
                                    itemCount: subCategories.length,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return SizedBox();
                    },
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
