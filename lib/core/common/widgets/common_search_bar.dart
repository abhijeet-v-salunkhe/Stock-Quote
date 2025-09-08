import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stock_quote/core/common/common_colors.dart';
import 'package:stock_quote/core/common/font/custom_text_style.dart';

class CommonSearchBar extends StatelessWidget {
  const CommonSearchBar({
    super.key,
    this.readOnly = false,
    this.hintText,
    this.onTap,
    this.onChanged,
  });

  final bool readOnly;
  final String? hintText;
  final void Function()? onTap;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.r),
        border: Border.all(color: primaryBackgroundColor),
        color: secondaryBackgroundColor,
      ),
      child: TextField(
        onTap: onTap,
        onChanged: onChanged,
        readOnly: readOnly,
        style: CustomTextStyle.regular(
          fontSize: 15.sp,
          color: secondaryFontColor,
        ),
        decoration: InputDecoration(
          hintStyle: CustomTextStyle.regular(
            fontSize: 15.sp,
            color: secondaryFontColor,
          ),
          hintText: hintText,
          prefixIcon: Icon(Icons.search, color: secondaryFontColor),
          fillColor: secondaryBackgroundColor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        cursorColor: secondaryFontColor,
      ),
    );
  }
}
