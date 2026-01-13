import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/domain/entities/wishlist_item_entity.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/domain/use_cases/add_to_wishlist_use_case.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/domain/use_cases/delete_product_use_case.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/domain/use_cases/get_wishlist_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit({
    required this.addToWishlistUseCase,
    required this.getWishlistUseCase,
    required this.deleteProductUseCase,
  }) : super(WishlistInitial());
  AddToWishlistUseCase addToWishlistUseCase;
  GetWishlistUseCase getWishlistUseCase;
  DeleteProductUseCase deleteProductUseCase;
  List<WishlistItemEntity> items = [];
  void addToWishlist({required String productID}) async {
    emit(AddToWishlistLoading());
    final response = await addToWishlistUseCase(productID: productID);
    response.fold(
      ifLeft: (failure) {
        emit(AddToWishlistFailure(message: failure.message));
      },
      ifRight: (_) {
        getWishlist();
        emit(AddToWishlistSuccess());
      },
    );
  }

  void getWishlist() async {
    emit(GetWishlistLoading());
    final result = await getWishlistUseCase();
    result.fold(
      ifLeft: (failure) {
        emit(GetWishlistFailure(message: failure.message));
      },
      ifRight: (products) {
        items = products;
        emit(GetWishlistSuccess(favoriteProducts: products));
      },
    );
  }

  void deleteProductFromWishlist({required String productID}) async {
    emit(DeleteProductFromWishlistLoading());
    final result = await deleteProductUseCase(productID: productID);
    result.fold(
      ifLeft: (failure) {
        emit(DeleteProductFromWishlistFailure(message: failure.message));
      },
      ifRight: (_) {
        getWishlist();
        emit(DeleteProductFromWishlistSuccess());
      },
    );
  }
}

abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class AddToWishlistLoading extends WishlistState {}

class AddToWishlistFailure extends WishlistState {
  String message;
  AddToWishlistFailure({required this.message});
}

class AddToWishlistSuccess extends WishlistState {}

class GetWishlistLoading extends WishlistState {}

class GetWishlistFailure extends WishlistState {
  String message;
  GetWishlistFailure({required this.message});
}

class GetWishlistSuccess extends WishlistState {
  List<WishlistItemEntity> favoriteProducts;
  GetWishlistSuccess({required this.favoriteProducts});
}

class DeleteProductFromWishlistLoading extends WishlistState {}

class DeleteProductFromWishlistFailure extends WishlistState {
  String message;
  DeleteProductFromWishlistFailure({required this.message});
}

class DeleteProductFromWishlistSuccess extends WishlistState {}
