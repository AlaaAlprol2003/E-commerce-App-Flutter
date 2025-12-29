import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/data/models/sub_categories_response.dart';

abstract class SubCategoriesRemoteDataSource {
  Future<SubCategoriesResponse> getSubcategories(String categoryID);
}
