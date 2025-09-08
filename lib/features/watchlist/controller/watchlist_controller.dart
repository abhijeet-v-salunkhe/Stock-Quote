import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stock_quote/features/watchlist/model/watchlist_model.dart';

import '../../../core/common/services/shared_preferences_service.dart';
import '../../../core/constants/constants.dart';

class WatchlistController extends FullLifeCycleController
    with FullLifeCycleMixin {
  List<WatchlistModel>? watchlist;
  bool isLoading = false;

  @override
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getWatchList();
  }

  Future<void> getWatchList() async {
    log("getWatchList called");
    try {
      isLoading = true;
      update();
      List<dynamic> wishlistItems = await SharedPreferencesService.getListOfMap(
        wishListKey,
      );
      log("WishListItems in getWatchList : $wishlistItems");

      if (wishlistItems.isNotEmpty) {
        watchlist = wishlistItems
            .map((value) => WatchlistModel.fromJson(value))
            .toList();
      } else {
        watchlist = [];
      }
      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      log("Exception in getWatchList : $e");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    log("dispose...........");
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
    log("onDetached..........");
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
    log("onHidden.........");
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
    log("onInactive......");
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
    log("onPaused ..................");
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
    log("onResumed............");
  }
}
