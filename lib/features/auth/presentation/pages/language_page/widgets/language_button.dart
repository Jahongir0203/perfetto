import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perfetto/core/constants/app_constants.dart';
import 'package:perfetto/core/extensions/padding_extensions.dart';
import 'package:perfetto/core/utils/app_utils.dart';

import '../../../../../../core/constants/app_color_cons.dart';
import '../../../../../../core/constants/size_constants.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
    required this.onTap,
    required this.imgUrl,
    required this.lang,
    required this.isLocale,
  });

  final VoidCallback onTap;
  final String imgUrl;
  final String lang;
  final bool isLocale;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.cF3F3F3,
            borderRadius: AppUtils.border10,
            border: isLocale
                ? Border.all(
                    color: AppColors.c0068E1,
                    width: 1.sp,
                  )
                : null),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imgUrl),
            Text(
              lang,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.c000000,
                fontFamily: AppConstants.sfProDisplay,
              ),
            ).paddingOnly(left: SizesCons.size_5.w)
          ],
        ).paddingSymmetric(horizontal: 10.w, vertical: 12.h),
      ),
    );
  }
}
