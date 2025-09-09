import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/widgets/shimmer_effect.dart';

class StockQuoteShimmerEffect extends StatelessWidget {
  const StockQuoteShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20.h,
      children: [
        ShimmerEffect(containerHeight: 100.h, containerWidth: double.infinity),
        ShimmerEffect(containerHeight: 100.h, containerWidth: double.infinity),
        ShimmerEffect(containerHeight: 300.h, containerWidth: double.infinity),
      ],
    );
  }
}
