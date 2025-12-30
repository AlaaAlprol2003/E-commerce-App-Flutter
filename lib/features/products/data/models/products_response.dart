import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/data/models/meta_data.dart';
import 'package:e_commerce/features/products/data/models/product.dart';

class ProductsResponse {
  final int results;
  final Meta metadata;
  final List<Product> products;

  ProductsResponse({
    required this.results,
    required this.metadata,
    required this.products,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      results: json['results'] ?? 0,
      metadata: Meta.fromJson(json['metadata']),
      products:
          (json['data'] as List?)
              ?.where((e) => e != null)
              .map((e) => Product.fromJson(e))
              .toList() ??
          [],
    );
  }
}
