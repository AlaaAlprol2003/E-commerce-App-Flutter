import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/products/domain/entites/product_entity.dart';
import 'package:e_commerce/features/products/domain/repository/products_repository.dart';

class GetProductsUseCase {
  ProductsRepository productsRepository;
  GetProductsUseCase({required this.productsRepository});

  Future<Either<Failure, List<ProductEntity>>> call(String categoryID) {
    return productsRepository.getProducts(categoryID);
  }
}
