import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/errors/app_exceptions.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/data/data_sources/sub_categories_remote_data_source.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/domain/entities/sub_category_entity.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/domain/repositories/sub_category_repository.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as:SubCategoryRepository )
class SubCategoryRepositoryImpl implements SubCategoryRepository {
  SubCategoriesRemoteDataSource remoteDataSource;
  SubCategoryRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<SubCategoryEntity>>> getSubcategories(
    String categoryID,
  ) async {
    try {
      final response = await remoteDataSource.getSubcategories(categoryID);
      return Right(
        response.subcategories
            .map((subcategory) => subcategory.toSubCategoryEntity())
            .toList(),
      );
    } on AppExceptions catch (exception) {
      return Left(Failure(message: exception.toString()));
    }
  }
}
