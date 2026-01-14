import 'package:e_commerce/features/products/domain/entites/product_entity.dart';
import 'package:e_commerce/features/products_by_brand_screen.dart/domain/use_cases/products_by_brand_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ProductsByBrandCubit extends Cubit<ProductsByBrandState> {
  ProductsByBrandCubit({required this.productsByBrandUseCase})
    : super(ProductsByBrandInitial());
  ProductsByBrandUseCase productsByBrandUseCase;

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

abstract class ProductsByBrandState {}

class ProductsByBrandInitial extends ProductsByBrandState {}

class ProductsByBrandLoading extends ProductsByBrandState {}

class ProductsByBrandError extends ProductsByBrandState {
  String message;
  ProductsByBrandError({required this.message});
}

class ProductsByBrandSuccess extends ProductsByBrandState {
  List<ProductEntity> products;
  ProductsByBrandSuccess({required this.products});
}
