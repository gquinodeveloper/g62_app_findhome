import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g62_find_home/app/data/models/response/response_house_model.dart';
import 'package:g62_find_home/app/ui/views/detail/widgets/content_information.dart';
import 'package:g62_find_home/core/theme/app_colors.dart';

class Content extends StatelessWidget {
  Content({
    required this.house,
  });

  final House house;

  @override
  Widget build(BuildContext context) {
    final arrTags = house.utilities!.split(',');

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.60,
        padding: EdgeInsets.only(
          top: 30.h,
          left: 20.w,
          right: 20.w,
          bottom: 20.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      RichText(
                          text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: SvgPicture.asset(
                              "assets/icons/location.svg",
                              width: 18.0,
                              color: Colors.black54,
                            ),
                            alignment: PlaceholderAlignment.middle,
                          ),
                          WidgetSpan(
                              child: Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text(
                              "${house.location}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400),
                            ),
                          ))
                        ],
                      )),
                      SizedBox(height: 6.h),
                      Text(
                        "${house.name}",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: AppColors.blueDark,
                            fontWeight: FontWeight.w600),
                      )
                    ])),
                CircleAvatar(
                  foregroundImage: NetworkImage(house.avatar ?? ""),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(children: _utilitiesTags(context, arrTags)),
            SizedBox(height: 10.h),
            Row(
              children: [
                _infoRoom(
                    context: context,
                    count: house.bedroom ?? 0,
                    pathImg: "assets/icons/bedroom.svg"),
                SizedBox(width: 40.h),
                _infoRoom(
                    context: context,
                    count: house.bathroom ?? 0,
                    pathImg: "assets/icons/bathroom.svg"),
                SizedBox(width: 40.h),
                _infoRoom(
                    context: context,
                    count: house.menu ?? 0,
                    pathImg: "assets/icons/menu.svg"),
              ],
            ),
            SizedBox(height: 20.h),
            ContentInformation(
              house: house,
            ),
          ],
        ),
      ),
    );
  }

  _utilitiesTags(BuildContext context, List<String> arrTags) {
    List<Widget> tags = [];

    arrTags.asMap().forEach((index, element) {
      tags.add(Text(
        element.replaceAll("'", ""),
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: Colors.black54, fontWeight: FontWeight.w400),
      ));

      if (index < arrTags.length - 1) {
        tags.add(Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: CircleAvatar(
              backgroundColor: AppColors.cyan.withOpacity(0.7),
              radius: 2.0,
            )));
      }
    });
    return tags;
  }

  _infoRoom(
      {required BuildContext context,
      required String pathImg,
      required int count}) {
    return Row(
      children: [
        SvgPicture.asset(
          pathImg,
          width: 22.0,
          color: Colors.cyan,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              "${count}",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.black54, fontWeight: FontWeight.w400),
            ))
      ],
    );
  }
}
