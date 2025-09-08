import 'package:get/get.dart';
import 'package:stock_quote/features/search/controller/search_stock_controller.dart';

class SearchStockControllerBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SearchStockController());
  }
}
