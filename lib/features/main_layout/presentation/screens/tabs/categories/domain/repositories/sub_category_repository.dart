import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/domain/entities/sub_category_entity.dart';

abstract class SubCategoryRepository {
  Future<Either<Failure,List<SubCategoryEntity>>> getSubcategories(String categoryID);
}