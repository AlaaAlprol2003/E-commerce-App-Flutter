import 'package:dio/dio.dart';
import 'package:e_commerce/core/errors/app_exceptions.dart';
import 'package:e_commerce/core/resources/constatnt_manager.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/data/data_source/products_remote_data_source_by_brand.dart';
import 'package:e_commerce/features/products/data/models/products_response.dart';

class ProductsApiRemoteDataSourceByBrand
    implements ProductsRemoteDataSourceByBrand {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstatnt.baseUrl));
  @override
  Future<ProductsResponse> getProducts({required String brandID}) async {
    try {
      final response = await dio.get(
        ApiConstatnt.productsEndPoint,
        queryParameters: {"brand": brandID},
      );
      return ProductsResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data["message"];
      }
      throw (RemoteException(message: message ?? "Failed to get products"));
    }
  }
}
