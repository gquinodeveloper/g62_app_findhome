import 'package:flutter/material.dart';
import 'package:g62_find_home/app/ui/views/home/home_controller.dart';
import 'package:g62_find_home/app/ui/views/home/widgets/category.dart';
import 'package:g62_find_home/app/ui/views/home/widgets/header.dart';
import 'package:g62_find_home/app/ui/views/home/widgets/houses.dart';
import 'package:g62_find_home/app/ui/views/home/widgets/search.dart';
import 'package:g62_find_home/core/theme/app_colors.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomScrollView(
                  slivers: [
                    Header(),
                    Search(),
                    Category(),
                    Houses(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
