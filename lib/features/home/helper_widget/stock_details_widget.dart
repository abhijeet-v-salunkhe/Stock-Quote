import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stock_quote/core/common/common_colors.dart';
import 'package:stock_quote/core/common/font/custom_text_style.dart';
import 'package:stock_quote/features/home/helper_widget/stock_details_helper_list_tile.dart';
import 'package:stock_quote/features/home/model/recently_viewed_stock_model.dart';

class StockDetailsWidget extends StatelessWidget {
  const StockDetailsWidget({super.key, required this.recentlyViewedStockModel});

  final RecentlyViewedStockModel recentlyViewedStockModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.all(10.h),
      decoration: BoxDecoration(
        color: secondaryBackgroundColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              recentlyViewedStockModel.companySymbol,
              style: CustomTextStyle.semiBold(fontSize: 15.sp),
              overflow: TextOverflow.fade,
            ),
            subtitle: Text(
              recentlyViewedStockModel.companyName,
              style: CustomTextStyle.medium(
                fontSize: 10.sp,
                color: secondaryFontColor,
              ),
              overflow: TextOverflow.fade,
            ),
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "\$${recentlyViewedStockModel.todaysCurrentPrice.toStringAsFixed(2)}",
                  style: CustomTextStyle.semiBold(fontSize: 20.sp),
                ),
                Expanded(
                  child: Text(
                    "${recentlyViewedStockModel.changeInPrice} (${recentlyViewedStockModel.changePercent}%)",
                    style: CustomTextStyle.medium(
                      fontSize: 15.sp,
                      color: recentlyViewedStockModel.changePercent > 0
                          ? positiveColor
                          : negativeColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: StockDetailsHelperListTile(
                        name: "High:",
                        value: recentlyViewedStockModel.todaysHighPrice
                            .toStringAsFixed(2)
                            .toString(),
                      ),
                    ),

                    Expanded(
                      child: StockDetailsHelperListTile(
                        name: "Low:",
                        value: recentlyViewedStockModel.todaysLowPrice
                            .toStringAsFixed(2)
                            .toString(),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: StockDetailsHelperListTile(
                        name: "Open:",
                        value: recentlyViewedStockModel.openingPrice.toString(),
                      ),
                    ),
                    Expanded(
                      child: StockDetailsHelperListTile(
                        name: "Pr.Close:",
                        value: recentlyViewedStockModel.previousClosedPrice
                            .toStringAsFixed(2)
                            .toString(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
