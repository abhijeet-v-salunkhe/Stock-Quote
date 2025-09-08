import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stock_quote/features/stock_quote/model/stock_quote_model.dart';

import '../../../core/common/common_colors.dart';
import '../../../core/common/font/custom_text_style.dart';
import 'key_statistics_componet.dart';

class KeyStatisticsWidget extends StatelessWidget {
  const KeyStatisticsWidget({super.key, required this.stockQuoteModel});

  final StockQuoteModel stockQuoteModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsGeometry.all(20.h),
      decoration: BoxDecoration(
        color: secondaryBackgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Key Statistics",
            style: CustomTextStyle.medium(fontSize: 20.sp),
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: KeyStatisticsComponent(
                  title: "Open",
                  value: "\$${stockQuoteModel.openingPrice}",
                ),
              ),
              Expanded(
                child: KeyStatisticsComponent(
                  title: "Previous Close",
                  value: "\$${stockQuoteModel.previousClose}",
                ),
              ),
            ],
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: KeyStatisticsComponent(
                  title: "High",
                  value: "\$${stockQuoteModel.todaysHigh}",
                ),
              ),
              Expanded(
                child: KeyStatisticsComponent(
                  title: "Low",
                  value: "\$${stockQuoteModel.todaysLow}",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
