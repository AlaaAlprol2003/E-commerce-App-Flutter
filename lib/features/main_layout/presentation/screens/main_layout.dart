import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories_tab.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/favorite_tab.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home_tap.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/profile_tab.dart';
import 'package:flutter/material.dart';

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
      HomeTap(),
      CategoriesTab(),
      FavoriteTab(),
      ProfileTab(),
    ];
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: tabs[selectedIndex],
      bottomNavigationBar: buildNavBar(),
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
