import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_quote/core/app_routes/app_routes.dart';
import 'package:stock_quote/core/common/common_colors.dart';
import 'package:stock_quote/bottom_navigation/bottom_navigation.dart';
import 'package:stock_quote/features/home/home_screen.dart';
import 'package:stock_quote/features/search/search_stocks_screen.dart';

import 'core/common/font/custom_text_style.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isTablet = constraints.maxWidth >= 600;
        return ScreenUtilInit(
          designSize: isTablet ? Size(768, 1024) : Size(375, 812),
          builder: (context, child) => SafeArea(
            child: GetMaterialApp(
              scaffoldMessengerKey: scaffoldKey,
              debugShowCheckedModeBanner: false,
              getPages: AppRoutes.getPages(),
              home: BottomNavigation(),
            ),
          ),
        );
      },
    );
  }
}
