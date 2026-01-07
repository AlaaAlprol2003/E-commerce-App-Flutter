import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/entities/category_entity.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/repositories/categories_repository.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class GetCategoriesUseCase {
  CategoriesRepository categoriesRepository;
  GetCategoriesUseCase({required this.categoriesRepository});

  Future<Either<Failure, List<CategoryEntity>>> call() {
    return categoriesRepository.getCategories();
  }
}
