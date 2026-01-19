import 'package:e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:e_commerce/features/cart/domain/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce/features/cart/domain/use_cases/clear_cart_use_case.dart';
import 'package:e_commerce/features/cart/domain/use_cases/delete_product_from_cart.dart';
import 'package:e_commerce/features/cart/domain/use_cases/get_cart.dart';
import 'package:e_commerce/features/cart/domain/use_cases/update_cart_product_quality_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CartCubit extends Cubit<CartState> {
  AddToCartUseCase addToCartUseCase;
  GetCartUseCase getCartUseCase;
  UpdateCartProductQualityUseCase updateCartProductQualityUseCase;
  DeleteProductFromCartUseCase deleteProductFromCartUseCase;
  ClearCartUseCase clearCartUseCase;

  CartEntity? cart;
  CartCubit({
    required this.addToCartUseCase,
    required this.getCartUseCase,
    required this.updateCartProductQualityUseCase,
    required this.deleteProductFromCartUseCase,
    required this.clearCartUseCase,
  }) : super(Cartinitial());

  void addToCart({required String productID}) async {
    emit(AddToCartLoading());
    final result = await addToCartUseCase(productID: productID);
    result.fold(
      ifLeft: (failure) {
        emit(AddToCartFailure(message: failure.message));
      },
      ifRight: (_) {
        emit(AddToCartSuccess());
      },
    );
  }

  void getCart() async {
    emit(GetCartLoading());
    final result = await getCartUseCase();
    result.fold(
      ifLeft: (failure) {
        emit(GetCartFailure(message: failure.message));
      },
      ifRight: (cart) {
        this.cart = cart;
        emit(GetCartSuccess());
      },
    );
  }

  void updateCartProductQuantity({
    required String productID,
    required String count,
  }) async {
    emit(UpdateCartProductQuantityLoading());
    final result = await updateCartProductQualityUseCase(
      productID: productID,
      count: count,
    );
    result.fold(
      ifLeft: (failure) {
        emit(UpdateCartProductQuantityFailure(message: failure.message));
      },
      ifRight: (cart) {
        this.cart = cart;
        emit(UpdateCartProductQuantitySuccess());
      },
    );
  }

  void deleteProductFromCart({required String productID}) async {
    emit(DeleteProductFromCartLoading());
    final result = await deleteProductFromCartUseCase(productID: productID);
    result.fold(
      ifLeft: (failure) {
        emit(DeleteProductFromCartFailure(message: failure.message));
      },
      ifRight: (cart) {
        this.cart = cart;
        emit(DeleteProductFromCartSuccess());
      },
    );
  }

  void clearCart() async {
    emit(ClearCartLoading());
    final result = await clearCartUseCase();
    result.fold(
      ifLeft: (failure) {
        emit(ClearcartFailure(message: failure.message));
      },
      ifRight: (cart) {
        this.cart = null;
        emit(ClearCartSuccess());
      },
    );
  }

  void resetState() {
    emit(Cartinitial());
  }
}

abstract class CartState {}

class Cartinitial extends CartState {}

class AddToCartLoading extends CartState {}

class AddToCartFailure extends CartState {
  String message;
  AddToCartFailure({required this.message});
}

class AddToCartSuccess extends CartState {}

class GetCartLoading extends CartState {}

class GetCartFailure extends CartState {
  String message;
  GetCartFailure({required this.message});
}

class GetCartSuccess extends CartState {}

class UpdateCartProductQuantityLoading extends CartState {}

class UpdateCartProductQuantityFailure extends CartState {
  String message;
  UpdateCartProductQuantityFailure({required this.message});
}

class UpdateCartProductQuantitySuccess extends CartState {}

class DeleteProductFromCartLoading extends CartState {}

class DeleteProductFromCartSuccess extends CartState {}

class DeleteProductFromCartFailure extends CartState {
  String message;
  DeleteProductFromCartFailure({required this.message});
}

class ClearCartLoading extends CartState {}

class ClearcartFailure extends CartState {
  String message;
  ClearcartFailure({required this.message});
}

class ClearCartSuccess extends CartState {}
