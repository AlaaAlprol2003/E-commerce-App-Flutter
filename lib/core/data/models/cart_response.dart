import 'package:e_commerce/core/data/models/cart.dart';

class CartResponse {
  final String status;
  final String message;
  final int numOfCartItems;
  final String? cartId;
  final Cart? cart;

 const CartResponse({
    required this.status,
    required this.message,
    required this.numOfCartItems,
    required this.cartId,
    required this.cart,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      status: json['status']??"",
      message: json['message']??"",
      numOfCartItems: json['numOfCartItems']??0,
      cartId: json['cartId']??"",
      cart: json["data"] != null ? Cart.fromJson(json["data"]) : null,
    );
  }
}
