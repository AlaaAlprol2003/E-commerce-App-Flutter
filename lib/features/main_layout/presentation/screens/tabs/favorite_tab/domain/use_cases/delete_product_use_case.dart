import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/domain/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class DeleteProductUseCase {
  WishlistRepository wishlistRepository;
  DeleteProductUseCase({required this.wishlistRepository});

  Future<Either<Failure, void>> call({required String productID}) {
    return wishlistRepository.deleteProductFromWishlist(productID: productID);
  }
}
