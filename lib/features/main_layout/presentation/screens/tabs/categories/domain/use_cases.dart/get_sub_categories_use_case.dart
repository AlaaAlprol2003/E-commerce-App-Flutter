import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/domain/entities/sub_category_entity.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/domain/repositories/sub_category_repository.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class GetSubCategoriesUseCase {
  SubCategoryRepository subCategoryRepository;
  GetSubCategoriesUseCase({required this.subCategoryRepository});

  Future<Either<Failure, List<SubCategoryEntity>>> call(String categoryID) {
    return subCategoryRepository.getSubcategories(categoryID);
  }
}
