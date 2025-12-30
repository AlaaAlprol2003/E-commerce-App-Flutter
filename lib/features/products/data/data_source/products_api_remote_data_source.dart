import 'package:dio/dio.dart';
import 'package:e_commerce/core/errors/app_exceptions.dart';
import 'package:e_commerce/core/resources/constatnt_manager.dart';
import 'package:e_commerce/features/products/data/data_source/products_remote_data_source.dart';
import 'package:e_commerce/features/products/data/models/products_response.dart';

class ProductsApiRemoteDataSource implements ProductsRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstatnt.baseUrl));
  @override
  Future<ProductsResponse> getProducts(String categoryID) async {
    try {
      final response = await dio.get(
        ApiConstatnt.productsEndPoint,
        queryParameters: {"category": categoryID},
      );

      return ProductsResponse.fromJson(response.data);
    } catch (ex) {
      print(ex.toString());
      String? message;
      if (ex is DioException) {
        message = ex.response?.data["message"];
      }
      throw RemoteException(message: message ?? "Failed to get products");
    }
  }
}
