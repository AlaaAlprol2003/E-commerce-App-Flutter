import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/presentation/cart_cubit.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/domain/entities/wishlist_item_entity.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/presentation/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.wishlistItem});
  final WishlistItemEntity wishlistItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: ColorsManager.darkBlue.withValues(alpha: .6)),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: ColorsManager.grey),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: CachedNetworkImage(
                imageUrl: wishlistItem.imageCover,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
                width: 120.w,
                height: double.infinity,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: REdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      wishlistItem.title,
                      overflow: TextOverflow.ellipsis,

                      style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorsManager.darkBlue,
                      ),
                    ),
                  ),
                  Row(
                    spacing: 5.w,
                    children: [
                      Text(
                        " ${wishlistItem.ratingsAverage}",
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.darkBlue,
                        ),
                      ),
                      Icon(Icons.star,color: Colors.yellow.withValues(alpha: .9),)
                    ],
                  ),

                  Text(
                    " ${wishlistItem.price}",
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorsManager.darkBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 150,
            child: Padding(
              padding: REdgeInsets.symmetric(vertical: 2.0, horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        BlocProvider.of<WishlistCubit>(
                          context,
                        ).deleteProductFromWishlist(productID: wishlistItem.id);
                      },
                      child: CircleAvatar(
                        backgroundColor: ColorsManager.offwhite.withValues(
                          alpha: .6,
                        ),
                        child: Icon(Icons.favorite, color: ColorsManager.blue),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: CustomElevatedButton(
                      labelText: "Add To Cart",
                      textColor: ColorsManager.white,
                      radius: 15,
                      padding: 1,
                      hrPadding: 20,
                      bgColor: ColorsManager.darkBlue,
                      onPressed: () {
                        BlocProvider.of<CartCubit>(
                          context,
                        ).addToCart(productID: wishlistItem.id);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
