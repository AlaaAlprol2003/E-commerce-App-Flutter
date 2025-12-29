import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/data/models/sub_category.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/data/models/meta_data.dart';

class SubCategoriesResponse {
  final int results;
  final Meta metadata;
  final List<SubCategory> subcategories;

  SubCategoriesResponse({
    required this.results,
    required this.metadata,
    required this.subcategories,
  });

  factory SubCategoriesResponse.fromJson(Map<String, dynamic> json) {
    return SubCategoriesResponse(
      results: json['results'],
      metadata: Meta.fromJson(json['metadata']),
      subcategories: (json["data"] as List<dynamic>)
          .map((json) => SubCategory.fromJson(json))
          .toList(),
    );
  }
}
