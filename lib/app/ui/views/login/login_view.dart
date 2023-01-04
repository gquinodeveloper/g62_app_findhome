import 'package:flutter/material.dart';
import 'package:g62_find_home/app/routes/routes_name.dart';
import 'package:g62_find_home/app/ui/components/templates/custom_scaffold.dart';
import 'package:g62_find_home/app/ui/views/login/login_controller.dart';
import 'package:g62_find_home/app/ui/views/login/widgets/content.dart';
import 'package:g62_find_home/app/ui/views/login/widgets/header.dart';
import 'package:g62_find_home/core/theme/app_colors.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => CustomScaffold(
        showAppBar: false,
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
              child: Column(
                children: const [
                  Header(),
                  Content(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
