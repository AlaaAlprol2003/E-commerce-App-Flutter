import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/entities/brand_entity.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/repositories/brands_repository.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class GetBrandsUseCase {
  BrandsRepository brandsRepository;
  GetBrandsUseCase({required this.brandsRepository});

  Future<Either<Failure, List<BrandEntity>>> call() {
    return brandsRepository.getBrands();
  }
}
