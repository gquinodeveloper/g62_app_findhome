import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g62_find_home/app/routes/routes_name.dart';
import 'package:g62_find_home/app/ui/components/buttons/btn_prymary.dart';
import 'package:g62_find_home/app/ui/components/textfields/input_text.dart';
import 'package:g62_find_home/app/ui/views/login/login_controller.dart';
import 'package:g62_find_home/core/theme/app_colors.dart';

import 'package:get/get.dart';

class FormLogin extends GetView<LoginController> {
  const FormLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Padding(
          padding: EdgeInsets.only(bottom: constraint.maxHeight * .1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Welcome",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: AppColors.blueDark,
                      fontWeight: FontWeight.w900,
                    ),
              ),
              Text(
                "Login form enjoy findhome",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              SizedBox(height: 50.h),
              Obx(
                () => InputText(
                  controller: controller.ctrlTextEmail,
                  iconPrefix: Icons.email_outlined,
                  iconColor: AppColors.light,
                  border: InputBorder.none,
                  keyboardType: TextInputType.emailAddress,
                  labelText: "Email",
                  filled: false,
                  enabledBorderColor: Colors.black26,
                  focusedBorderColor: AppColors.cyan,
                  fontSize: 14.0,
                  fontColor: Colors.black45,
                  errorText: controller.errorTextEmail.value,
                ),
              ),
              SizedBox(height: 20.h),
              Obx(
                () => InputText(
                  controller: controller.ctrlTextPassword,
                  iconPrefix: Icons.lock,
                  iconColor: AppColors.light,
                  border: InputBorder.none,
                  keyboardType: TextInputType.text,
                  labelText: "Password",
                  filled: false,
                  obscureText: true, //controller.isObscureText.value,
                  maxLines: 1,
                  enabledBorderColor: Colors.black26,
                  focusedBorderColor: AppColors.cyan,
                  fontSize: 14.0,
                  fontColor: Colors.black45,
                  suffixIcon: GestureDetector(
                    onTap: controller.showPassword,
                    child: controller.isObscureText.value
                        ? const Icon(
                            Icons.visibility_off_rounded,
                            color: AppColors.light,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: AppColors.light,
                          ),
                  ),
                  errorText: controller.errorTextPassword.value,
                ),
              ),
              SizedBox(height: 30.h),
              Obx(
                () => BtnPrimary(
                  text: "Sign in",
                  isLoading: controller.isLoading.value,
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.doAuthentication,
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    child: Text(
                      "Forgot password",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(color: Colors.black54),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(RoutesName.REGISTER),
                    child: Text(
                      "Create new account",
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: AppColors.blueDark,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
