import 'dart:developer';

import 'package:get/get.dart';
import 'package:stock_quote/core/common/repository.dart';
import 'package:stock_quote/core/network/end_points.dart';
import 'package:stock_quote/features/search/model/search_result_model.dart';

class SearchStockController extends GetxController {
  SearchResultModel? searchResultModel;
  bool isLoading = false;

  void onSearch(String? value) async {
    log("Value : $value");
    if (value != null && value.length > 2) {
      try {
        isLoading = true;
        update();
        var result = await Repository.getMethod(
          endPoint: searchStockEndpoint,
          query: "q=$value",
        );
        log("Result : $result");
        if (result != null) {
          searchResultModel = SearchResultModel.fromJson(result);
          log("First result : ${searchResultModel?.result[1].symbol}");
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
  }
}
