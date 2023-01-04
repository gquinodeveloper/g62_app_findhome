import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g62_find_home/app/ui/views/register/widgets/form_register.dart';
import 'package:g62_find_home/core/theme/app_colors.dart';

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .75,
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 30.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r),
            topRight: Radius.circular(40.r),
          ),
        ),
        child: FormRegister(),
      ),
    );
  }
}
