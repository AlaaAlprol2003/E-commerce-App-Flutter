import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/data/models/wishlist_product.dart';

class WishlistResponse {
  final String status;
  final int count;
  final List<WishlistProduct> favoriteProducts;

  WishlistResponse({
    required this.status,
    required this.count,
    required this.favoriteProducts,
  });

  factory WishlistResponse.fromJson(Map<String, dynamic> json) {
    return WishlistResponse(
      status: json['status'],
      count: json['count'],
      favoriteProducts: (json['data'] as List<dynamic>)
          .map((json) => WishlistProduct.fromJson(json))
          .toList(),
    );
  }
}
