import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:g62_find_home/app/routes/routes_name.dart';
import 'package:g62_find_home/app/ui/components/logos/custom_logo.dart';
import 'package:g62_find_home/app/ui/components/templates/custom_scaffold.dart';
import 'package:g62_find_home/app/ui/views/splash/splash_controller.dart';
import 'package:g62_find_home/core/theme/app_colors.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size.width);
    print(size.height);
    return GetBuilder<SplashController>(
      builder: (controller) => CustomScaffold(
        showAppBar: false,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomLogo(),
              SizedBox(height: 20.h),
              SizedBox(
                width: 40.w,
                child: const LinearProgressIndicator(
                  backgroundColor: AppColors.blueDark,
                  color: AppColors.cyan,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
