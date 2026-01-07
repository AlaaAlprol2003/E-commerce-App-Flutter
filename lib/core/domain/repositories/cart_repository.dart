import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/domain/entities/cart_entity.dart';
import 'package:e_commerce/core/errors/failure.dart';

abstract class CartRepository {
  Future<Either<Failure, void>> addToCart({required String productID});
  Future<Either<Failure, CartEntity>> getCart();
  Future<Either<Failure, CartEntity>> updateCartProductquantity({
    required String productID,
    required String count,
  });
  Future<Either<Failure, CartEntity>> deleteProductFromCart({
    required String productID,
  });
  Future<Either<Failure, void>> clearCart();
}
