import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_quote/core/app_routes/app_routes.dart';
import 'package:stock_quote/core/common/common_colors.dart';
import 'package:stock_quote/core/common/font/custom_text_style.dart';
import 'package:stock_quote/core/common/widgets/common_app_bar.dart';
import 'package:stock_quote/core/common/widgets/common_search_bar.dart';
import 'package:stock_quote/features/home/controller/home_screen_controller.dart';
import 'package:stock_quote/features/home/helper_widget/recently_viewed_stock_widget.dart';
import 'package:stock_quote/features/search/search_stocks_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeScreenController(),
      builder: (controller) => Scaffold(
        appBar: commonAppBar(name: "Stocks"),
        backgroundColor: blackColor,
        body: Padding(
          padding: EdgeInsetsGeometry.all(20.h),
          child: Column(
            spacing: 10.h,
            children: [
              CommonSearchBar(
                readOnly: true,
                onTap: () {
                  Get.toNamed(AppRoutes.searchScreen)?.then(
                    (value) => Future.delayed(
                      Duration(seconds: 1),
                      () => controller.getRecentlyViewedStocks(),
                    ),
                  );
                },
                hintText: "Search Stock, e.g. AAPL",
              ),
              controller.recentlyViewedStocks != null
                  ? Expanded(
                      child: RecentlyViewedStockWidget(
                        recentlyViewedStockModelList:
                            controller.recentlyViewedStocks!,
                      ),
                    )
                  : Expanded(
                      child: Center(
                        child: Icon(
                          Icons.add_chart,
                          size: 100.h,
                          color: secondaryFontColor,
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
