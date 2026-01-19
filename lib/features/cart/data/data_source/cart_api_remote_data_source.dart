// ignore_for_file: avoid_print


import 'package:dio/dio.dart';
import 'package:e_commerce/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:e_commerce/features/cart/data/models/cart_response.dart';
import 'package:e_commerce/core/errors/app_exceptions.dart';
import 'package:e_commerce/core/resources/constatnt_manager.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as:CartRemoteDataSource )
class CartApiRemoteDataSource implements CartRemoteDataSource {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiConstatnt.baseUrl));

  @override
  Future<void> addToCart({
    required String token,
    required String productID,
  }) async {
    try {
      await dio.post(
        ApiConstatnt.cartEndPoint,
        data: {"productId": productID},
        options: Options(headers: {"token": token}),
      );
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data["message"];
      }
      throw RemoteException(message: message ?? exception.toString());
    }
  }

  @override
  Future<CartResponse> getCart({required String token}) async {
    try {
      final response = await dio.get(
        ApiConstatnt.cartEndPoint,
        options: Options(headers: {"token": token}),
      );
      return CartResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data["message"];
      }
      throw RemoteException(message: message ?? exception.toString());
    }
  }

  @override
  Future<CartResponse> updateCartProductquantity({
    required String token,
    required String productID,
    required String count,
  }) async {
    try {
      final response = await dio.put(
        "${ApiConstatnt.cartEndPoint}/$productID",
        data: {"count": count},
        options: Options(headers: {"token": token}),
      );
      return CartResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data["message"];
      }
      throw RemoteException(message: message ?? exception.toString());
    }
  }

  @override
  Future<void> clearCart({required String token}) async {
    try {
     await dio.delete(ApiConstatnt.cartEndPoint,options: Options(headers: {"token":token}));
      
    } catch (exception) {
      print(exception.toString());
      String? message;
      if (exception is DioException) {
        message = exception.response?.data["message"];
      }
      throw RemoteException(message: message ?? exception.toString());
    }
  }

  @override
  Future<CartResponse> deleteProductFromCart({
    required String token,
    required String productID,
  }) async {
    try {
      final response = await dio.delete(
        "${ApiConstatnt.cartEndPoint}/$productID",
        options: Options(headers: {"token": token}),
      );
      return CartResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data["message"];
      }
      throw RemoteException(message: message ?? "Failed to get cart");
    }
  }
}
