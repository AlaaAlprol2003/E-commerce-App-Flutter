import 'package:dart_either/src/dart_either.dart';
import 'package:e_commerce/core/errors/app_exceptions.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/data/data_source/categories_remote_data_source.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/entities/category_entity.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/repositories/categories_repository.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as:CategoriesRepository )
class CategoriesRepositoryImp implements CategoriesRepository {
  CategoriesRemoteDataSource remoteDataSource;
  CategoriesRepositoryImp({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final response = await remoteDataSource.getCategories();
      return Right(
        response.categories
            .map(
              (category) => CategoryEntity(
                id: category.sId,
                name: category.name,
                image: category.image,
              ),
            )
            .toList(),
      );
    } on RemoteException catch (exception) {
      print(exception.toString());
      return Left(Failure(message: exception.message));
    }
  }
}
