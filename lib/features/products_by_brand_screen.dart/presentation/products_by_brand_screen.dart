import 'package:e_commerce/core/presentation/cart_cubit.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/core/resources/ui_utils.dart';
import 'package:e_commerce/core/routes_manager/routes.dart';
import 'package:e_commerce/core/widgets/lottie_animation.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/presentation/cubit/wishlist_cubit.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/entities/brand_entity.dart';
import 'package:e_commerce/features/products/presentation/widgets/product_item.dart';
import 'package:e_commerce/features/products_by_brand_screen.dart/presentation/cubit/products_by_brand_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsByBrandScreen extends StatelessWidget {
  const ProductsByBrandScreen({super.key, required this.brand});
  final BrandEntity brand;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is AddToCartLoading) {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) => Center(child: LottieAnimation.loading()),
          );
        } else if (state is AddToCartFailure) {
          UiUtils.hideLoadingDialog(context);
          UiUtils.showToastNotificationBar(
            context,
            state.message,
            ColorsManager.white,
            Colors.red,
            Icons.error,
          );
        } else if (state is AddToCartSuccess) {
          UiUtils.hideLoadingDialog(context);
          UiUtils.showToastNotificationBar(
            context,
            "Product Added Successfully",
            ColorsManager.blue,
            Colors.green,
            Icons.check_circle,
          );
          Navigator.pushNamed(context, Routes.cartScreen);
        }
      },
      child: BlocListener<WishlistCubit, WishlistState>(
        listener: (context, state) {
          if (state is AddToWishlistLoading ||
              state is DeleteProductFromWishlistLoading) {
            UiUtils.showLoadingDialog(context);
          } else if (state is AddToWishlistFailure) {
            UiUtils.hideLoadingDialog(context);
            UiUtils.showToastNotificationBar(
              context,
              state.message,
              ColorsManager.white,
              Colors.red,
              Icons.check_circle,
            );
          } else if (state is DeleteProductFromWishlistFailure) {
            UiUtils.hideLoadingDialog(context);
            context.read<WishlistCubit>().getWishlist();
            UiUtils.showToastNotificationBar(
              context,
              "Success",
              ColorsManager.white,
              Colors.green,
              Icons.check_circle,
            );
          } else if (state is DeleteProductFromWishlistSuccess) {
            UiUtils.hideLoadingDialog(context);
            context.read<WishlistCubit>().getWishlist();
            UiUtils.showToastNotificationBar(
              context,
              "Product removed successfully from your wishlist",
              ColorsManager.white,
              Colors.green,
              Icons.check_circle,
            );
          } else if (state is AddToWishlistSuccess) {
            UiUtils.hideLoadingDialog(context);
            context.read<WishlistCubit>().getWishlist();
            UiUtils.showToastNotificationBar(
              context,
              "Product added successfully to your wishlist",
              ColorsManager.white,
              Colors.green,
              Icons.check_circle,
            );
          }
        },
        child: Scaffold(
          backgroundColor: ColorsManager.white,
          appBar: AppBar(
            backgroundColor: ColorsManager.lightBlue,
            title: Text(brand.name),
            centerTitle: true,
            titleTextStyle: GoogleFonts.poppins(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: ColorsManager.offwhite,
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: ColorsManager.offwhite,
                size: 30,
              ),
            ),
          ),

          body: BlocBuilder<ProductsByBrandCubit, ProductsByBrandState>(
            builder: (context, state) {
              if (state is ProductsByBrandLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ProductsByBrandError) {
                return Center(
                  child: Text(
                    state.message,
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorsManager.darkBlue,
                    ),
                  ),
                );
              } else if (state is ProductsByBrandSuccess) {
                var products = state.products;
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 7 / 13,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) =>
                      ProductItem(product: products[index], index: index),
                  itemCount: products.length,
                );
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
