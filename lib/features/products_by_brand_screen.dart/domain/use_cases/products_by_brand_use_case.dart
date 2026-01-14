import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/products/domain/entites/product_entity.dart';
import 'package:e_commerce/features/products_by_brand_screen.dart/domain/repositories/products_by_brand_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class ProductsByBrandUseCase {
  ProductsByBrandRepository productsByBrandRepository;
  ProductsByBrandUseCase({required this.productsByBrandRepository});

  Future<Either<Failure, List<ProductEntity>>> call({required String brandID}) {
    return productsByBrandRepository.getProducts(brandID: brandID);
  }
}
