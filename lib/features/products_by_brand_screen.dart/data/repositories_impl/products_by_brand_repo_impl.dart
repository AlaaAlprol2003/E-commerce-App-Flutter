import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/errors/app_exceptions.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/products/domain/entites/product_entity.dart';
import 'package:e_commerce/features/products_by_brand_screen.dart/data/data_sources/products_remote_data_source_by_brand.dart';
import 'package:e_commerce/features/products_by_brand_screen.dart/domain/repositories/products_by_brand_repository.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as:ProductsByBrandRepository)
class ProductsByBrandRepoImpl implements ProductsByBrandRepository {
  ProductsRemoteDataSourceByBrand remoteDataSourceByBrand;
  ProductsByBrandRepoImpl({required this.remoteDataSourceByBrand});
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts({
    required String brandID,
  }) async {
    try {
      final response = await remoteDataSourceByBrand.getProducts(
        brandID: brandID,
      );
      return Right(
        response.products.map((product) => product.toProductEntity()).toList(),
      );
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
