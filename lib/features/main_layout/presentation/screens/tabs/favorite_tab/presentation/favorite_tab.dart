import 'package:e_commerce/core/presentation/cart_cubit.dart';
import 'package:e_commerce/core/resources/assets_manager.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/core/resources/ui_utils.dart';
import 'package:e_commerce/core/widgets/custom_search_section.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/presentation/cubit/wishlist_cubit.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/presentation/widgets/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WishlistCubit>(context).getWishlist();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
      child: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is AddToCartLoading) {
            UiUtils.showLoadingDialog(context);
          } else if (state is AddToCartFailure) {
            UiUtils.hideLoadingDialog(context);
            UiUtils.showToastNotificationBar(
              context,
              state.message,
              ColorsManager.white,
              Colors.red,
              Icons.check_circle,
            );
          } else if (state is AddToCartSuccess) {
            UiUtils.hideLoadingDialog(context);
            UiUtils.showToastNotificationBar(
              context,
              "Product added successfully to your Cart",
              ColorsManager.white,
              Colors.green,
              Icons.supervised_user_circle_sharp,
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(ImageAssets.route),
            SizedBox(height: 10.h),
            CustomSearchSection(),
            SizedBox(height: 16.h),
            BlocConsumer<WishlistCubit, WishlistState>(
              listener: (context, state) {
                if (state is DeleteProductFromWishlistLoading) {
                  UiUtils.showLoadingDialog(context);
                } else if (state is DeleteProductFromWishlistFailure) {
                  UiUtils.hideLoadingDialog(context);
                  UiUtils.showToastNotificationBar(
                    context,
                    state.message,
                    ColorsManager.white,
                    Colors.red,
                    Icons.check_circle,
                  );
                } else if (state is DeleteProductFromWishlistSuccess) {
                  UiUtils.hideLoadingDialog(context);
                  UiUtils.showToastNotificationBar(
                    context,
                    "Product removed successfully from your wishlist",
                    ColorsManager.white,
                    Colors.green,
                    Icons.supervised_user_circle_sharp,
                  );
                }
              },
              builder: (context, state) {
                if (state is GetWishlistLoading) {
                  return Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is GetWishlistFailure) {
                  return Expanded(
                    child: Center(
                      child: Text(
                        state.message,
                        style: TextStyle(
                          fontSize: 18,
                          color: ColorsManager.darkBlue,
                        ),
                      ),
                    ),
                  );
                } else if (state is GetWishlistSuccess) {
                  var products = state.favoriteProducts;
                  return Expanded(
                    child: products.isEmpty
                        ? Center(
                            child: Text(
                              "No products added",
                              style: TextStyle(
                                color: ColorsManager.darkBlue,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : ListView.separated(
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 10),
                            itemBuilder: (context, index) =>
                                FavoriteItem(wishlistItem: products[index]),
                            itemCount: products.length,
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
