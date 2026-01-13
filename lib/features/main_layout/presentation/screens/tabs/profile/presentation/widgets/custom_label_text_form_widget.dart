import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/features/auth/presentation/widgets/label_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLabelTextFormWidget extends StatelessWidget {
  const CustomLabelTextFormWidget({super.key, required this.hintText, required this.labelText, required this.controller,this.secureField = false});
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final bool secureField;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelTextWidget(
          text: labelText,
          textColor: ColorsManager.darkBlue,
        ),
        SizedBox(height: 16.h),
        CustomTextFormField(
          hintText: hintText,
          isSecure:secureField ,
          hintFontWeight: FontWeight.w500,
          hintColor: ColorsManager.darkBlue,
          controller: controller,
          suffIcon: Icon(Icons.edit_square),
          borderColor: ColorsManager.blue.withValues(alpha: .3),
          keyboard: TextInputType.name,
          suffixColor: ColorsManager.darkBlue,
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
