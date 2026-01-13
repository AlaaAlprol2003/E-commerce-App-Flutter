import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/repositories/products_by_brand_repository.dart';
import 'package:e_commerce/features/products/domain/entites/product_entity.dart';

class ProductsByBrandUseCase {
  ProductsByBrandRepository productsByBrandRepository;
  ProductsByBrandUseCase({required this.productsByBrandRepository});

  Future<Either<Failure, List<ProductEntity>>> call({required String brandID}) {
    return productsByBrandRepository.getProducts(brandID: brandID);
  }
}
