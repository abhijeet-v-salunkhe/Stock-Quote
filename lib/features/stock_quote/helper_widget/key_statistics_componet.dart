import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/common_colors.dart';
import '../../../core/common/font/custom_text_style.dart';

class KeyStatisticsComponent extends StatelessWidget {
  const KeyStatisticsComponent({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: CustomTextStyle.regular(
          fontSize: 15.sp,
          color: secondaryFontColor,
        ),
      ),
      subtitle: Text(
        value,
        style: CustomTextStyle.bold(fontSize: 20.sp, color: primaryFontColor),
      ),
    );
  }
}
