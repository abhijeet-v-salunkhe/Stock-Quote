import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_quote/bottom_navigation/controller/buttom_navigation_controller.dart';

import '../core/common/common_colors.dart';
import '../features/home/home_screen.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BottomNavigationController(),
      builder: (controller) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.activeScreenIndex,
          onTap: controller.onTabBottomNavigationBar,
          backgroundColor: secondaryBackgroundColor,
          selectedItemColor: secondaryFontColor,
          unselectedItemColor: primaryFontColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              activeIcon: Icon(Icons.home),
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              label: "Watchlist",
              activeIcon: Icon(Icons.bookmark),
            ),
          ],
        ),
        body: controller.screens[controller.activeScreenIndex],
      ),
    );
  }
}
