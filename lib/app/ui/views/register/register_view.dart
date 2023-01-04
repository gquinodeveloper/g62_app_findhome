import 'package:flutter/material.dart';
import 'package:g62_find_home/app/ui/components/templates/custom_scaffold.dart';
import 'package:g62_find_home/app/ui/views/register/register_controller.dart';
import 'package:g62_find_home/app/ui/views/register/widgets/content.dart';
import 'package:g62_find_home/app/ui/views/register/widgets/header.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (controller) => CustomScaffold(
        showAppBar: false,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Header(),
              Content(),
            ],
          ),
        ),
      ),
    );
  }
}
