import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g62_find_home/core/theme/app_colors.dart';
import 'package:g62_find_home/core/utils/constant.dart';

class AlertDialogComponent extends StatelessWidget {
  const AlertDialogComponent({
    Key? key,
    this.isPrimaryBanner = false,
    this.imagePathBanner,
    this.headerTitle,
    this.title,
    this.content = "",
    this.textPrimaryButton = "Si",
    this.textSecondaryButton = "No",
    this.isOnlyPrimary = false,
    this.isPrimaryButton = true,
    this.isDismissibleDialog = true,
    this.widgetContent,
    required this.onTapButton,
    this.onTapButtonSecondary,
  }) : super(key: key);

  final bool isPrimaryBanner;
  final String? imagePathBanner;
  final String? headerTitle;
  final String? title;
  final String content;
  final String? textPrimaryButton;
  final String? textSecondaryButton;
  final bool isOnlyPrimary;
  final bool isPrimaryButton;
  final bool isDismissibleDialog;
  final Widget? widgetContent;
  final VoidCallback onTapButton;
  final VoidCallback? onTapButtonSecondary;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (isDismissibleDialog) ? null : () => Future.value(false),
      child: AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            kRadiusMedium.r,
          ),
        ),
        title: (headerTitle != null) ? Text(headerTitle!) : null,
        contentPadding: EdgeInsets.all(15.w),
        content: (widgetContent != null)
            ? widgetContent
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  (imagePathBanner != null)
                      ? Container(
                          height: 80.h,
                          width: double.infinity,
                          padding: EdgeInsets.all(
                            10.0.h,
                          ),
                          decoration: BoxDecoration(
                            color:
                                (isPrimaryBanner) ? AppColors.blueDark : null,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                kRadiusLarge.r,
                              ),
                              topRight: Radius.circular(
                                kRadiusLarge.r,
                              ),
                            ),
                          ),
                          child: Image.asset(
                            imagePathBanner!,
                            //color: (isPrimaryBanner) ? AppColors.kIconWhiteColor : null,
                          ),
                        )
                      : Container(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      (title != null)
                          ? Text(
                              title!,
                              /*  style: AppTextTheme(context).bodyMediumBold(
                                color: AppColors.kRed,
                              ), */
                            )
                          : Container(),
                      (title != null) ? SizedBox(height: 15.h) : Container(),
                      Text(
                        content,
                        /*  style: AppTextTheme(context).bodyMedium(
                          color: AppColors.kPrimary,
                        ), */
                      ),
                    ],
                  ),
                ],
              ),
        actionsAlignment: isOnlyPrimary ? MainAxisAlignment.center : null,
        actions: [
          (isOnlyPrimary)
              ? const SizedBox()
              : MaterialButton(
                  onPressed: (onTapButtonSecondary != null)
                      ? onTapButtonSecondary
                      : () => Navigator.of(context).pop(),
                  elevation: 0.0,
                  height: 35.0.h,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      kRadiusSmall.r,
                    ),
                  ),
                  child: Text(
                    textSecondaryButton!,
                    /*  style: AppTextTheme(context)
                        .bodyMediumBold(color: Colors.white), */
                  ),
                ),
          MaterialButton(
            onPressed: onTapButton,
            elevation: 0.0,
            height: 35.0.h,
            color: (isPrimaryButton) ? AppColors.blueDark : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0.r),
            ),
            child: Text(
              textPrimaryButton!,
              /*  style: AppTextTheme(context).bodyMediumBold(
                color: (isPrimaryButton) ? Colors.white : AppColors.kText,
              ), */
            ),
          )
        ],
      ),
    );
  }
}
