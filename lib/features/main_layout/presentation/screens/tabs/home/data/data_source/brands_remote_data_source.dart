import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/data/models/brand_response.dart';

abstract class BrandsRemoteDataSource {
  Future<BrandsResponse> getBrands();
}
