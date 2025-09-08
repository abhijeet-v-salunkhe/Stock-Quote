import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    super.key,
    required this.containerHeight,
    required this.containerWidth,
  });

  final double? containerHeight;
  final double? containerWidth;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade900,
      enabled: true,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10.r),
        ),
        width: containerWidth ?? 50,
        height: containerHeight ?? 200,
      ),
    );
  }
}
