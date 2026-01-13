import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/errors/app_exceptions.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/data/data_sources/local/auth_shared_prefs_local_data_source.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/data/data_sources/wishlist_remote_data_source.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/domain/entities/wishlist_item_entity.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/domain/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: WishlistRepository)
class WishlistRepositoryImpl implements WishlistRepository {
  WishlistRemoteDataSource remoteDataSource;
  WishlistRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, void>> addToCart({required String productID}) async {
    try {
      AuthSharedPrefsLocalDataSource authSharedPrefsLocalDataSource =
          AuthSharedPrefsLocalDataSource();
      String token = await authSharedPrefsLocalDataSource.getToken();
      await remoteDataSource.addToWishlist(token: token, productID: productID);
      return Right(null);
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, List<WishlistItemEntity>>> getWishlist() async {
    try {
      AuthSharedPrefsLocalDataSource authSharedPrefsLocalDataSource =
          AuthSharedPrefsLocalDataSource();
      String token = await authSharedPrefsLocalDataSource.getToken();

      final response = await remoteDataSource.getWishlist(token: token);
      return Right(
        response.favoriteProducts
            .map((product) => product.toWishlistItem())
            .toList(),
      );
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProductFromWishlist({
    required String productID,
  }) async {
    try {
      AuthSharedPrefsLocalDataSource authSharedPrefsLocalDataSource =
          AuthSharedPrefsLocalDataSource();
      String token = await authSharedPrefsLocalDataSource.getToken();
      await remoteDataSource.deleteProductFromWishlist(
        token: token,
        productId: productID,
      );
      return Right(null);
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
