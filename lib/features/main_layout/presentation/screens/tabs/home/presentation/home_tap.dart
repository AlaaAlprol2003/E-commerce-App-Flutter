// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/resources/assets_manager.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/core/routes_manager/routes.dart';
import 'package:e_commerce/core/widgets/custom_search_section.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/entities/category_entity.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/presentation/cubit/brands_cubit.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/presentation/cubit/categories_cubit.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/presentation/widgets/brand_item.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/presentation/widgets/category_item.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/presentation/widgets/custom_add_widget.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/presentation/widgets/custom_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  int selectedIndex = 0;

  List<String> offers = [
    (ImageAssets.offer),
    (ImageAssets.offer),
    (ImageAssets.offer),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: REdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(ImageAssets.route),
            SizedBox(height: 18.h),
            CustomSearchSection(),
            SizedBox(height: 16.h),
            CarouselSlider(
              options: CarouselOptions(
                height: 250.h,

                autoPlay: true,
                reverse: true,
                viewportFraction: 1.0,
                onPageChanged: (index, _) {
                  selectedIndex = index;
                  setState(() {});
                },
              ),
              items: offers
                  .map((offer) => CustomAddWidget(selectedIndex: selectedIndex))
                  .toList(),
            ),
            SizedBox(height: 24.h),
            CustomSectionWidget(sectionName: "Categories"),
            SizedBox(height: 16.h),
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
                  List<CategoryEntity> categories = state.categories;

                  return SizedBox(
                    height: 350.h,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,

                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,

                        mainAxisSpacing: 8.w,
                        mainAxisExtent: 100,
                        childAspectRatio: 20 / 10,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () async {
                          
                         
                          Navigator.pushNamed(
                            context,
                            Routes.productScreen,
                            arguments: categories[index],
                          );
                        },
                        child: CategoryItem(
                          category: categories[index],
                          index: index,
                        ),
                      ),
                    ),
                  );
                }
                return SizedBox();
              },
            ),

            CustomSectionWidget(sectionName: "Brands"),
            BlocBuilder<BrandsCubit, BrandsState>(
              builder: (context, state) {
                if (state is BrandsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is BrandsFailure) {
                  return Center(
                    child: Text(
                      state.message,
                      style: TextStyle(color: ColorsManager.black),
                    ),
                  );
                } else if (state is BrandsSuccess) {
                  var brands = state.brands;
                  return SizedBox(
                    height: 350.h,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: brands.length,
                      itemBuilder: (context, index) =>
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, Routes.productsByBrandScreen,arguments: brands[index]);
                            },
                            child: BrandItem(brand: brands[index])),
                    ),
                  );
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}


