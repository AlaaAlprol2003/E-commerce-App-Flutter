import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/domain/entities/wishlist_item_entity.dart';
import 'package:flutter/material.dart';
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
              child: Image.network(
                wishlistItem.imageCover,
                fit: BoxFit.cover,
                width: 130.w,
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
                    child: CircleAvatar(
                      backgroundColor: ColorsManager.offwhite.withValues(
                        alpha: .6,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: ColorsManager.darkBlue,
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
                      onPressed: () {},
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
