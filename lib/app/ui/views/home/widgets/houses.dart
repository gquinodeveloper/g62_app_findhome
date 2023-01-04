import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:g62_find_home/app/data/models/response/response_house_model.dart';
import 'package:g62_find_home/app/routes/routes_name.dart';
import 'package:g62_find_home/app/ui/views/home/home_controller.dart';
import 'package:g62_find_home/core/theme/app_colors.dart';

import 'package:get/get.dart';

class Houses extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        bottom: kBottomNavigationBarHeight * 1.5,
      ),
      sliver: Obx(
        () => SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ItemHouse(house: controller.houses[index]),
            childCount: controller.houses.length,
          ),
        ),
      ),
    );
  }
}

class ItemHouse extends StatelessWidget {
  const ItemHouse({
    required this.house,
  });

  final House? house;

  @override
  Widget build(BuildContext context) {
    final arrPhotos = house!.photo!.split(',');
    return GestureDetector(
      onTap: () {
        print(house);
        Get.toNamed(RoutesName.DETAIL, arguments: house);
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20.0,
          right: 20.0,
        ),
        child: Hero(
          tag: "key_${house!.photo}",
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: AspectRatio(
              aspectRatio: .90,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    arrPhotos[0],
                    fit: BoxFit.fill,
                  ),
                  _Location(location: house?.location ?? ""),
                  _DetailHouse(house: house ?? House()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Location extends StatelessWidget {
  const _Location({this.location});

  final String? location;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.all(20.w),
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 7.5.h,
        ),
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/location.svg',
              width: 15.w,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                location ?? "",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailHouse extends StatelessWidget {
  const _DetailHouse({@required this.house});

  final House? house;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.r),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 25.h),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    house!.name ?? "",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: AppColors.blueDark, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 14,
                              backgroundImage:
                                  NetworkImage(house!.avatar ?? ""),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Text(
                                house!.user ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: AppColors.blueDark),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '\$${house!.price!.toStringAsFixed(0)}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: AppColors.blueDark,
                                  fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        RatingAndReviews(
                          rating: 4,
                          reviews: 145,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingAndReviews extends StatelessWidget {
  const RatingAndReviews({
    this.reviews,
    required this.rating,
  });

  final int? reviews;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(
            5,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 5),
              child: SvgPicture.asset(
                'assets/icons/star.svg',
                width: 15,
                color: (index < rating) ? AppColors.cyan : Colors.black12,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            '$reviews opinions',
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Colors.black26),
          ),
        ),
      ],
    );
  }
}
