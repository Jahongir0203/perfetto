import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_color_cons.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/locale_keys.g.dart';

class AppLogInTextWidget extends StatelessWidget {
  const AppLogInTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.haveAnAccount.tr(),
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: AppConstants.sfProDisplay,
              color: AppColors.c000000),
        ),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            padding: WidgetStatePropertyAll(
              EdgeInsets.zero,
            ),
          ),
          child: Text(
            LocaleKeys.enter.tr(),
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: AppConstants.sfProDisplay,
                color: AppColors.c0068E1),
          ),
        ),
      ],
    );
  }
}
