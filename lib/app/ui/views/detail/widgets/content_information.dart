import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g62_find_home/app/data/models/response/response_house_model.dart';
import 'package:g62_find_home/core/theme/app_colors.dart';

class ContentInformation extends StatelessWidget {
  ContentInformation({
    required this.house,
  });

  final House house;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
          decoration: BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(color: Colors.black26, width: 0.w),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _tabOptions(
                  context: context,
                  title: "Information",
                  iconSvg: "assets/icons/info.svg",
                  isChecked: true),
              _tabOptions(
                  context: context,
                  title: "Comments",
                  iconSvg: "assets/icons/comments.svg"),
              _tabOptions(
                  context: context,
                  title: "Offers",
                  iconSvg: "assets/icons/menu-4.svg"),
              _tabOptions(
                  context: context,
                  title: "Shared",
                  iconSvg: "assets/icons/shared.svg"),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Text(
            "Description",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: AppColors.blueDark, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Text(
            house.description ?? "",
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.black54, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  _tabOptions(
      {required BuildContext context,
      required String iconSvg,
      required String title,
      bool? isChecked}) {
    isChecked = isChecked ?? false;
    return Column(
      children: [
        SvgPicture.asset(
          iconSvg,
          width: 20.0,
          color: isChecked ? AppColors.cyan : Colors.black26,
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: isChecked ? AppColors.cyan : Colors.black26,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
