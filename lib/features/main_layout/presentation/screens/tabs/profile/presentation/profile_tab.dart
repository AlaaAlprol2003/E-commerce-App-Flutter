import 'package:e_commerce/core/resources/assets_manager.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/core/widgets/user_data_shared_prefs.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/profile/presentation/widgets/custom_label_text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  List<String>? userData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    List<String> data = await UserDataSharedPrefs.getUserData();
    if (data.isNotEmpty) {
      nameController.text = data[0];
      emailController.text = data[1];
      passwordController.text = data[2];
      mobileController.text = data[3];
    }
    setState(() {
      userData = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(ImageAssets.route),
                SizedBox(height: 24.h),
                Text(
                  "Welcome,${userData?[0].substring(0,5) ?? ""}",
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.darkBlue,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  userData?[1]?? "",
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
