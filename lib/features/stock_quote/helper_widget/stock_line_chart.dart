import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stock_quote/core/common/common_colors.dart';
import 'package:stock_quote/core/common/font/custom_text_style.dart';
import 'package:stock_quote/features/stock_quote/model/chart_data_point_model.dart';

class StockLineChart extends StatelessWidget {
  const StockLineChart({
    super.key,
    required this.chartDataPointList,
    required this.companySymbol,
    required this.companyDescription,
  });

  final List<ChartDataPointModel> chartDataPointList;
  final String companySymbol;
  final String companyDescription;

  @override
  Widget build(BuildContext context) {
    DateTime firstDate = chartDataPointList.first.date;

    List<FlSpot> spots = chartDataPointList.map((value) {
      double x = value.date.difference(firstDate).inDays.toDouble();
      return FlSpot(x, value.close);
    }).toList();

    return Container(
      height: 400.h,
      padding: EdgeInsetsGeometry.all(10.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: stockChartBackgroundColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Stack(
        children: [
          ListTile(
            trailing: Container(
              padding: EdgeInsetsGeometry.all(10.h),
              decoration: BoxDecoration(
                color: secondaryBackgroundColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                "1D",
                style: CustomTextStyle.semiBold(
                  fontSize: 20.sp,
                  color: secondaryFontColor,
                ),
              ),
            ),
            title: Text(
              companySymbol,
              style: CustomTextStyle.bold(fontSize: 30.sp),
            ),
            subtitle: Text(
              companyDescription,
              style: CustomTextStyle.medium(
                fontSize: 10.sp,
                color: secondaryFontColor,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: chartDataPointList.length * 50.h,
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: (spots.length - 1).toDouble(),
                  minY: spots
                      .map((value) => value.y)
                      .reduce((a, b) => a < b ? a : b),
                  // Take minimum value of y from the List of FlSpot
                  maxY: spots
                      .map((value) => value.y)
                      .reduce((a, b) => a > b ? a : b),
                  // Take maximum value of y from the List of FlSpot
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    show: true,
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        interval: 1,
                        showTitles: true,
                        reservedSize: 30.h,
                        getTitlesWidget: (value, meta) {
                          int index = value.toInt();

                          if (index < 0 || index >= chartDataPointList.length) {
                            return const SizedBox.shrink();
                          }
                          DateTime date = chartDataPointList[index].date;
                          return Text(
                            DateFormat("MMM d").format(date),
                            style: CustomTextStyle.regular(fontSize: 8.sp),
                          );
                        },
                      ),
                    ),
                  ),

                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      color: primaryColor,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [primaryColor, secondaryBackgroundColor],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      dotData: FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
