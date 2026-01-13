import 'package:e_commerce/features/products/data/models/products_response.dart';

abstract class ProductsRemoteDataSourceByBrand {
  Future<ProductsResponse> getProducts({required String brandID});
}
