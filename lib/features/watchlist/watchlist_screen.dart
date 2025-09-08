import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_quote/core/app_routes/app_routes.dart';
import 'package:stock_quote/core/common/common_colors.dart';
import 'package:stock_quote/core/common/font/custom_text_style.dart';
import 'package:stock_quote/core/common/widgets/common_app_bar.dart';
import 'package:stock_quote/features/watchlist/controller/watchlist_controller.dart';
import 'package:stock_quote/features/watchlist/helper_widget/watchlist_tile.dart';

import '../../core/common/widgets/shimmer_effect.dart';
import '../stock_quote/stock_quote_display_screen.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: WatchlistController(),
      builder: (controller) {
        log("In controller");
        return Scaffold(
          backgroundColor: primaryBackgroundColor,
          appBar: commonAppBar(
            name: "Watchlist",
            actions: [
              IconButton(
                onPressed: () => Get.toNamed(
                  AppRoutes.searchScreen,
                )?.then((value) => controller.getWatchList()),
                icon: Icon(Icons.add, color: primaryFontColor, size: 30.h),
              ),
            ],
          ),
          body: controller.watchlist != null && controller.watchlist!.isNotEmpty
              ? RefreshIndicator(
                  onRefresh: () => controller.getWatchList(),
                  child: ListView.separated(
                    padding: EdgeInsetsGeometry.all(10.h),
                    itemBuilder: (context, index) => WatchlistTile(
                      onTap: () => Get.to(
                        () => StockQuoteDisplayScreen(
                          companySymbol:
                              controller.watchlist![index].companySymbol,
                          companyDescription:
                              controller.watchlist![index].companyDescription,
                        ),
                      )?.then((value) => controller.getWatchList()),
                      watchlistModel: controller.watchlist![index],
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemCount: controller.watchlist!.length,
                  ),
                )
              : controller.isLoading
              ? ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) => ShimmerEffect(
                    containerHeight: 60.h,
                    containerWidth: 50.w,
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.cube_box,
                        size: 100.h,
                        color: primaryFontColor,
                      ),
                      Text(
                        "WatchList is empty",
                        style: CustomTextStyle.medium(fontSize: 10.sp),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
