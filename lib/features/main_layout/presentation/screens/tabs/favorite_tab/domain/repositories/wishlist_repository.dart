import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/domain/entities/wishlist_item_entity.dart';

abstract class WishlistRepository {
  Future<Either<Failure, void>> addToCart({required String productID});
  Future<Either<Failure, List<WishlistItemEntity>>> getWishlist();
}
