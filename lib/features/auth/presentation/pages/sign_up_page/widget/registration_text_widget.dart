import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_color_cons.dart';
import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/constants/locale_keys.g.dart';
import '../../../../../../core/constants/size_constants.dart';

class RegistrationTextWidget extends StatelessWidget {
  const RegistrationTextWidget({
    super.key, required this.text,
  });
 final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: SizesCons.size_24,
          fontWeight: FontWeight.w700,
          color: AppColors.c151515,
          fontFamily: AppConstants.sfProDisplay),
    );
  }
}
