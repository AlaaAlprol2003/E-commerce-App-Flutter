import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/entities/brand_entity.dart';

abstract class BrandsRepository {
  Future<Either<Failure, List<BrandEntity>>> getBrands();
}
