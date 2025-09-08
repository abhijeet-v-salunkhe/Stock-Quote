import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_quote/core/app_routes/app_routes.dart';
import 'package:stock_quote/core/common/common_colors.dart';
import 'package:stock_quote/core/common/font/custom_text_style.dart';

class SearchResultTile extends StatelessWidget {
  const SearchResultTile({
    super.key,
    required this.displaySymbol,
    required this.description,
    required this.onTap,
  });
  final String displaySymbol;
  final String description;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        displaySymbol,
        style: CustomTextStyle.semiBold(fontSize: 15.sp),
      ),
      subtitle: Text(
        description,
        style: CustomTextStyle.medium(
          fontSize: 10.sp,
          color: secondaryFontColor,
        ),
      ),
    );
  }
}
