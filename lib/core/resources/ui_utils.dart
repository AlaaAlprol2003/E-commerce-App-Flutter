import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

class UiUtils {
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => PopScope(
        canPop: false,
        child: Center(
          child: CircularProgressIndicator(color: ColorsManager.blue),
        ),
      ),
    );
  }

  static void hideLoadingDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static void showToastNotificationBar(
    BuildContext context,
    String message,
    Color fgColor,
    Color bgColor,
    IconData icon,
  ) {
    toastification.show(
      context: context,
      description: Text(message,style: GoogleFonts.poppins(fontSize: 20.sp,fontWeight: FontWeight.w600,color: ColorsManager.white),),
      foregroundColor: fgColor,
      backgroundColor: bgColor,
      borderRadius: BorderRadius.circular(16),
      icon: Icon(icon, color: ColorsManager.darkBlue),
      borderSide: BorderSide(color: ColorsManager.blue, width: 2.w),
      closeButton: ToastCloseButton(buttonBuilder: (context, onClose) {
        return Icon(Icons.close,color: ColorsManager.darkBlue,);
      },showType: CloseButtonShowType.always),
      autoCloseDuration: Duration(seconds:4),
    );
  }
}
