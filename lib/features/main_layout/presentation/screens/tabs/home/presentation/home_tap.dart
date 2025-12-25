import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/resources/assets_manager.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/entities/category_entity.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/presentation/cubit/categories_cubit.dart';
import 'package:e_commerce/features/main_layout/presentation/widgets/category_item.dart';
import 'package:e_commerce/features/main_layout/presentation/widgets/custom_add_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTap extends StatefulWidget {
 const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  final TextEditingController searchController = TextEditingController();

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
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    hintText: "what do you search for?",
                    controller: searchController,
                    radius: 50,
                    borderColor: ColorsManager.blue,
                    preIcon: Icon(Icons.search, size: 50.h),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: ColorsManager.blue,
                    size: 50.h,
                  ),
                ),
              ],
            ),
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
                  .map(
                    (offer) => CustomAddWidget(selectedIndex: selectedIndex,)
                  )
                  .toList(),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Text(
                  "Categories",
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.darkBlue,
                  ),
                ),
                Spacer(),
                Text(
                  "view all",
                  style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorsManager.darkBlue,
                  ),
                ),
              ],
            ),
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
                      itemBuilder: (context, index) =>
                          CategoryItem(category: categories[index]),
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
