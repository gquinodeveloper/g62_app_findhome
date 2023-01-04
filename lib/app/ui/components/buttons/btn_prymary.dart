import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g62_find_home/core/theme/app_colors.dart';
import 'package:g62_find_home/core/utils/constant.dart';

class BtnPrimary extends StatelessWidget {
  const BtnPrimary({
    Key? key,
    this.isLoading = false,
    this.text,
    this.isMinWidth = false,
    this.onPressed,
    this.isOutline = false,
    this.textColor = Colors.white,
  }) : super(key: key);

  final void Function()? onPressed;
  final bool isLoading;
  final String? text;
  final bool isMinWidth;
  final bool isOutline;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kRadiusMedium.r),
        color: isOutline ? Colors.white : AppColors.blueDark,
        border: isOutline
            ? Border.all(
                color: AppColors.blueDark,
              )
            : null,
        boxShadow: isOutline
            ? null
            : [
                BoxShadow(
                  color: AppColors.blueDark.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 27,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: MaterialButton(
        minWidth: !isMinWidth ? double.infinity : null,
        height: 55.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadiusMedium.r),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: isLoading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : Text(
                  "$text",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  /* style: AppTextTheme(context).subTitleLargeBold(
                    color: textColor,
                  ), */
                ),
        ),
      ),
    );
  }
}
