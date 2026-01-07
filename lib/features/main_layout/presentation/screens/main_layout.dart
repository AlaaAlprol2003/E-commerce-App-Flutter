import 'package:e_commerce/core/di/service_locator.dart';
import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/data/data_sources/sub_categories_api_remote_data_source.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/data/repository_impl/sub_category_repository_impl.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/domain/use_cases.dart/get_sub_categories_use_case.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/presentation/categories_tab.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/presentation/cubit/sub_categories_cubit.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/data/brands_repository_impl.dart/brands_repository_impl.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/data/categories_rpositories_imp.dart/categories_repository_imp.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/data/data_source/brands_api_remote_data_source.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/data/data_source/categories_api_remote_data_source.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/use_cases/brands_use_case.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/use_cases/get_categories_use_case.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/presentation/cubit/brands_cubit.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/presentation/cubit/categories_cubit.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/presentation/home_tap.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => serviceLocator.get<CategoriesCubit>(),
          ),
          BlocProvider(create: (context) => serviceLocator.get<BrandsCubit>()),
        ],
        child: HomeTap(),
      ),
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => serviceLocator.get<CategoriesCubit>(),
          ),
          BlocProvider(
            create: (context) => serviceLocator.get<SubCategoriesCubit>(),
          ),
        ],
        child: CategoriesTab(),
      ),
      FavoriteTab(),
      ProfileTab(),
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.white,
        body: tabs[selectedIndex],
        bottomNavigationBar: buildNavBar(),
      ),
    );
  }

  BottomNavigationBar buildNavBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorsManager.darkBlue,
      showSelectedLabels: false,
      showUnselectedLabels: false,

      elevation: 3,
      enableFeedback: false,
      items: [
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundColor: selectedIndex == 0
                ? ColorsManager.white
                : Colors.transparent,
            child: Icon(
              Icons.home_outlined,
              color: selectedIndex == 0
                  ? ColorsManager.blue
                  : ColorsManager.white,
            ),
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundColor: selectedIndex == 1
                ? ColorsManager.white
                : Colors.transparent,
            child: Icon(
              Icons.grid_view_outlined,
              color: selectedIndex == 1
                  ? ColorsManager.blue
                  : ColorsManager.white,
            ),
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundColor: selectedIndex == 2
                ? ColorsManager.white
                : Colors.transparent,
            child: Icon(
              Icons.favorite_outline,
              color: selectedIndex == 2
                  ? ColorsManager.blue
                  : ColorsManager.white,
            ),
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundColor: selectedIndex == 3
                ? ColorsManager.white
                : Colors.transparent,
            child: Icon(
              Icons.person_outline,
              color: selectedIndex == 3
                  ? ColorsManager.blue
                  : ColorsManager.white,
            ),
          ),
          label: "",
        ),
      ],
    );
  }

  void onTap(int currentIndex) {
    setState(() {
      selectedIndex = currentIndex;
    });
  }
}
