import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_quote/core/common/common_colors.dart';
import 'package:stock_quote/core/common/font/custom_text_style.dart';
import 'package:stock_quote/core/common/widgets/common_app_bar.dart';
import 'package:stock_quote/core/common/widgets/common_search_bar.dart';
import 'package:stock_quote/core/common/widgets/shimmer_effect.dart';
import 'package:stock_quote/features/search/controller/search_stock_controller.dart';
import 'package:stock_quote/features/search/helper_widgets/search_result_tile.dart';
import 'package:stock_quote/features/stock_quote/stock_quote_display_screen.dart';

class SearchStocksScreen extends StatelessWidget {
  const SearchStocksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SearchStockController(),
      builder: (controller) => Scaffold(
        appBar: commonAppBar(
          name: "Search",
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back, color: primaryFontColor),
          ),
        ),
        backgroundColor: primaryBackgroundColor,
        body: Padding(
          padding: EdgeInsetsGeometry.all(20.h),
          child: Column(
            children: [
              CommonSearchBar(
                onChanged: controller.onSearch,
                hintText: "Search stocks, e.g.AAPL",
              ),
              SizedBox(height: 20.h),
              controller.isLoading
                  ? Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10.h),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) => ShimmerEffect(
                          containerHeight: 60.h,
                          containerWidth: 50.w,
                        ),
                      ),
                    )
                  : controller.searchResultModel != null
                  ? controller.searchResultModel!.count != 0
                        ? Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.searchResultModel!.count,

                              itemBuilder: (context, index) => SearchResultTile(
                                onTap: () {
                                  Get.to(
                                    () => StockQuoteDisplayScreen(
                                      companySymbol: controller
                                          .searchResultModel!
                                          .result[index]
                                          .displaySymbol,
                                      companyDescription: controller
                                          .searchResultModel!
                                          .result[index]
                                          .description,
                                    ),
                                  );
                                },
                                description: controller
                                    .searchResultModel!
                                    .result[index]
                                    .description,
                                displaySymbol: controller
                                    .searchResultModel!
                                    .result[index]
                                    .displaySymbol,
                              ),
                            ),
                          )
                        : Expanded(
                            child: Center(
                              child: Text(
                                "Search Not found",
                                style: CustomTextStyle.regular(fontSize: 15.sp),
                              ),
                            ),
                          )
                  : Expanded(
                      child: Center(
                        child: Text(
                          "Search Stock",
                          style: CustomTextStyle.regular(fontSize: 15.sp),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
