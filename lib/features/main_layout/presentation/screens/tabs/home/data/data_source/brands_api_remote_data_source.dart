import 'package:dio/dio.dart';
import 'package:e_commerce/core/errors/app_exceptions.dart';
import 'package:e_commerce/core/resources/constatnt_manager.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/data/data_source/brands_remote_data_source.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/data/models/brand_response.dart';

class BrandsApiRemoteDataSource implements BrandsRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstatnt.baseUrl));
  @override
  Future<BrandsResponse> getBrands() async {
    try {
      var response = await dio.get(ApiConstatnt.brandsEndPoint);
      return BrandsResponse.fromJson(response.data);
    } catch (exception) {
      print(exception.toString());
      String? message;
      if (exception is DioException) {
        message = exception.response?.data["message"];
      }
      throw RemoteException(message: message ?? "Failed to get brands");
    }
  }
}
