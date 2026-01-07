// ignore_for_file: prefer_if_null_operators

import 'package:e_commerce/core/domain/entities/cart_item_entity.dart';
import 'package:e_commerce/core/presentation/cart_cubit.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/ordered_quantity_widget.dart';
import 'package:e_commerce/features/product_details/provider/product_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem,});
  final CartItemEntity cartItem;
 
  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    var provider = Provider.of<ProductDetailsProvider>(context);
    return Container(
      width: double.infinity,
      height: 130.h,
      margin: REdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: BoxBorder.all(
          color: ColorsManager.darkBlue.withValues(alpha: .30),
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: BoxBorder.all(
                color: ColorsManager.darkBlue.withValues(alpha: .3),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.network(
                cartItem.product.imageCover,
                width: 120.w,
                height: double.infinity,
                fit: BoxFit.cover,
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
                      cartItem.product.title,
                      overflow: TextOverflow.ellipsis,
                    
                      style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorsManager.darkBlue,
                      ),
                    ),
                  ),
                  
                  Text(
                    "EGP ${cartItem.price}",
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

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      cartCubit.deleteProductFromCart(productID: cartItem.product.id);
                    },
                    icon: Icon(Icons.delete, color: ColorsManager.darkBlue),
                  ),
                ),
                Padding(
                  padding: REdgeInsets.only(bottom: 5.0, right: 5),
                  child: OrderedQuantityWidget(
                    onAddClicked: () {
                      int newCount = cartItem.count + 1;
                      cartCubit.updateCartProductQuantity(
                        productID: cartItem.product.id,
                        count: newCount.toString(),
                      );
                    },
                    onMinClicked: () {
                      if (cartItem.count < 1) return;
                      int newCount = cartItem.count - 1;
                      cartCubit.updateCartProductQuantity(
                        productID: cartItem.product.id,
                        count: newCount.toString(),
                      );
                    },
                    counter: cartItem.count,
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
