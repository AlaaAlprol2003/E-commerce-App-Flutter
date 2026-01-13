import 'package:e_commerce/features/cart/data/models/cart_product.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item_entity.dart';

class CartItem {
  final int count;
  final String sId;
  final CartProduct product;
  final int price;

  const CartItem({
    required this.count,
    required this.sId,
    required this.product,
    required this.price,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      count: json['count'],
      sId: json['_id'],
      product: CartProduct.fromJson(json['product']),
      price: (json['price'] as num?)?.toInt() ?? 0,
    );
  }

  CartItemEntity toCartItemEntity()=> CartItemEntity(count: count, sId: sId, product: product.toCartProductEntity(), price: price);
}
