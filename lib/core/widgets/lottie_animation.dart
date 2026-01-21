import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation {
  static Widget loading() {
    return Lottie.asset(
      "assets/animations/loading3.json",
      width: 400,

      height: 400,
      errorBuilder: (context, error, stackTrace) =>
          Center(child: SingleChildScrollView()),
    );
  }

  static Widget loading1() {
    return Lottie.asset(
      "assets/animations/loading2.json",
      width: 400,

      height: 400,
      errorBuilder: (context, error, stackTrace) =>
          Center(child: SingleChildScrollView()),
    );
  }

  static Widget emptyBox() {
    return Lottie.asset(
      "assets/animations/empty_box_blue.json",
      width: 400,

      height: 400,
      errorBuilder: (context, error, stackTrace) =>
          Center(child: SingleChildScrollView()),
    );
  }
}
