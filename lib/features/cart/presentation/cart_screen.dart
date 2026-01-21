import 'package:e_commerce/core/presentation/cart_cubit.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/core/resources/ui_utils.dart';
import 'package:e_commerce/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce/core/widgets/lottie_animation.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cart_item.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CartCubit>(context).getCart();
  }

  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: CustomAppBar(
        titleText: "Cart",
        showCartIcon: false,
        showDeleteIcon: true,
        onDeleteIconPressed: () {
          cartCubit.clearCart();
        },
      ),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is UpdateCartProductQuantityLoading ||
              state is DeleteProductFromCartLoading ||
              state is ClearCartLoading) {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => Center(child: LottieAnimation.loading1()),
            );
          } else if (state is UpdateCartProductQuantityFailure) {
            UiUtils.hideLoadingDialog(context);
            UiUtils.showToastNotificationBar(
              context,
              state.message,
              ColorsManager.white,
              Colors.red,
              Icons.error,
            );
          } else if (state is ClearcartFailure) {
            UiUtils.hideLoadingDialog(context);
            UiUtils.showToastNotificationBar(
              context,
              state.message,
              ColorsManager.white,
              Colors.red,
              Icons.error,
            );
          } else if (state is ClearCartSuccess) {
            UiUtils.hideLoadingDialog(context);
            UiUtils.showToastNotificationBar(
              context,
              "Success",
              ColorsManager.blue,
              Colors.green,
              Icons.check_circle,
            );
          } else if (state is DeleteProductFromCartFailure) {
            UiUtils.hideLoadingDialog(context);
            UiUtils.showToastNotificationBar(
              context,
              state.message,
              ColorsManager.white,
              Colors.red,
              Icons.error,
            );
          } else if (state is DeleteProductFromCartSuccess) {
            UiUtils.hideLoadingDialog(context);
            UiUtils.showToastNotificationBar(
              context,
              "Success",
              ColorsManager.blue,
              Colors.green,
              Icons.check_circle,
            );
          } else if (state is UpdateCartProductQuantitySuccess) {
            UiUtils.hideLoadingDialog(context);
            UiUtils.showToastNotificationBar(
              context,
              "Success",
              ColorsManager.blue,
              Colors.green,
              Icons.check_circle,
            );
          }
        },
        builder: (context, state) {
          if (state is GetCartLoading && cartCubit.cart == null) {
            return Center(child: LottieAnimation.loading1());
          } else if (state is GetCartFailure && cartCubit.cart == null) {
            return Center(
              child: Text(
                state.message,
                style: GoogleFonts.poppins(color: ColorsManager.darkBlue),
              ),
            );
          }

          if (cartCubit.cart != null) {
            var cart = cartCubit.cart!;

            return cart.cartItems.isEmpty
                ? Center(child: LottieAnimation.emptyBox())
                : Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemCount: cart.cartItems.length,
                          itemBuilder: (context, index) =>
                              CartItem(cartItem: cart.cartItems[index]),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                        ),
                      ),
                      Padding(
                        padding: REdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 10,
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Total Price",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: ColorsManager.darkBlue.withValues(
                                      alpha: .6,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "EGP ${cartCubit.cart?.totalCartPrice} ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: ColorsManager.darkBlue,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            CustomElevatedButton(
                              labelText: "Check Out",
                              textColor: ColorsManager.white,
                              radius: 20,
                              padding: 15,
                              hrPadding: 80.w,
                              bgColor: ColorsManager.blue,
                              icon: Icon(
                                Icons.arrow_forward,
                                color: ColorsManager.white,
                              ),
                              iconAlignment: IconAlignment.end,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
          }
          return SizedBox();
        },
      ),
    );
  }
}
