import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/data/models/category.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/data/models/meta_data.dart';

class CategoriesResponse {
  final int results;
  final Meta metadata;
  final List<Category> categories;

  CategoriesResponse({
    required this.results,
    required this.metadata,
    required this.categories,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesResponse(
      results: json['results'],
      metadata: Meta.fromJson(json['metadata']),
      categories: (json["data"] as List<dynamic>)
          .map((json) => Category.fromJson(json))
          .toList(),
    );
  }

 
}
