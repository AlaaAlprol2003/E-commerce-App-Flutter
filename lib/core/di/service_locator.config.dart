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
import '../../features/cart/data/data_source/cart_api_remote_data_source.dart'
    as _i360;
import '../../features/cart/data/data_source/cart_remote_data_source.dart'
    as _i1026;
import '../../features/cart/data/repositories_impl/cart_repository_impl.dart'
    as _i250;
import '../../features/cart/domain/repositories/cart_repository.dart' as _i322;
import '../../features/cart/domain/use_cases/add_to_cart_use_case.dart'
    as _i252;
import '../../features/cart/domain/use_cases/clear_cart_use_case.dart' as _i493;
import '../../features/cart/domain/use_cases/delete_product_from_cart.dart'
    as _i834;
import '../../features/cart/domain/use_cases/get_cart.dart' as _i714;
import '../../features/cart/domain/use_cases/update_cart_product_quality_use_case.dart'
    as _i593;
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
import '../../features/main_layout/presentation/screens/tabs/favorite_tab/data/data_sources/wishlist_api_remote_data_source.dart'
    as _i69;
import '../../features/main_layout/presentation/screens/tabs/favorite_tab/data/data_sources/wishlist_remote_data_source.dart'
    as _i733;
import '../../features/main_layout/presentation/screens/tabs/favorite_tab/data/respository_impl/wishlist_repository_impl.dart'
    as _i514;
import '../../features/main_layout/presentation/screens/tabs/favorite_tab/domain/repositories/wishlist_repository.dart'
    as _i540;
import '../../features/main_layout/presentation/screens/tabs/favorite_tab/domain/use_cases/add_to_wishlist_use_case.dart'
    as _i212;
import '../../features/main_layout/presentation/screens/tabs/favorite_tab/domain/use_cases/delete_product_use_case.dart'
    as _i225;
import '../../features/main_layout/presentation/screens/tabs/favorite_tab/domain/use_cases/get_wishlist_use_case.dart'
    as _i605;
import '../../features/main_layout/presentation/screens/tabs/favorite_tab/presentation/cubit/wishlist_cubit.dart'
    as _i391;
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
    gh.lazySingleton<_i733.WishlistRemoteDataSource>(
      () => _i69.WishlistApiRemoteDataSource(),
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
    gh.singleton<_i485.AuthLocalDataSource>(
      () => _i277.AuthSharedPrefsLocalDataSource(),
    );
    gh.lazySingleton<_i384.GetCategoriesUseCase>(
      () => _i384.GetCategoriesUseCase(
        categoriesRepository: gh<_i79.CategoriesRepository>(),
      ),
    );
    gh.lazySingleton<_i1026.CartRemoteDataSource>(
      () => _i360.CartApiRemoteDataSource(),
    );
    gh.lazySingleton<_i705.CategoriesCubit>(
      () => _i705.CategoriesCubit(
        getCategoriesUseCase: gh<_i384.GetCategoriesUseCase>(),
      ),
    );
    gh.lazySingleton<_i152.BrandsRepository>(
      () => _i988.BrandsRepositoryImpl(
        brandsRemoteDataSource: gh<_i371.BrandsRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i540.WishlistRepository>(
      () => _i514.WishlistRepositoryImpl(
        remoteDataSource: gh<_i733.WishlistRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i151.SubCategoryRepository>(
      () => _i103.SubCategoryRepositoryImpl(
        remoteDataSource: gh<_i730.SubCategoriesRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i212.AddToWishlistUseCase>(
      () => _i212.AddToWishlistUseCase(
        wishlistRepository: gh<_i540.WishlistRepository>(),
      ),
    );
    gh.lazySingleton<_i225.DeleteProductUseCase>(
      () => _i225.DeleteProductUseCase(
        wishlistRepository: gh<_i540.WishlistRepository>(),
      ),
    );
    gh.lazySingleton<_i605.GetWishlistUseCase>(
      () => _i605.GetWishlistUseCase(
        wishlistRepository: gh<_i540.WishlistRepository>(),
      ),
    );
    gh.singleton<_i787.AuthRepository>(
      () => _i710.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i432.AuthRemoteDataSource>(),
        authLocalDataSource: gh<_i485.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i322.CartRepository>(
      () => _i250.CartRepositoryImpl(
        remoteDataSource: gh<_i1026.CartRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i391.WishlistCubit>(
      () => _i391.WishlistCubit(
        addToWishlistUseCase: gh<_i212.AddToWishlistUseCase>(),
        getWishlistUseCase: gh<_i605.GetWishlistUseCase>(),
        deleteProductUseCase: gh<_i225.DeleteProductUseCase>(),
      ),
    );
    gh.factory<_i300.GetSubCategoriesUseCase>(
      () => _i300.GetSubCategoriesUseCase(
        subCategoryRepository: gh<_i151.SubCategoryRepository>(),
      ),
    );
    gh.lazySingleton<_i58.GetBrandsUseCase>(
      () =>
          _i58.GetBrandsUseCase(brandsRepository: gh<_i152.BrandsRepository>()),
    );
    gh.lazySingleton<_i252.AddToCartUseCase>(
      () => _i252.AddToCartUseCase(cartRepository: gh<_i322.CartRepository>()),
    );
    gh.lazySingleton<_i493.ClearCartUseCase>(
      () => _i493.ClearCartUseCase(cartRepository: gh<_i322.CartRepository>()),
    );
    gh.lazySingleton<_i834.DeleteProductFromCartUseCase>(
      () => _i834.DeleteProductFromCartUseCase(
        cartRepository: gh<_i322.CartRepository>(),
      ),
    );
    gh.lazySingleton<_i714.GetCartUseCase>(
      () => _i714.GetCartUseCase(cartRepository: gh<_i322.CartRepository>()),
    );
    gh.lazySingleton<_i593.UpdateCartProductQualityUseCase>(
      () => _i593.UpdateCartProductQualityUseCase(
        cartRepository: gh<_i322.CartRepository>(),
      ),
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
    gh.factory<_i1028.SubCategoriesCubit>(
      () => _i1028.SubCategoriesCubit(
        getSubCategoriesUseCase: gh<_i300.GetSubCategoriesUseCase>(),
      ),
    );
    gh.lazySingleton<_i459.CartCubit>(
      () => _i459.CartCubit(
        addToCartUseCase: gh<_i252.AddToCartUseCase>(),
        getCartUseCase: gh<_i714.GetCartUseCase>(),
        updateCartProductQualityUseCase:
            gh<_i593.UpdateCartProductQualityUseCase>(),
        deleteProductFromCartUseCase: gh<_i834.DeleteProductFromCartUseCase>(),
        clearCartUseCase: gh<_i493.ClearCartUseCase>(),
      ),
    );
    return this;
  }
}
