import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/errors/app_exceptions.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/products/data/data_source/products_remote_data_source.dart';
import 'package:e_commerce/features/products/domain/entites/product_entity.dart';
import 'package:e_commerce/features/products/domain/repository/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  ProductsRemoteDataSource remoteDataSource;
  ProductsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts(
    String categoryID,
  ) async {
    try {
      final response = await remoteDataSource.getProducts(categoryID);
      return Right(
        response.products.map((product) => product.toProductEntity()).toList(),
      );
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.toString()));
    }
  }
}
