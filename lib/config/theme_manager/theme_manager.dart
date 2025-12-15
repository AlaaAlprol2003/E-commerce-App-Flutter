import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';

abstract class ThemeManager {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorsManager.blue,
  ); 
  static ThemeData dark = ThemeData(); 
}