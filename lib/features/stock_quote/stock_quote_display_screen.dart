import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_quote/core/common/widgets/common_app_bar.dart';
import 'package:stock_quote/core/common/widgets/shimmer_effect.dart';
import 'package:stock_quote/features/stock_quote/controller/StockQuoteDisplayController.dart';
import 'package:stock_quote/features/stock_quote/helper_widget/chart_data_not_available_widget.dart';
import 'package:stock_quote/features/stock_quote/helper_widget/key_statistics_widget.dart';
import 'package:stock_quote/features/stock_quote/helper_widget/some_went_wrong_widget.dart';
import 'package:stock_quote/features/stock_quote/helper_widget/stock_line_chart.dart';
import 'package:stock_quote/features/stock_quote/helper_widget/stock_quote_shimmer_effect.dart';

import '../../core/common/common_colors.dart';
import '../../core/common/font/custom_text_style.dart';

class StockQuoteDisplayScreen extends StatelessWidget {
  const StockQuoteDisplayScreen({
    super.key,
    required this.companySymbol,
    required this.companyDescription,
  });

  final String companySymbol;
  final String companyDescription;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StockQuoteDisplayController>(
      init: StockQuoteDisplayController(
        companyDescription: companyDescription,
        companySymbol: companySymbol,
      ),
      autoRemove: true,
      builder: (controller) => Scaffold(
        backgroundColor: primaryBackgroundColor,
        appBar: commonAppBar(
          name: "Stock Quote",
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back, color: primaryFontColor),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await controller.getStockQuote();
            await controller.getChartData();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsGeometry.all(20.w),
              child: Column(
                spacing: 20.h,
                mainAxisSize: MainAxisSize.min,
                children: [
                  controller.isLoading
                      ? StockQuoteShimmerEffect()
                      : controller.stockQuoteModel != null
                      ? Column(
                          //mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ListTile(
                              trailing: IconButton(
                                icon: controller.isPresentInWishList
                                    ? Icon(
                                        Icons.bookmark_add,
                                        size: 30.h,
                                        color: primaryColor,
                                      )
                                    : Icon(
                                        Icons.bookmark_add_outlined,
                                        size: 30.h,
                                      ),
                                onPressed: controller.onClickBookMark,
                                color: primaryFontColor,
                              ),
                              title: Text(
                                companySymbol,
                                style: CustomTextStyle.bold(fontSize: 40.sp),
                              ),
                              subtitle: Text(
                                companyDescription,
                                style: CustomTextStyle.medium(
                                  fontSize: 20.sp,
                                  color: secondaryFontColor,
                                ),
                              ),
                            ),

                            ListTile(
                              title: Text(
                                "\$${controller.stockQuoteModel!.currentPrice}",
                                style: CustomTextStyle.bold(fontSize: 40.sp),
                              ),
                              subtitle: Text(
                                "${controller.stockQuoteModel!.changeInPrice}(${controller.stockQuoteModel!.changePercent}%)",
                                style: CustomTextStyle.medium(
                                  fontSize: 20.sp,
                                  color:
                                      controller
                                              .stockQuoteModel!
                                              .changePercent >
                                          0
                                      ? positiveColor
                                      : negativeColor,
                                ),
                              ),
                            ),

                            SizedBox(height: 20.h),
                            KeyStatisticsWidget(
                              stockQuoteModel: controller.stockQuoteModel!,
                            ),
                          ],
                        )
                      : SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          child: SomeWentWrongWidget(),
                        ),
                  controller.isChartLoading
                      ? ShimmerEffect(
                          containerHeight: 300.h,
                          containerWidth: double.infinity,
                        )
                      : (controller.chartPointsModel != null &&
                            controller
                                .chartPointsModel!
                                .dataPointList
                                .isNotEmpty)
                      ? StockLineChart(
                          companySymbol: companySymbol,
                          companyDescription: companyDescription,
                          chartDataPointList:
                              controller.chartPointsModel!.dataPointList,
                        )
                      : controller.stockQuoteModel != null
                      ? ChartDataNotAvailableWidget()
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
