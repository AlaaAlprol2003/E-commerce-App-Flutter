import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';

class ProductDetailsProvider extends ChangeNotifier {
  int counter = 1;
  int selectedIndex = 0;
  int selectedSize = 0;
  int selectedColor = 0;
  final List<int> sizes = [38, 39, 40, 41, 42, 43];
  final List<Color> colors = [
    ColorsManager.black,
    Colors.red,
    ColorsManager.blue,
    Colors.green,
    Colors.brown,
  ];

  void incrementCounter(){
    counter++;
    notifyListeners();
  }

  void decrementCounter(){
    if(counter == 1) return;
    counter--;
    notifyListeners();
  }

  void carouselPageChange(int currentIndex,_){
    selectedIndex = currentIndex;
    notifyListeners();
  }

  void assignSelectedSize(int index){
    selectedSize = index;
    notifyListeners();
  }

  void assignSelectedColor(int index){
    selectedColor = index;
    notifyListeners();
  }
}