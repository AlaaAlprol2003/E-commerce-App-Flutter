// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i485;
import '../../features/auth/data/data_sources/local/auth_shared_prefs_local_data_source.dart'
    as _i277;
import '../../features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i112;
import '../../features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i432;
import '../../features/auth/data/repositories_impl/auth_repository_impl.dart'
    as _i710;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/use_cases/login_use_case.dart' as _i1038;
import '../../features/auth/domain/use_cases/register_use_case.dart' as _i1010;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
import '../../features/main_layout/presentation/screens/tabs/categories/data/data_sources/sub_categories_api_remote_data_source.dart'
    as _i649;
import '../../features/main_layout/presentation/screens/tabs/categories/data/data_sources/sub_categories_remote_data_source.dart'
    as _i730;
import '../../features/main_layout/presentation/screens/tabs/categories/data/repository_impl/sub_category_repository_impl.dart'
    as _i103;
import '../../features/main_layout/presentation/screens/tabs/categories/domain/repositories/sub_category_repository.dart'
    as _i151;
import '../../features/main_layout/presentation/screens/tabs/categories/domain/use_cases.dart/get_sub_categories_use_case.dart'
    as _i300;
import '../../features/main_layout/presentation/screens/tabs/categories/presentation/cubit/sub_categories_cubit.dart'
    as _i1028;
import '../../features/main_layout/presentation/screens/tabs/home/data/brands_repository_impl.dart/brands_repository_impl.dart'
    as _i988;
import '../../features/main_layout/presentation/screens/tabs/home/data/categories_rpositories_imp.dart/categories_repository_imp.dart'
    as _i301;
import '../../features/main_layout/presentation/screens/tabs/home/data/data_source/brands_api_remote_data_source.dart'
    as _i777;
import '../../features/main_layout/presentation/screens/tabs/home/data/data_source/brands_remote_data_source.dart'
    as _i371;
import '../../features/main_layout/presentation/screens/tabs/home/data/data_source/categories_api_remote_data_source.dart'
    as _i635;
import '../../features/main_layout/presentation/screens/tabs/home/data/data_source/categories_remote_data_source.dart'
    as _i610;
import '../../features/main_layout/presentation/screens/tabs/home/domain/repositories/brands_repository.dart'
    as _i152;
import '../../features/main_layout/presentation/screens/tabs/home/domain/repositories/categories_repository.dart'
    as _i79;
import '../../features/main_layout/presentation/screens/tabs/home/domain/use_cases/brands_use_case.dart'
    as _i58;
import '../../features/main_layout/presentation/screens/tabs/home/domain/use_cases/get_categories_use_case.dart'
    as _i384;
import '../../features/main_layout/presentation/screens/tabs/home/presentation/cubit/brands_cubit.dart'
    as _i273;
import '../../features/main_layout/presentation/screens/tabs/home/presentation/cubit/categories_cubit.dart'
    as _i705;
