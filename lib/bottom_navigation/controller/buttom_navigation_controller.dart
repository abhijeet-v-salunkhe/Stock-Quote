import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_quote/features/home/home_screen.dart';
import 'package:stock_quote/features/search/search_stocks_screen.dart';
import 'package:stock_quote/features/watchlist/watchlist_screen.dart';

class BottomNavigationController extends GetxController {
  int activeScreenIndex = 0;
  List<Widget> screens = [HomeScreen(), WatchlistScreen()];

  void onTabBottomNavigationBar(int? value) {
    activeScreenIndex = value ?? 0;
    update();
  }
}
