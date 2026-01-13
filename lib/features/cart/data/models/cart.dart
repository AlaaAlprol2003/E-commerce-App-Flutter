import 'package:e_commerce/features/cart/data/models/cart_item.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_entity.dart';

class Cart {
  final List<CartItem> cartItems;
  final num totalCartPrice;
  final String? sId;
  final String? cartOwner;
  final String? createdAt;
  final String? updatedAt;
  final int? iV;

  const Cart({
    required this.sId,
    required this.cartOwner,
    required this.cartItems,
    required this.createdAt,
    required this.updatedAt,
    required this.iV,
    required this.totalCartPrice,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      sId: json['_id'] ,
      cartOwner: json['cartOwner'],
      cartItems: (json["products"] as List<dynamic>)
          .map((product) => CartItem.fromJson(product))
          .toList(),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v'],
      totalCartPrice: json['totalCartPrice'],
    );
  }

  CartEntity toCartEntity() => CartEntity(
    sId: sId,
    totalCartPrice: totalCartPrice,
    cartItems: cartItems
        .map((cartItem) => cartItem.toCartItemEntity())
        .toList(),
  );
}