import '../data/data_source/cart_api_remote_data_source.dart' as _i928;
import '../data/data_source/cart_remote_data_source.dart' as _i585;
import '../data/repositories_impl/cart_repository_impl.dart' as _i269;
import '../domain/repositories/cart_repository.dart' as _i463;
import '../domain/use_cases/add_to_cart_use_case.dart' as _i994;
import '../domain/use_cases/clear_cart_use_case.dart' as _i893;
import '../domain/use_cases/delete_product_from_cart.dart' as _i888;
import '../domain/use_cases/get_cart.dart' as _i33;
import '../domain/use_cases/update_cart_product_quality_use_case.dart' as _i175;
import '../presentation/cart_cubit.dart' as _i459;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i610.CategoriesRemoteDataSource>(
      () => _i635.CategoriesApiRemoteDataSource(),
    );
    gh.lazySingleton<_i730.SubCategoriesRemoteDataSource>(
      () => _i649.SubCategoriesApiRemoteDataSource(),
    );
    gh.singleton<_i432.AuthRemoteDataSource>(
      () => _i112.AuthApiRemoteDataSource(),
    );
    gh.lazySingleton<_i79.CategoriesRepository>(
      () => _i301.CategoriesRepositoryImp(
        remoteDataSource: gh<_i610.CategoriesRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i371.BrandsRemoteDataSource>(
      () => _i777.BrandsApiRemoteDataSource(),
    );
    gh.lazySingleton<_i585.CartRemoteDataSource>(
      () => _i928.CartApiRemoteDataSource(),
    );
    gh.singleton<_i485.AuthLocalDataSource>(
      () => _i277.AuthSharedPrefsLocalDataSource(),
    );
    gh.lazySingleton<_i384.GetCategoriesUseCase>(
      () => _i384.GetCategoriesUseCase(
        categoriesRepository: gh<_i79.CategoriesRepository>(),
      ),
    );
    gh.lazySingleton<_i705.CategoriesCubit>(
      () => _i705.CategoriesCubit(
        getCategoriesUseCase: gh<_i384.GetCategoriesUseCase>(),
      ),
    );
    gh.lazySingleton<_i463.CartRepository>(
      () => _i269.CartRepositoryImpl(
        remoteDataSource: gh<_i585.CartRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i152.BrandsRepository>(
      () => _i988.BrandsRepositoryImpl(
        brandsRemoteDataSource: gh<_i371.BrandsRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i151.SubCategoryRepository>(
      () => _i103.SubCategoryRepositoryImpl(
        remoteDataSource: gh<_i730.SubCategoriesRemoteDataSource>(),
      ),
    );
    gh.singleton<_i787.AuthRepository>(
      () => _i710.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i432.AuthRemoteDataSource>(),
        authLocalDataSource: gh<_i485.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i994.AddToCartUseCase>(
      () => _i994.AddToCartUseCase(cartRepository: gh<_i463.CartRepository>()),
    );
    gh.lazySingleton<_i893.ClearCartUseCase>(
      () => _i893.ClearCartUseCase(cartRepository: gh<_i463.CartRepository>()),
    );
    gh.lazySingleton<_i888.DeleteProductFromCartUseCase>(
      () => _i888.DeleteProductFromCartUseCase(
        cartRepository: gh<_i463.CartRepository>(),
      ),
    );
    gh.lazySingleton<_i33.GetCartUseCase>(
      () => _i33.GetCartUseCase(cartRepository: gh<_i463.CartRepository>()),
    );
    gh.lazySingleton<_i175.UpdateCartProductQualityUseCase>(
      () => _i175.UpdateCartProductQualityUseCase(
        cartRepository: gh<_i463.CartRepository>(),
      ),
    );
    gh.lazySingleton<_i459.CartCubit>(
      () => _i459.CartCubit(
        addToCartUseCase: gh<_i994.AddToCartUseCase>(),
        getCartUseCase: gh<_i33.GetCartUseCase>(),
        updateCartProductQualityUseCase:
            gh<_i175.UpdateCartProductQualityUseCase>(),
        deleteProductFromCartUseCase: gh<_i888.DeleteProductFromCartUseCase>(),
        clearCartUseCase: gh<_i893.ClearCartUseCase>(),
      ),
    );
    gh.lazySingleton<_i300.GetSubCategoriesUseCase>(
      () => _i300.GetSubCategoriesUseCase(
        subCategoryRepository: gh<_i151.SubCategoryRepository>(),
      ),
    );
    gh.lazySingleton<_i58.GetBrandsUseCase>(
      () =>
          _i58.GetBrandsUseCase(brandsRepository: gh<_i152.BrandsRepository>()),
    );
    gh.singleton<_i1038.LoginUseCase>(
      () => _i1038.LoginUseCase(authRepository: gh<_i787.AuthRepository>()),
    );
    gh.singleton<_i1010.RegisterUseCase>(
      () => _i1010.RegisterUseCase(authRepository: gh<_i787.AuthRepository>()),
    );
    gh.singleton<_i117.AuthCubit>(
      () => _i117.AuthCubit(
        registerUseCase: gh<_i1010.RegisterUseCase>(),
        loginUseCase: gh<_i1038.LoginUseCase>(),
      ),
    );
    gh.lazySingleton<_i273.BrandsCubit>(
      () => _i273.BrandsCubit(brandsUseCase: gh<_i58.GetBrandsUseCase>()),
    );
    gh.lazySingleton<_i1028.SubCategoriesCubit>(
      () => _i1028.SubCategoriesCubit(
        getSubCategoriesUseCase: gh<_i300.GetSubCategoriesUseCase>(),
      ),
    );
    return this;
  }
}
