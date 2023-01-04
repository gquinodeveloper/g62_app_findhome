import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g62_find_home/app/ui/views/login/widgets/form_login.dart';
import 'package:g62_find_home/core/theme/app_colors.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipPath(
        clipper: _CustomClipper(),
        child: Container(
          color: AppColors.background,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: const FormLogin(),
        ),
      ),
    );
  }
}

class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..moveTo(size.width, size.height)
    ..lineTo(0, size.height)
    ..lineTo(0, size.height * .3)
    ..arcToPoint(
      Offset(size.width * .03, size.height * .25),
      radius: Radius.circular(40.r),
    )
    ..lineTo(size.width * .4, size.height * .03)
    ..quadraticBezierTo(size.width * .45, 0, size.width * .5, 0)
    ..quadraticBezierTo(size.width * .55, 0, size.width * .6, size.height * .03)
    ..lineTo(size.width * .97, size.height * .25)
    ..arcToPoint(
      Offset(size.width, size.height * .3),
      radius: Radius.circular(40.r),
    )
    ..lineTo(size.width, size.height)
    ..close();

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
