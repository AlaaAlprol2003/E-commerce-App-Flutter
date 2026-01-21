import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAnimatedText {
  static Widget wavyAnimatedText({
    required String text,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return DefaultTextStyle(
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: ColorsManager.white,
      ),
      child: AnimatedTextKit(
        repeatForever: true,
        animatedTexts: [WavyAnimatedText(text)],
        isRepeatingAnimation: true,
        onTap: () {},
      ),
    );
  }

  static Widget flickerAnimatedText({
    required String text,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return DefaultTextStyle(
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: Colors.white,
        shadows: [
          Shadow(blurRadius: 7.0, color: Colors.white, offset: Offset(0, 0)),
        ],
      ),
      child: AnimatedTextKit(
        repeatForever: true,

        animatedTexts: [FlickerAnimatedText(text)],
        onTap: () {},
      ),
    );
  }

  static Widget scrambleAnimatedText({
    required String text,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return DefaultTextStyle(
      style: GoogleFonts.poppins(fontSize: fontSize, fontWeight: fontWeight),
      child: AnimatedTextKit(
        isRepeatingAnimation: true,
        repeatForever: true,
        animatedTexts: [
          ScrambleAnimatedText(text, speed: Duration(milliseconds: 300)),
        ],
        onTap: () {},
      ),
    );
  }

  static Widget scaleAnimatedText({
    required String text,
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
  }) {
    return DefaultTextStyle(
      style:  GoogleFonts.cantoraOne(fontSize: fontSize,fontWeight: fontWeight,color: color),
      child: AnimatedTextKit(
        repeatForever: true,
        isRepeatingAnimation: true,
        
        animatedTexts: [ScaleAnimatedText(text)],
        onTap: () {},
      ),
    );
  }
}
