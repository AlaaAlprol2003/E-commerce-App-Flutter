import 'package:e_commerce/core/resources/assets_manager.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/core/resources/ui_utils.dart';
import 'package:e_commerce/core/resources/validators.dart';
import 'package:e_commerce/core/routes_manager/routes.dart';
import 'package:e_commerce/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/features/auth/data/models/register_request.dart';
import 'package:e_commerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:e_commerce/features/auth/presentation/widgets/label_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool securePassword = true;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(vertical: 85.0, horizontal: 12),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(ImageAssets.routeLogo, height: 71.h, width: 237.w),
                SizedBox(height: 60.h),
                LabelTextWidget(text: "Full Name"),
                SizedBox(height: 8.h),
                CustomTextFormField(
                  hintText: "enter your full name",
                  controller: _nameController,
                  validator: Validator.nameValidate,
                ),
                SizedBox(height: 20.h),
                LabelTextWidget(text: "Mobile Number"),
                SizedBox(height: 8.h),
                CustomTextFormField(
                  controller: _phoneController,
                  validator: Validator.phoneValidate,
                  hintText: "enter your mobile no.",
                  keyboard: TextInputType.phone,
                ),
                SizedBox(height: 20.h),
                LabelTextWidget(text: "E-mail address"),
                SizedBox(height: 8.h),
                CustomTextFormField(
                  controller: _emailController,
                  validator: Validator.emailValidate,
                  hintText: "enter your email address",
                  keyboard: TextInputType.emailAddress,
                ),
                SizedBox(height: 20.h),
                LabelTextWidget(text: "Password"),
                SizedBox(height: 8.h),
                CustomTextFormField(
                  controller: _passwordController,
                  validator: Validator.passwordValidate,
                  hintText: "enter your password",
                  isSecure: securePassword,
                  suffIcon: IconButton(
                    onPressed: toggleBetweenSecureAndNotSecurePassword,
                    icon: Icon(
                      securePassword
                          ? Icons.visibility_off_rounded
                          : Icons.visibility,
                    ),
                  ),
                  keyboard: TextInputType.visiblePassword,
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have Account?",
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorsManager.white,
                      ),
                    ),
                    CustomTextButton(
                      text: "Login",
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.login);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is RegisterLoading) {
                      UiUtils.showLoadingDialog(context);
                    } else if (state is RegisterFailure) {
                      UiUtils.hideLoadingDialog(context);
                      UiUtils.showToastNotificationBar(
                        context,
                        state.message,
                        ColorsManager.white,
                        Colors.red,
                        Icons.error,
                      );
                    } else if (state is RegisterSuccess) {
                      UiUtils.hideLoadingDialog(context);
                      UiUtils.showToastNotificationBar(
                        context,
                        "Successful Registiration",
                        ColorsManager.white,
                        Colors.green,
                        Icons.check_circle,
                      );
                      Navigator.pushReplacementNamed(context, Routes.login);
                    }
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() == false) return;
                        BlocProvider.of<AuthCubit>(context).register(
                          RegisterRequest(
                            name: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            rePassword: _passwordController.text,
                            phone: _phoneController.text,
                          ),
                        );
                      },
                      labelText: "Sign Up",
                      textColor: ColorsManager.blue,
                      radius: 15,
                      padding: 23,
                      bgColor: ColorsManager.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void toggleBetweenSecureAndNotSecurePassword() {
    setState(() {
      securePassword = !securePassword;
    });
  }
}
