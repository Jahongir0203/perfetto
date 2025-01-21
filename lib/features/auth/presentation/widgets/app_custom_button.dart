import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perfetto/core/constants/app_color_cons.dart';
import 'package:perfetto/core/extensions/padding_extensions.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/size_constants.dart';
import '../../../../core/utils/app_utils.dart';

class AppCustomButton extends StatelessWidget {
  const AppCustomButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.isLoading,
  });

  final VoidCallback onTap;
  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: AppColors.cF3F3F3,
        borderRadius: AppUtils.border10,
        highlightColor: AppColors.cF3F3F3,
        hoverColor: AppColors.cF3F3F3,
        child: Container(
          width: SizesCons.size_100.sw,
          decoration: BoxDecoration(
            color: AppColors.cFFD326,
            borderRadius: AppUtils.border10,
          ),
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                ).paddingSymmetric(vertical: SizesCons.size_14.h)
              : Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.c151515,
                      fontFamily: AppConstants.sfProDisplay),
                ).paddingSymmetric(vertical: SizesCons.size_20.h),
        ),
      ).paddingOnly(bottom: SizesCons.size_62.h),
    );
  }
}
