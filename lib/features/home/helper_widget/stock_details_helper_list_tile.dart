import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stock_quote/core/common/common_colors.dart';
import 'package:stock_quote/core/common/font/custom_text_style.dart';

class StockDetailsHelperListTile extends StatelessWidget {
  const StockDetailsHelperListTile({
    super.key,
    required this.name,
    required this.value,
  });

  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: CustomTextStyle.medium(
          fontSize: 12.sp,
          color: secondaryFontColor,
        ),
      ),
      trailing: Text(value, style: CustomTextStyle.medium(fontSize: 12.sp)),
    );
  }
}
