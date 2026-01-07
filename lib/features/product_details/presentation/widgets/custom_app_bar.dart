import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/core/routes_manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.titleText, required this.showCartIcon, this.showDeleteIcon = false, this.onDeleteIconPressed });
  final String titleText;
  final bool showCartIcon;
  final bool showDeleteIcon;
  final VoidCallback? onDeleteIconPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: ColorsManager.white,
      backgroundColor: ColorsManager.white,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back, color: ColorsManager.darkBlue),
      ),
      title: Text(
        titleText,
        style: GoogleFonts.poppins(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.darkBlue,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: ColorsManager.darkBlue),
        ),
        Visibility(
          visible: showCartIcon == true,
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.cartScreen);
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: ColorsManager.darkBlue,
            ),
          ),
        ),
        Visibility(
          visible: showDeleteIcon,
          child: IconButton(
              onPressed:onDeleteIconPressed,
              icon: Icon(
                Icons.delete_forever,
                color: ColorsManager.darkBlue,
              ),
            ),
        ),

      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
