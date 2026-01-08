// ignore_for_file: prefer_if_null_operators

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/presentation/cart_cubit.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/core/routes_manager/routes.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/presentation/cubit/wishlist_cubit.dart';
import 'package:e_commerce/features/products/domain/entites/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product, required this.index});
  final ProductEntity product;
  final int index;
  @override
  Widget build(BuildContext context) {
    var wishlistCubit = BlocProvider.of<WishlistCubit>(context);
    var cartCubit = BlocProvider.of<CartCubit>(context);
    bool isFound = wishlistCubit.items.any((item) => item.id == product.sId);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.productDetailsScreen,
          arguments: product,
        );
      },
      child: Container(
        width: 200.w,
        height: 300.h,
        margin: REdgeInsets.symmetric(vertical: 10, horizontal: 10),

        decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.blue),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),

                  child: CachedNetworkImage(
                    imageUrl: product.imageCover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                    height: 230.h,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: BlocBuilder<WishlistCubit, WishlistState>(
                    buildWhen: (previous, current) =>
                        current is GetWishlistSuccess ||
                        current is AddToWishlistSuccess,
                    builder: (context, state) {
                      final wishlistCubit = context.read<WishlistCubit>();

                      final isFound = wishlistCubit.items.any(
                        (item) => item.id == product.sId,
                      );

                      return IconButton(
                        onPressed: () {
                          wishlistCubit.addToWishlist(productID: product.sId);
                        },
                        icon: Icon(
                          isFound
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: ColorsManager.blue,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            Flexible(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                child: Column(
                  children: [
                    Text(
                      product.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorsManager.darkBlue,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      children: [
                        Text(
                          "EGP ${product.priceAfterDiscount != null ? product.priceAfterDiscount : product.price}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorsManager.darkBlue,
                          ),
                        ),
                        SizedBox(width: 12.w),

                        Text(
                          "${product.priceAfterDiscount != null ? product.price : ""}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorsManager.blue,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: ColorsManager.blue,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          "Review (4.5)  ",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorsManager.darkBlue,
                          ),
                        ),
                        Icon(Icons.star, color: Colors.yellow),
                        Spacer(),
                        CircleAvatar(
                          backgroundColor: ColorsManager.darkBlue,
                          foregroundColor: ColorsManager.white,
                          child: IconButton(
                            onPressed: () {
                              cartCubit.addToCart(productID: product.sId);
                            },
                            icon: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
