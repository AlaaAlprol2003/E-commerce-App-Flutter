import 'package:e_commerce/features/products/domain/entites/product_entity.dart';
import 'package:e_commerce/features/products/domain/use_cases/get_products_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  GetProductsUseCase getProductsUseCase;
  ProductsCubit({required this.getProductsUseCase}) : super(ProductsInitial());

  void getProducts(String categoryID) async {
    emit(ProductsLoading());
    final result = await getProductsUseCase(categoryID);
    result.fold(
      ifLeft: (failure) {
        emit(ProductsFailure(message: failure.message));
      },
      ifRight: (products) {
        emit(ProductsSuccess(products: products));
      },
    );
  }
}

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsFailure extends ProductsState {
  String message;
  ProductsFailure({required this.message});
}

class ProductsSuccess extends ProductsState {
  List<ProductEntity> products;
  ProductsSuccess({required this.products});
}
