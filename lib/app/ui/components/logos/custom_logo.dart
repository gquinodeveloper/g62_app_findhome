import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:g62_find_home/core/theme/app_colors.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/icons/find_home.svg"),
        RichText(
          text: TextSpan(
            text: "Find",
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: AppColors.blueDark,
                  fontWeight: FontWeight.w900,
                ),
            children: [
              TextSpan(
                text: "Home",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
