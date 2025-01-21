import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_color_cons.dart';
import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/constants/locale_keys.g.dart';
import '../../../../../../core/constants/size_constants.dart';

class OtpPhoneNumberWidget extends StatelessWidget {
  const OtpPhoneNumberWidget({
    super.key,
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: phoneNumber,
          style: TextStyle(
            fontFamily: AppConstants.sfProDisplay,
            fontWeight: FontWeight.w500,
            color: AppColors.c151515,
            fontSize: SizesCons.size_16,
          ),
          children: [
            TextSpan(text: ' '),
            TextSpan(
              text: LocaleKeys.enterSms.tr(),
              style: TextStyle(
                fontFamily: AppConstants.sfProDisplay,
                fontWeight: FontWeight.w500,
                color: AppColors.c151515,
                fontSize: SizesCons.size_16,
              ),
            ),
          ]),
    );
  }
}
