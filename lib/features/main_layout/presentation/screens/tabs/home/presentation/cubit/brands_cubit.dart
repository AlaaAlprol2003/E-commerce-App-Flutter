import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/entities/brand_entity.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/use_cases/brands_use_case.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/use_cases/products_by_brand_use_case.dart';
import 'package:e_commerce/features/products/domain/entites/product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BrandsCubit extends Cubit<BrandsState> {
  GetBrandsUseCase brandsUseCase;
  ProductsByBrandUseCase productsByBrandUseCase;
  BrandsCubit({
    required this.brandsUseCase,
    required this.productsByBrandUseCase,
  }) : super(Brandsinitial()) {
    getAllBrands();
  }

  void getAllBrands() async {
    emit(BrandsLoading());
    final result = await brandsUseCase.call();
    result.fold(
      ifLeft: (failure) {
        emit(BrandsFailure(message: failure.message));
      },
      ifRight: (brandsList) {
        emit(BrandsSuccess(brands: brandsList));
      },
    );
  }

  void getProductsByBrand({required String brandID}) async {
    emit(ProductsByBrandLoading());
    final result = await productsByBrandUseCase(brandID: brandID);
    result.fold(
      ifLeft: (failure) {
        emit(ProductsByBrandError(message: failure.message));
      },
      ifRight: (products) {
        emit(ProductsByBrandSuccess(products: products));
      },
    );
  }
}

abstract class BrandsState {}

class Brandsinitial extends BrandsState {}

class BrandsLoading extends BrandsState {}

class BrandsFailure extends BrandsState {
  String message;
  BrandsFailure({required this.message});
}

class BrandsSuccess extends BrandsState {
  List<BrandEntity> brands;
  BrandsSuccess({required this.brands});
}

class ProductsByBrandLoading extends BrandsState {}

class ProductsByBrandError extends BrandsState {
  String message;
  ProductsByBrandError({required this.message});
}

class ProductsByBrandSuccess extends BrandsState {
  List<ProductEntity> products;
  ProductsByBrandSuccess({required this.products});
}
