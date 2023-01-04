import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:g62_find_home/core/theme/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    Key? key,
    this.showAppBar = true,
    this.title,
    this.body,
  }) : super(key: key);

  final bool showAppBar;
  final String? title;
  final Widget? body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cyan,
      appBar: showAppBar
          ? AppBar(
              title: Text(
                "$title",
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          : null,
      body: body,
    );
  }
}
