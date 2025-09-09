import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_quote/core/common/font/custom_text_style.dart';
import 'package:stock_quote/features/home/controller/home_screen_controller.dart';
import 'package:stock_quote/features/home/helper_widget/stock_details_widget.dart';
import 'package:stock_quote/features/home/model/recently_viewed_stock_model.dart';
import 'package:stock_quote/features/stock_quote/stock_quote_display_screen.dart';

class RecentlyViewedStockWidget extends StatelessWidget {
  const RecentlyViewedStockWidget({
    super.key,
    required this.recentlyViewedStockModelList,
  });

  final List<RecentlyViewedStockModel> recentlyViewedStockModelList;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6.h,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recently Viewed",
          style: CustomTextStyle.semiBold(fontSize: 20.sp),
        ),
        Flexible(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: recentlyViewedStockModelList.length,
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () =>
                  Get.to(
                    () => StockQuoteDisplayScreen(
                      companySymbol:
                          recentlyViewedStockModelList[index].companySymbol,
                      companyDescription:
                          recentlyViewedStockModelList[index].companyName,
                    ),
                  )?.then((value) {
                    log("Back to home screen");
                    Future.delayed(
                      Duration(seconds: 1),
                      () => Get.find<HomeScreenController>()
                          .getRecentlyViewedStocks(),
                    );
                    ;
                  }),
              child: StockDetailsWidget(
                recentlyViewedStockModel: recentlyViewedStockModelList[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
