// ignore_for_file: unnecessary_new

import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/data/models/sub_category.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/data/models/category.dart';
import 'package:e_commerce/features/products/domain/entites/product_entity.dart';

class Product {
  final num? sold;
  final List<String> images;
  final List<SubCategory> subcategory;
  final num? ratingsQuantity;
  final String sId;
  final String title;
  final String slug;
  final String description;
  final num quantity;
  final num price;
  final String imageCover;
  final Category category;
  final Category brand;
  final num? ratingsAverage;
  final String createdAt;
  final String updatedAt;
  final String id;
  final num? priceAfterDiscount;
  final List<dynamic>? availableColors;

  Product({
    required this.sold,
    required this.images,
    required this.subcategory,
    required this.ratingsQuantity,
    required this.sId,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    this.priceAfterDiscount,
    this.availableColors,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      sold: json['sold'],
      images:
          (json['images'] as List?)
              ?.where((e) => e != null)
              .map((e) => e.toString())
              .toList() ??
          [],
      subcategory:
          (json['subcategory'] as List?)
              ?.where((e) => e != null)
              .map((e) => SubCategory.fromJson(e))
              .toList() ??
          [],

      ratingsQuantity: (json['ratingsQuantity'] ?? 0) as num,
      sId: json['_id'] ?? '',
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: json['price'] ?? 0,
      imageCover: json['imageCover'] ?? '',
      category: Category.fromJson(json['category']),
      brand: Category.fromJson(json['brand']),
      ratingsAverage: (json['ratingsAverage'] ?? 0) as num,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      id: json['id'] ?? '',
      priceAfterDiscount: json['priceAfterDiscount'],
      availableColors: (json['availableColors'] as List?)
          ?.where((e) => e != null)
          .toList(),
    );
  }

  ProductEntity toProductEntity() => ProductEntity(
    sId: sId,
    title: title,
    sold: sold,
    images: images,
    description: description,
    quantity: quantity,
    price: price,
    imageCover: imageCover.isNotEmpty
        ? imageCover
        : 'https://via.placeholder.com/150',
    priceAfterDiscount: priceAfterDiscount,
    availableColors: availableColors,
    ratingsAverage: ratingsAverage,
    ratingsQuantity: ratingsQuantity,
  );
}
