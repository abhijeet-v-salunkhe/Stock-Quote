import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stock_quote/core/constants/constants.dart';
import 'package:stock_quote/features/home/model/recently_viewed_stock_model.dart';

import '../../../core/common/services/shared_preferences_service.dart';

class HomeScreenController extends GetxController {
  List<RecentlyViewedStockModel>? recentlyViewedStocks;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    log("On Init");
    await getRecentlyViewedStocks();
  }

  Future<void> getRecentlyViewedStocks() async {
    try {
      List<dynamic> recentlyViewedStocksMapData =
          await SharedPreferencesService.getListOfMap(recentlyWatchedKey);
      if (recentlyViewedStocksMapData.isNotEmpty) {
        recentlyViewedStocks = recentlyViewedStocksMapData
            .map((value) => RecentlyViewedStockModel.fromJson(value))
            .toList();
        update();
      }
    } catch (e) {
      log("Exception in getRecentlyViewedStocks HomeScreenController : $e");
    }
  }
}
