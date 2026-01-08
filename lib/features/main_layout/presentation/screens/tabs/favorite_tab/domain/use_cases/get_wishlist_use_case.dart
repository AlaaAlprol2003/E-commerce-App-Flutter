import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/domain/entities/wishlist_item_entity.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/domain/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class GetWishlistUseCase {
  WishlistRepository wishlistRepository;
  GetWishlistUseCase({required this.wishlistRepository});

  Future<Either<Failure, List<WishlistItemEntity>>> call() {
    return wishlistRepository.getWishlist();
  }
}
