import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_color_cons.dart';
import '../../../../../../core/constants/app_constants.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: AppConstants.sfProDisplay,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.c151515,
      ),
    );
  }
}
