import 'package:dio/dio.dart';
import 'package:e_commerce/core/errors/app_exceptions.dart';
import 'package:e_commerce/core/resources/constatnt_manager.dart';
import 'package:e_commerce/features/products/data/models/products_response.dart';
import 'package:e_commerce/features/products_by_brand_screen.dart/data/data_sources/products_remote_data_source_by_brand.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductsRemoteDataSourceByBrand)
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
      print(exception.toString());
      String? message;
      if (exception is DioException) {
        message = exception.response?.data["message"];
      }
      throw (RemoteException(message: message ?? "Failed to get products"));
    }
  }
}
