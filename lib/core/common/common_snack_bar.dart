import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../my_app.dart';
import 'common_colors.dart';
import 'font/custom_text_style.dart';

enum SnackBarType { success, failure, information }

SnackBar snackBarWidget({
  required String message,
  required SnackBarType snackBarType,
}) {
  Color snackBarColor;
  late String title;
  switch (snackBarType) {
    case SnackBarType.success:
      snackBarColor = successColor;
      title = "Successful";
      break;
    case SnackBarType.failure:
      snackBarColor = failureColor;
      title = "Failed";
      break;
    case SnackBarType.information:
      snackBarColor = informationColor;
      title = "Information";
      break;
  }

  return SnackBar(
    backgroundColor: Colors.transparent,
    content: Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
        color: snackBarColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: CustomTextStyle.semiBold(fontSize: 12.r)),
          Text(message, style: CustomTextStyle.semiBold(fontSize: 10.sp)),
        ],
      ),
    ),
  );
}

void showCommonSnackBar({
  required String message,
  required SnackBarType snackBarType,
}) {
  if (scaffoldKey.currentState != null) {
    scaffoldKey.currentState!.showSnackBar(
      snackBarWidget(message: message, snackBarType: snackBarType),
    );
  }
}
