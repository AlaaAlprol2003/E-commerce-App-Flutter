import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/domain/entities/sub_category_entity.dart';

class SubCategory {
  final String sId;
  final String name;
  final String slug;
  final String category;
  final String createdAt;
  final String updatedAt;

  SubCategory({
    required this.sId,
    required this.name,
    required this.slug,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      sId: json['_id'],
      name: json['name'],
      slug: json['slug'],
      category: json['category'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  SubCategoryEntity toSubCategoryEntity()=> SubCategoryEntity(id: sId,  name: name);
}
