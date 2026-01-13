import 'package:e_commerce/features/cart/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;
  final num totalCartPrice;
  final String? sId;

  const CartEntity({
    required this.sId,
    required this.totalCartPrice,
    required this.cartItems,
  });
}
