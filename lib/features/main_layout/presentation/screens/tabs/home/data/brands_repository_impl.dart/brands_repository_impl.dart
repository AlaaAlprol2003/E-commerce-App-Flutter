import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/errors/app_exceptions.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/data/data_source/brands_remote_data_source.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/entities/brand_entity.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/repositories/brands_repository.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as:BrandsRepository )
class BrandsRepositoryImpl implements BrandsRepository {
  BrandsRemoteDataSource brandsRemoteDataSource;
  BrandsRepositoryImpl({required this.brandsRemoteDataSource});

  @override
  Future<Either<Failure, List<BrandEntity>>> getBrands() async {
    try {
      var response = await brandsRemoteDataSource.getBrands();
      return Right(
        response.brands.map((brand) => brand.toBrandEntity()).toList(),
      );
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
