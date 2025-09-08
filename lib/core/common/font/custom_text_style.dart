import 'package:flutter/material.dart';
import 'package:stock_quote/core/common/font/font_family.dart';

import '../common_colors.dart';

class CustomTextStyle {
  static TextTheme get textTheme => ThemeData.light().textTheme;

  static TextStyle regular({
    required double fontSize,
    Color color = Colors.white,
  }) {
    return textTheme.bodyMedium!.copyWith(
      fontSize: fontSize,
      color: color,
      fontFamily: regularFontFamily,
    );
  }

  static TextStyle medium({
    required double fontSize,
    Color color = Colors.white,
  }) => textTheme.bodyMedium!.copyWith(
    fontSize: fontSize,
    fontFamily: mediumFontFamily,
    color: color,
  );

  static TextStyle semiBold({
    required double fontSize,
    Color color = Colors.white,
  }) => textTheme.bodyMedium!.copyWith(
    fontSize: fontSize,
    fontFamily: semiBoldFontFamily,
    color: color,
  );

  static TextStyle bold({
    required double fontSize,
    Color color = Colors.white,
  }) => textTheme.bodyMedium!.copyWith(
    fontSize: fontSize,
    fontFamily: boldFontFamily,
    color: color,
  );
}
