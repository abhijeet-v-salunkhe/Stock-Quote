import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_colors.dart';
import '../font/custom_text_style.dart';

PreferredSizeWidget commonAppBar({
  required String name,
  Widget? leading,
  List<Widget>? actions,
  PreferredSizeWidget? bottom,
}) {
  return AppBar(
    actions: actions,
    leading: leading,
    backgroundColor: primaryBackgroundColor,
    title: Text(name, style: CustomTextStyle.semiBold(fontSize: 20.sp)),
    centerTitle: true,
    bottom: bottom,
  );
}
