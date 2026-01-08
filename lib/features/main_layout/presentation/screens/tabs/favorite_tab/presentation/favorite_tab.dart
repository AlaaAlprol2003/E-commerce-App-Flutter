import 'package:e_commerce/core/resources/assets_manager.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(ImageAssets.route),
          SizedBox(height: 10.h),
          CustomSearchSection(),
          SizedBox(height: 16.h),
          BlocBuilder<WishlistCubit, WishlistState>(
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
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 10),
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
    );
  }
}
