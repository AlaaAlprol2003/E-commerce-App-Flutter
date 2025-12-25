import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/data/models/category_response.dart';

abstract class CategoriesRemoteDataSource {
  Future<CategoriesResponse> getCategories();
}
