import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_color_cons.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/size_constants.dart';
import '../../../../core/utils/app_utils.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.controller,
    this.preFixIcon,
    this.formatter,
    required this.onTap,
    required this.hintText,
     this.errorText, this.onChanged,
  });

  final VoidCallback onTap;
  final TextEditingController controller;
  final String? preFixIcon;
  final TextInputFormatter? formatter;
  final String hintText;
  final String? errorText;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: SizesCons.size_16,
        fontWeight: FontWeight.w400,
        color: AppColors.c000000,
        fontFamily: AppConstants.sfProDisplay,
      ),
      keyboardType: TextInputType.text,
      inputFormatters: formatter != null ? [formatter!] : null,
      onChanged: onChanged,
      validator: (value) {
        print(value);
      },
      decoration: InputDecoration(
        prefixIcon: preFixIcon != null ? Image.asset(preFixIcon!) : null,
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(
          vertical: SizesCons.size_14.h,
          horizontal: SizesCons.size_12.w,
        ),
        hintStyle: TextStyle(
            fontSize: SizesCons.size_16,
            fontWeight: FontWeight.w400,
            fontFamily: AppConstants.sfProDisplay,
            color: AppColors.c5C697A),
        border: OutlineInputBorder(
          borderRadius: AppUtils.border10,
          borderSide: BorderSide(color: AppColors.cEFEFEF),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppUtils.border10,
          borderSide: BorderSide(color: AppColors.cEFEFEF),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: AppUtils.border10,
          borderSide: BorderSide(color: AppColors.cEFEFEF),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppUtils.border10,
          borderSide: BorderSide(color: AppColors.c9CBEF6),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppUtils.border10,
          borderSide: BorderSide(color: AppColors.cFF1E39),
        ),
        errorStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.cFF1E39,
          fontSize: 12,
          fontFamily: AppConstants.sfProDisplay,
        ),
        errorText: errorText,
        filled: true,
        fillColor: AppColors.cFFFFFF,
      ),
    );
  }
}
