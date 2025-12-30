import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/domain/entities/sub_category_entity.dart';

class SubCategory {
  final String id;
  final String name;
  final String slug;
  final String category; // ✅ String ID

  SubCategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.category,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      category: json['category'] ?? '',
    );
  }
  SubCategoryEntity toSubCategoryEntity()=> SubCategoryEntity(id: id,  name: name);
}


  

