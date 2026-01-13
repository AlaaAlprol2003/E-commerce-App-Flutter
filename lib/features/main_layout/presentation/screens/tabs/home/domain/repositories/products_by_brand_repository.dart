import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/products/domain/entites/product_entity.dart';

abstract class ProductsByBrandRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts({required String brandID});
}
