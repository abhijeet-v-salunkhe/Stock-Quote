import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_quote/features/stock_quote/stock_quote_display_screen.dart';
import 'package:stock_quote/features/watchlist/model/watchlist_model.dart';

import '../../../core/common/common_colors.dart';
import '../../../core/common/font/custom_text_style.dart';

class WatchlistTile extends StatelessWidget {
  const WatchlistTile({
    super.key,
    required this.watchlistModel,
    required this.onTap,
  });

  final WatchlistModel watchlistModel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        watchlistModel.companySymbol,
        style: CustomTextStyle.semiBold(fontSize: 30.sp),
      ),
      subtitle: Text(
        watchlistModel.companyDescription,
        style: CustomTextStyle.medium(
          fontSize: 15.sp,
          color: secondaryFontColor,
        ),
      ),
      trailing: Icon(Icons.bookmark_add, size: 30.h, color: primaryColor),
    );
  }
}
