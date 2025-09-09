import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/font/custom_text_style.dart';

class SomeWentWrongWidget extends StatelessWidget {
  const SomeWentWrongWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.all(10.h),
      height: 600.h,
      width: double.infinity,
      child: Center(
        child: Text(
          "Something went wrong",
          style: CustomTextStyle.medium(fontSize: 15.sp),
        ),
      ),
    );
  }
}
