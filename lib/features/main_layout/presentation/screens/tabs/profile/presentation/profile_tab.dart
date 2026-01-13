import 'package:e_commerce/core/resources/assets_manager.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/profile/presentation/widgets/custom_label_text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController mobileController = TextEditingController();
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(ImageAssets.route),
          SizedBox(height: 24.h),
          Text(
            "Welcome,Mohamed",
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: ColorsManager.darkBlue,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "mohamed.N@gmail.com",
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: ColorsManager.darkBlue.withValues(alpha: .6),
            ),
          ),
          SizedBox(height: 40.h),
          CustomLabelTextFormWidget(
            hintText: "Mohamed Mohamed Nabil",
            labelText: "Your full name",
            controller: nameController,
          ),
          CustomLabelTextFormWidget(
            hintText: "mohamed.N@gmail.com",
            labelText: "Your E-mail",
            controller: emailController,
          ),
          CustomLabelTextFormWidget(
            hintText: "81932132841284",
            labelText: "Your password",
            controller: passwordController,
            secureField: true,
          ),
          CustomLabelTextFormWidget(
            hintText: "01556477081",
            labelText: "Your mobile number",
            controller: mobileController,
          ),
        ],
      ),
    );
  }
}
