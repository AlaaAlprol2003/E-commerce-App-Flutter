import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class UpdateCartProductQualityUseCase {
  CartRepository cartRepository;
  UpdateCartProductQualityUseCase({required this.cartRepository});

  Future<Either<Failure, CartEntity>> call({
    required String productID,
    required String count,
  }) {
    return cartRepository.updateCartProductquantity(
      productID: productID,
      count: count,
    );
  }
}
