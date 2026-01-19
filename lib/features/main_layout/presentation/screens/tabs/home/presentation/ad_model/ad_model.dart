import 'package:e_commerce/core/resources/assets_manager.dart';

class AdModel {
  String discount;
  String content;
  String imagePath;

  AdModel({
    required this.discount,
    required this.content,
    required this.imagePath,
  });

  static List<AdModel> ads = [
    AdModel(
      discount: "UP TO 25% OFF",
      content: "For all Headphones\n& AirPods",
      imagePath: ImageAssets.offer,
    ),
    AdModel(
      discount: "UP TO 30% OFF",
      content: "For Laptops\n& Mobiles",
      imagePath: ImageAssets.ad2,
    ),
    AdModel(
      discount: "UP TO 20% OFF",
      content: "For all Makeup\n& Skincare",
      imagePath: ImageAssets.ad3,
    ),
  ];
}
