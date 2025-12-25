import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/data/models/brand.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/data/models/meta_data.dart';

class BrandsResponse {
  final int results;
  final Meta metadata;
  final List<Brand> brands;

  BrandsResponse({
    required this.results,
    required this.metadata,
    required this.brands,
  });

  factory BrandsResponse.fromJson(Map<String, dynamic> json) {
    return BrandsResponse(
      results: json['results'],
      metadata: Meta.fromJson(json['metadata']),
      brands: (json["data"] as List<dynamic>)
          .map((json) => Brand.fromJson(json))
          .toList(),
    );
  }
}
