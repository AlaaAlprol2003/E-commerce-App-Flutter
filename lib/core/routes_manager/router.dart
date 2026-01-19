// ignore_for_file: body_might_complete_normally_nullable

import 'package:e_commerce/core/di/service_locator.dart';
import 'package:e_commerce/core/routes_manager/routes.dart';
import 'package:e_commerce/features/auth/presentation/screens/login_screen.dart';
import 'package:e_commerce/features/auth/presentation/screens/register_screen.dart';
import 'package:e_commerce/features/cart/presentation/cart_screen.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/main_layout.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/entities/brand_entity.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/entities/category_entity.dart';
import 'package:e_commerce/features/product_details/presentation/product_details_screen.dart';
import 'package:e_commerce/features/products/data/data_source/products_api_remote_data_source.dart';
import 'package:e_commerce/features/products/data/repository_impl/products_repository_impl.dart';
import 'package:e_commerce/features/products/domain/entites/product_entity.dart';
import 'package:e_commerce/features/products/domain/use_cases/get_products_use_case.dart';
import 'package:e_commerce/features/products/presentation/cubit/products_cubit.dart';
import 'package:e_commerce/features/products/presentation/product_screen.dart';
import 'package:e_commerce/features/products_by_brand_screen.dart/presentation/cubit/products_by_brand_cubit.dart';
import 'package:e_commerce/features/products_by_brand_screen.dart/presentation/products_by_brand_screen.dart';
import 'package:e_commerce/features/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class GetRoute {
  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case Routes.register:
        {
          return CupertinoPageRoute(builder: (context) => RegisterScreen());
        }
      case Routes.login:
        {
          return CupertinoPageRoute(builder: (context) => LoginScreen());
        }
      case Routes.mainLayout:
        {
          return CupertinoPageRoute(builder: (context) => MainLayout());
        }
      case Routes.productScreen:
        {
          CategoryEntity category = settings.arguments as CategoryEntity;
          return CupertinoPageRoute(
            builder: (context) => BlocProvider<ProductsCubit>(
              create: (context) => ProductsCubit(
                getProductsUseCase: GetProductsUseCase(
                  productsRepository: ProductsRepositoryImpl(
                    remoteDataSource: ProductsApiRemoteDataSource(),
                  ),
                ),
              )..getProducts(category.id),
              child: ProductScreen(categoryEntity: category),
            ),
          );
        }
      case Routes.productDetailsScreen:
        {
          ProductEntity product = settings.arguments as ProductEntity;
          return CupertinoPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          );
        }
      case Routes.cartScreen:
        {
          return CupertinoPageRoute(builder: (contex) => CartScreen());
        }

      case Routes.productsByBrandScreen:
        {
          BrandEntity brandEntity = settings.arguments as BrandEntity;
          return CupertinoPageRoute(
            builder: (context) => BlocProvider<ProductsByBrandCubit>(
              create: (context) =>
                  serviceLocator.get<ProductsByBrandCubit>()
                    ..getProductsByBrand(brandID: brandEntity.sId),
              child: ProductsByBrandScreen(brand: brandEntity),
            ),
          );
        }

      case Routes.splashScreen:
        {
          return CupertinoPageRoute(builder: (context) => SplashScreen());
        }
    }
  }
}
