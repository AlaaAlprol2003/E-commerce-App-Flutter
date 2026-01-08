import 'package:dio/dio.dart';
import 'package:e_commerce/core/errors/app_exceptions.dart';
import 'package:e_commerce/core/resources/constatnt_manager.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/data/data_sources/wishlist_remote_data_source.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab/data/models/wishlist_response.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: WishlistRemoteDataSource)
class WishlistApiRemoteDataSource implements WishlistRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstatnt.baseUrl));
  @override
  Future<void> addToWishlist({
    required String token,
    required String productID,
  }) async {
    try {
      await dio.post(
        ApiConstatnt.wishlistEndPoint,
        data: {"productId": productID},
        options: Options(headers: {"token": token}),
      );
    } catch (exception) {
      print(exception.toString());
      String? message;
      if (exception is DioException) {
        message = exception.response?.data["message"];
      }
      throw RemoteException(message: message ?? "Failed To Add Product");
    }
  }

  @override
  Future<WishlistResponse> getWishlist({required String token}) async {
    try {
      final response = await dio.get(
        ApiConstatnt.wishlistEndPoint,
        options: Options(headers: {"token": token}),
      );
      return WishlistResponse.fromJson(response.data);
    } catch (exception) {
      print(exception.toString());
      String? message;
      if (exception is DioException) {
        message = exception.response?.data["message"];
      }
      throw RemoteException(message: message ?? "Failed To Add Product");
    }
  }
}
