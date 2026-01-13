import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/domain/entities/wishlist_item_entity.dart';

class WishlistProduct {
  final num sold;
  final List<String> images;
  final int ratingsQuantity;
  final String sId;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final num price;
  final String imageCover;
  final num ratingsAverage;
  final String createdAt;
  final String updatedAt;
  final int iV;
  final String id;

  WishlistProduct({
    required this.sold,
    required this.images,
    required this.ratingsQuantity,
    required this.sId,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCover,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
    required this.iV,
    required this.id,
  });

  factory WishlistProduct.fromJson(Map<String, dynamic> json) {
    return WishlistProduct(
      sold: json['sold'],
      images:List<String>.from(json['images']),
      ratingsQuantity: json['ratingsQuantity'],
      sId: json['_id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      quantity: json['quantity'],
      price: json['price'],
      imageCover: json['imageCover'],
      ratingsAverage: json['ratingsAverage'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v'],
      id: json['id'],
    );
  }

  WishlistItemEntity toWishlistItem() =>
      WishlistItemEntity(imageCover: imageCover, title: title, price: price,id: id,ratingsAverage: ratingsAverage);
}
