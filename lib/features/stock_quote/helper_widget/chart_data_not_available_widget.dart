import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/common_colors.dart';
import '../../../core/common/font/custom_text_style.dart';

class ChartDataNotAvailableWidget extends StatelessWidget {
  const ChartDataNotAvailableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: stockChartBackgroundColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      width: double.infinity,
      height: 400.h,
      child: Center(
        child: Text(
          "Chart data is not available",
          style: CustomTextStyle.medium(fontSize: 10.sp),
        ),
      ),
    );
  }
}
