import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/presentation/cart_cubit.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/core/resources/ui_utils.dart';
import 'package:e_commerce/core/routes_manager/routes.dart';
import 'package:e_commerce/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/carousel_item.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/custom_text_widget.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/ordered_quantity_widget.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/product_color_widget.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/size_widget.dart';
import 'package:e_commerce/features/product_details/provider/product_details_provider.dart';
import 'package:e_commerce/features/products/domain/entites/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductDetailsProvider>(context);
    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: CustomAppBar(titleText: "Product Details", showCartIcon: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: product.images
                  .map(
                    (image) => CarouselItem(
                      image: image,
                      lenght: product.images.length,
                      selectedIndex: provider.selectedIndex,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 300.h,
                autoPlay: true,
                viewportFraction: 1.0,
                reverse: true,
                onPageChanged: provider.carouselPageChange,
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.title,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            color: ColorsManager.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Spacer(),
                      CustomTextWidget(text: "EGP ${product.price}"),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 50.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.r),
                          border: BoxBorder.all(
                            color: ColorsManager.blue.withValues(alpha: .3),
                          ),
                        ),
                        child: Padding(
                          padding: REdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: CustomTextWidget(text: "${product.sold} sold"),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Icon(Icons.star_rate_rounded, color: Colors.yellow),
                      CustomTextWidget(
                        text:
                            "${product.ratingsAverage} (${product.ratingsQuantity})",
                        fontWeight: FontWeight.w400,
                      ),
                      Spacer(),
                      OrderedQuantityWidget(
                        counter: provider.counter,
                        onAddClicked: provider.incrementCounter,
                        onMinClicked: provider.decrementCounter,
                      ),
                    ],
                  ),
                  CustomTextWidget(
                    text: "Description",
                    textColor: ColorsManager.darkBlue,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 5.h),
                  CustomTextWidget(
                    text: product.description,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textColor: ColorsManager.darkBlue.withValues(alpha: .6),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextWidget(
                    text: "Size",
                    textColor: ColorsManager.darkBlue,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      ...List.generate(
                        6,
                        (index) => GestureDetector(
                          onTap: () {
                            provider.assignSelectedSize(index);
                          },
                          child: SizeWidget(
                            size: provider.sizes[index],
                            isSelected: provider.selectedSize == index,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  CustomTextWidget(
                    text: "Color",
                    textColor: ColorsManager.darkBlue,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) => GestureDetector(
                          onTap: () {
                            provider.assignSelectedColor(index);
                          },
                          child: ProductColorWidget(
                            color: provider.colors[index],
                            isSelected: provider.selectedColor == index,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 55.h),
                  Row(
                    children: [
                      Column(
                        children: [
                          CustomTextWidget(
                            text: "Total Price",
                            textColor: ColorsManager.darkBlue.withValues(
                              alpha: .6,
                            ),
                          ),
                          SizedBox(height: 12.h),

                          CustomTextWidget(
                            text: "EGP 3,500",
                            textColor: ColorsManager.darkBlue,
                          ),
                        ],
                      ),
                      Spacer(),
                      BlocListener<CartCubit, CartState>(
                        listener: (context, state) {
                          if (state is AddToCartLoading) {
                            UiUtils.showLoadingDialog(context);
                          } else if (state is AddToCartFailure) {
                            UiUtils.hideLoadingDialog(context);
                            UiUtils.showToastNotificationBar(
                              context,
                              state.message,
                              Colors.white,
                              Colors.red,
                              Icons.error,
                            );
                          } else if (state is AddToCartSuccess) {
                            UiUtils.hideLoadingDialog(context);
                          }
                        },
                        child: CustomElevatedButton(
                          labelText: "Add to cart",
                          textColor: ColorsManager.white,
                          radius: 40,
                          padding: 15,
                          bgColor: ColorsManager.blue,
                          hrPadding: 20,
                          onPressed: () {
                            BlocProvider.of<CartCubit>(
                              context,
                            ).addToCart(productID: product.sId);
                          },
                          icon: Icon(
                            Icons.add_shopping_cart_outlined,
                            color: ColorsManager.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
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
