import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchSection extends StatelessWidget {
  CustomSearchSection({super.key, required this.onPressed});
  final TextEditingController searchController = TextEditingController();
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            hintText: "what do you search for?",
            controller: searchController,
            radius: 50,
            borderColor: ColorsManager.blue,
            preIcon: Icon(Icons.search, size: 50.h),
          ),
        ),
        IconButton(
          onPressed:onPressed,
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: ColorsManager.blue,
            size: 50.h,
          ),
        ),
      ],
    );
  }
}
