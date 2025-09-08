import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_quote/features/search/controller/search_stock_controller.dart';
import 'package:stock_quote/features/watchlist/controller/watchlist_controller.dart';

class WatchlistControllerBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SearchStockController());
  }
}
