// ignore_for_file: avoid_print

import 'package:dart_either/dart_either.dart';
import 'package:e_commerce/core/data/data_source/cart_remote_data_source.dart';
import 'package:e_commerce/core/domain/entities/cart_entity.dart';
import 'package:e_commerce/core/domain/repositories/cart_repository.dart';
import 'package:e_commerce/core/errors/app_exceptions.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/data/data_sources/local/auth_shared_prefs_local_data_source.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as:CartRepository )
class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource remoteDataSource;
  CartRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> addToCart({required String productID}) async {
    try {
      AuthSharedPrefsLocalDataSource authSharedPrefsLocalDataSource =
          AuthSharedPrefsLocalDataSource();
      String token = await authSharedPrefsLocalDataSource.getToken();
      print(token);
      await remoteDataSource.addToCart(token: token, productID: productID);
      return Right(null);
    } on AppExceptions catch (exception) {
      return Left(Failure(message: exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearCart() async {
    AuthSharedPrefsLocalDataSource authSharedPrefsLocalDataSource =
        AuthSharedPrefsLocalDataSource();
    String token = await authSharedPrefsLocalDataSource.getToken();
    try {
       await remoteDataSource.clearCart(token: token);
      return Right(null);
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.toString()));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> deleteProductFromCart({
    required String productID,
  }) async {
    AuthSharedPrefsLocalDataSource authSharedPrefsLocalDataSource =
        AuthSharedPrefsLocalDataSource();
    String token = await authSharedPrefsLocalDataSource.getToken();
    try {
      final response = await remoteDataSource.deleteProductFromCart(
        token: token,
        productID: productID,
      );
      return Right(
        response.cart!.toCartEntity()
      );
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> getCart() async {
    AuthSharedPrefsLocalDataSource authSharedPrefsLocalDataSource =
        AuthSharedPrefsLocalDataSource();
    String token = await authSharedPrefsLocalDataSource.getToken();
    try {
      final response = await remoteDataSource.getCart(token: token);
      return Right(
        response.cart!.toCartEntity()
      );
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> updateCartProductquantity({
    required String productID,
    required String count,
  }) async {
    AuthSharedPrefsLocalDataSource authSharedPrefsLocalDataSource =
        AuthSharedPrefsLocalDataSource();
    String token = await authSharedPrefsLocalDataSource.getToken();
    try {
      final response = await remoteDataSource.updateCartProductquantity(
        token: token,
        productID: productID,
        count: count
      );
      return Right(
        response.cart!.toCartEntity()
      );
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
