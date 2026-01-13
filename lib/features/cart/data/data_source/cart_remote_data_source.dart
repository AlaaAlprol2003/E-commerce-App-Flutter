
import 'package:e_commerce/features/cart/data/models/cart_response.dart';

abstract class CartRemoteDataSource {
  Future<void> addToCart({required String token, required String productID});
  Future<CartResponse> getCart({required String token});
  Future<CartResponse> updateCartProductquantity({
    required String token,
    required String productID,
    required String count,
  });
  Future<CartResponse> deleteProductFromCart({
    required String token,
    required String productID,
  });
  Future<void> clearCart({required String token});
}
