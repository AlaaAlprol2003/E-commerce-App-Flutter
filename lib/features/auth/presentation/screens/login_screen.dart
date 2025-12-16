import 'package:e_commerce/core/resources/assets_manager.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/core/resources/ui_utils.dart';
import 'package:e_commerce/core/resources/validators.dart';
import 'package:e_commerce/core/routes_manager/routes.dart';
import 'package:e_commerce/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/features/auth/data/models/login_request.dart';
import 'package:e_commerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:e_commerce/features/auth/presentation/widgets/label_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool securePassword = true;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.blue,
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.only(
            top: 85,
            left: 12,
            right: 12,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    ImageAssets.routeLogo,
                    height: 71.h,
                    width: 237.w,
                  ),
                ),
                SizedBox(height: 70.h),
                Text(
                  "Welcome Back To Route",
                  style: GoogleFonts.poppins(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsManager.white,
                  ),
                ),
                Text(
                  "Please sign in with your mail",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                    color: ColorsManager.white,
                  ),
                ),
                SizedBox(height: 40.h),
                LabelTextWidget(text: "E-mail"),
                SizedBox(height: 24.h),
                CustomTextFormField(
                  hintText: "enter your email",
                  radius: 15,
                  controller: _emailController,
                  validator: Validator.emailValidate,
                ),
                SizedBox(height: 32.h),
                LabelTextWidget(text: "Password"),
                SizedBox(height: 24.h),
                CustomTextFormField(
                  controller: _passwordController,
                  validator: Validator.passwordValidate,
                  hintText: "enter your password",
                  keyboard: TextInputType.visiblePassword,
                  isSecure: securePassword,
                  suffIcon: IconButton(
                    onPressed: toggleBetweenSecureAndNotSecurePassword,
                    icon: Icon(
                      securePassword
                          ? Icons.visibility_off_rounded
                          : Icons.visibility,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomTextButton(
                    text: "Forget Password",
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 56.h),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is LoginLoading) {
                      UiUtils.showLoadingDialog(context);
                    } else if (state is LoginFailure) {
                      UiUtils.hideLoadingDialog(context);
                      UiUtils.showToastNotificationBar(
                        context,
                        state.message,
                        ColorsManager.white,
                        Colors.red,
                        Icons.error,
                      );
                    } else if (state is LoginSuccess) {
                      UiUtils.hideLoadingDialog(context);
                      UiUtils.showToastNotificationBar(
                        context,
                        "Logged-in Successfully",
                        ColorsManager.white,
                        Colors.green,
                        Icons.check_circle,
                      );
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.mainLayout,
                      );
                    }
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      labelText: "Login",
                      textColor: ColorsManager.blue,
                      radius: 15,
                      padding: 24,
                      bgColor: ColorsManager.white,
                      onPressed: () {
                        if (_formKey.currentState?.validate() == false) return;
                        BlocProvider.of<AuthCubit>(context).login(
                          LoginRequest(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Have Account?",
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorsManager.white,
                      ),
                    ),
                    CustomTextButton(
                      text: "Create Account",
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.register,
                        );
                      },
                    ),
                  ],
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
