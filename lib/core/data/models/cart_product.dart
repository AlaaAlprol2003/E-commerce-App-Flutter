import 'package:e_commerce/core/domain/entities/cart_product_entity.dart';

class CartProduct {
  final String title;
  
  final String imageCover;
  final double ratingsAverage;
  final String id;

  const CartProduct({
    required this.title,
   
    required this.imageCover,
    required this.ratingsAverage,
    required this.id,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      title: json['title'] ?? "",
     
      imageCover: json['imageCover'] ?? "",
      ratingsAverage:(json['ratingsAverage'] as num?)?.toDouble() ?? 0.0,
      id: json['id']??"",
    );
  }

  CartProductEntity toCartProductEntity()=> CartProductEntity(title: title, imageCover: imageCover, id: id);
}
