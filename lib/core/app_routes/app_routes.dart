import 'package:get/get.dart';
import 'package:stock_quote/features/search/binding/search_stock_controller_binding.dart';
import 'package:stock_quote/features/search/search_stocks_screen.dart';
import 'package:stock_quote/features/stock_quote/stock_quote_display_screen.dart';

import '../../features/home/home_screen.dart';

class AppRoutes {
  static const homeScreen = "/homeScreen";
  static const searchScreen = "/searchScreen";
  static const stockQuoteDisplayScreen = "/stockQuoteDisplayScreen";

  static List<GetPage> getPages() {
    return [
      GetPage(name: homeScreen, page: () => HomeScreen()),
      GetPage(
        name: searchScreen,
        page: () => SearchStocksScreen(),
        binding: SearchStockControllerBinding(),
      ),
    ];
  }
}
