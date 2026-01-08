import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/data/models/wishlist_response.dart';

abstract class WishlistRemoteDataSource {
  Future<void> addToWishlist({required String token,required String productID});
  Future<WishlistResponse> getWishlist({required String token});
}
