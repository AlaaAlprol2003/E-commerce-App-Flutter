import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:injectable/injectable.dart' ;
@lazySingleton
class ClearCartUseCase {
  CartRepository cartRepository;
  ClearCartUseCase({required this.cartRepository});

  Future<Either<Failure, void>> call() {
    return cartRepository.clearCart();
  }
}
