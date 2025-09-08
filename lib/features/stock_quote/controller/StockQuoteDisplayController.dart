import 'dart:developer';

import 'package:get/get.dart';
import 'package:stock_quote/core/common/services/shared_preferences_service.dart';
import 'package:stock_quote/core/constants/constants.dart';
import 'package:stock_quote/features/search/model/searched_company_model.dart';
import 'package:stock_quote/features/stock_quote/model/stock_quote_model.dart';

import '../../../core/common/repository.dart';
import '../../../core/network/end_points.dart';

class StockQuoteDisplayController extends GetxController {
  StockQuoteDisplayController({
    required this.companySymbol,
    required this.companyDescription,
  });

  final String companySymbol;
  final String companyDescription;

  bool isLoading = true;
  StockQuoteModel? stockQuoteModel;
  late bool isPresentInWishList;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    isPresentInWishList = await isPresentInWishlist();
    log("isPresentInWishList : $isPresentInWishList");
    await getStockQuote();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    update();
  }

  Future<void> getStockQuote() async {
    try {
      isLoading = true;
      update();
      var result = await Repository.getMethod(
        endPoint: stockQuoteEndpoint,
        query: "symbol=$companySymbol",
      );
      log("Result : $result");
      if (result != null) {
        stockQuoteModel = StockQuoteModel.fromJson(result);
        log("c : ${stockQuoteModel!.currentPrice}");
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
      }
    } catch (e) {
      isLoading = false;
      update();
      log("Exception in SearchStockController : $e");
    }
  }

  void onClickBookMark() async {
    try {
      List<dynamic> wishlistItems = await SharedPreferencesService.getListOfMap(
        wishListKey,
      );

      log("wishlistItems : $wishlistItems");

      if (isPresentInWishList) {
        log("In the if of isPresentInWishList");
        if (wishlistItems.isEmpty) return;

        for (int i = 0; i < wishlistItems.length; i++) {
          if (wishlistItems[i][symbolKey] == companySymbol) {
            wishlistItems.removeAt(i);

            break;
          }
        }
        await SharedPreferencesService.setListOfMap(wishListKey, wishlistItems);
        isPresentInWishList = false;
      } else {
        log("In the else of isPresentInWishList");
        wishlistItems.add(newStock);
        await SharedPreferencesService.setListOfMap(wishListKey, wishlistItems);
        isPresentInWishList = true;
      }
    } catch (e) {
      log("Exception : $e");
    } finally {
      update();
    }
  }

  Future<bool> isPresentInWishlist() async {
    log("isPresentInWishlist");
    List<dynamic> wishlistItems = await SharedPreferencesService.getListOfMap(
      wishListKey,
    );
    log("watchlist : $wishlistItems");
    for (Map<String, dynamic> value in wishlistItems) {
      if (value[symbolKey] == companySymbol) {
        return true;
      }
    }
    return false;
  }

  get newStock => {
    symbolKey: companySymbol,
    descriptionKey: companyDescription,
  };

  @override
  void onClose() async {
    // TODO: implement dispose
    super.onClose();

    log("onClose called");
    if (stockQuoteModel != null) {
      List<dynamic> recentlyViewed =
          await SharedPreferencesService.getListOfMap(recentlyWatchedKey);

      log("recentlyViewed : $recentlyViewed");
      bool presenceInRecentlyViewed = checkPresenceInRecentlyViewed(
        recentlyViewed,
      );
      log("presenceInRecentlyViewed : $presenceInRecentlyViewed");
      if (!presenceInRecentlyViewed) {
        if (recentlyViewed.length > 4) {
          recentlyViewed.removeAt(0);
          recentlyViewed.add(dataOfQuote);
          log("recentlyViewed after adding : $recentlyViewed");
        } else {
          recentlyViewed.add(dataOfQuote);
          log("recentlyViewed after adding : $recentlyViewed");
        }
        await SharedPreferencesService.setListOfMap(
          recentlyWatchedKey,
          recentlyViewed,
        );
      }
    }
  }

  get dataOfQuote => {
    symbolKey: companySymbol,
    descriptionKey: companyDescription,
    currentPrice: stockQuoteModel!.currentPrice,
    changedPrice: stockQuoteModel!.changeInPrice,
    changeInPercentage: stockQuoteModel!.changePercent,
    todaysHigh: stockQuoteModel!.todaysHigh,
    todaysLow: stockQuoteModel!.todaysLow,
    openedPrice: stockQuoteModel!.openingPrice,
    previousClose: stockQuoteModel!.previousClose,
    dateTime: stockQuoteModel!.dataTiming,
  };

  bool checkPresenceInRecentlyViewed(List<dynamic> recentlyViewed) {
    for (dynamic value in recentlyViewed) {
      if (value[symbolKey] == companySymbol) {
        return true;
      }
    }
    return false;
  }
}
