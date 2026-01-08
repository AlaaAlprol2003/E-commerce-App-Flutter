import 'package:e_commerce/core/presentation/cart_cubit.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/core/resources/ui_utils.dart';
import 'package:e_commerce/core/routes_manager/routes.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/presentation/cubit/wishlist_cubit.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/entities/category_entity.dart';
import 'package:e_commerce/features/products/presentation/cubit/products_cubit.dart';
import 'package:e_commerce/features/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.categoryEntity});

  final CategoryEntity categoryEntity;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  @override
  void initState(){
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
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
          if (state is AddToWishlistLoading) {
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
          } else if (state is AddToWishlistSuccess) {
            UiUtils.hideLoadingDialog(context);
            context.read<WishlistCubit>().getWishlist();
            UiUtils.showToastNotificationBar(
              context,
              "Success",
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
            title: Text(widget.categoryEntity.name),
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
          body: BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ProductsFailure) {
                return Center(child: Text(state.message));
              } else if (state is ProductsSuccess) {
                var products = state.products;
                return products.isEmpty
                    ? Center(
                        child: Text(
                          "No Products Found For This Category Now",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorsManager.darkBlue,
                          ),
                        ),
                      )
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 7 / 13,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) =>
                            ProductItem(product: products[index],index: index,),
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
