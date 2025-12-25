import 'package:dio/dio.dart';
import 'package:e_commerce/core/errors/app_exceptions.dart';
import 'package:e_commerce/core/resources/constatnt_manager.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/data/data_source/categories_remote_data_source.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/data/models/category_response.dart';

class CategoriesApiRemoteDataSource implements CategoriesRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstatnt.baseUrl));
  @override
  Future<CategoriesResponse> getCategories() async {
    try {
      final response = await dio.get(ApiConstatnt.categoriesEndPoint);
      return CategoriesResponse.fromJson(response.data);
    } catch (exception) {
      print(exception.toString());
      String? message;
      if (exception is DioException) {
        message = exception.response?.data["message"];
      }
      throw RemoteException(message: message ?? "Failed to get categories");
    }
  }
}
