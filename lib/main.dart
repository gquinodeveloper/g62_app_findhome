import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g62_find_home/app/routes/app_views.dart';
import 'package:g62_find_home/app/routes/routes_name.dart';
import 'package:g62_find_home/core/config/app_config.dart';
import 'package:g62_find_home/core/network/dio_config.dart';
import 'package:g62_find_home/core/utils/dependency_injection.dart';
import 'package:get/get.dart';

void main() {
  AppConfig.initialize();
  DioConfig.initialize();
  DependencyInjection.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.SPLASH,
        getPages: AppViews.getViews,
      ),
    );
  }
}
