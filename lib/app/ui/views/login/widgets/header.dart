import 'package:flutter/material.dart';
import 'package:g62_find_home/app/ui/components/logos/custom_logo.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 16.0 / 9.0,
      child: CustomLogo(),
    );
  }
}
