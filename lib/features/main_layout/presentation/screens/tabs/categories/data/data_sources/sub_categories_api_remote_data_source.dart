import 'package:dio/dio.dart';
import 'package:e_commerce/core/errors/app_exceptions.dart';
import 'package:e_commerce/core/resources/constatnt_manager.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/data/data_sources/sub_categories_remote_data_source.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/data/models/sub_categories_response.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: SubCategoriesRemoteDataSource)
class SubCategoriesApiRemoteDataSource
    implements SubCategoriesRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstatnt.baseUrl));
  @override
  Future<SubCategoriesResponse> getSubcategories(String categoryID) async {
    try {
      final response = await dio.get(
        ApiConstatnt.subCategoriesEndPoint,
        queryParameters: {"category": categoryID},
      );
      return SubCategoriesResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data["message"];
      }
      throw RemoteException(message: message ?? "Failed");
    }
  }
}
