import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:perfetto/core/constants/app_color_cons.dart';
import 'package:perfetto/core/constants/app_constants.dart';
import 'package:perfetto/core/constants/app_png_cons.dart';
import 'package:perfetto/core/constants/app_svg_cons.dart';
import 'package:perfetto/core/constants/easy_locale.dart';
import 'package:perfetto/core/constants/locale_keys.g.dart';
import 'package:perfetto/core/constants/size_constants.dart';
import 'package:perfetto/core/extensions/padding_extensions.dart';
import 'package:perfetto/core/theme/text_style.dart';
import 'package:perfetto/core/utils/app_utils.dart';
import 'package:perfetto/features/auth/presentation/pages/language_page/widgets/language_button.dart';

import '../../../../../core/navigation/route_names.dart';
import '../../../../../core/utils/app_utils.dart';
import '../../../../../injection_container.dart';
import '../../cubits/language/language_cubit.dart';
import '../../widgets/app_custom_button.dart';

class LanguagePage extends StatelessWidget {
  LanguagePage({super.key});

  final languageCubit = sl<LanguageCubit>();

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: A, // Status bar color
    //     statusBarIconBrightness: Brightness.light, // Icons color
    //   ),
    // );
    return BlocProvider(
      create: (context) => languageCubit,
      child: BlocBuilder<LanguageCubit, LanguageState>(
        bloc: languageCubit,
        builder: (context, state) {
          return Container(
            color: AppColors.cFFD326,
            child: SafeArea(
              bottom: false,
              child: Scaffold(
                backgroundColor: AppColors.cFFD326,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppSvgConst.icMain).paddingOnly(
                      top: SizesCons.size_36.h,
                      left: SizesCons.size_108.w,
                      right: SizesCons.size_108.w,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizesCons.size_16,
                        ),
                        width: SizesCons.size_100.sw,
                        decoration: BoxDecoration(
                          color: AppColors.cFFFFFF,
                          borderRadius: AppUtils.borderTr30Tl30,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    LocaleKeys.selectLang.tr(),
                                    style: TextStyle(
                                        fontSize: SizesCons.size_24,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.c151515,
                                        fontFamily: AppConstants.sfProDisplay),
                                  ).paddingOnly(
                                      top: SizesCons.size_32.h,
                                      bottom: SizesCons.size_28.h),
                                  LanguageButton(
                                    onTap: () {
                                      languageCubit
                                          .updateLocale(AppConstants.en);
                                      context.setLocale(EasyLocale.all[0]);
                                    },
                                    imgUrl: AppPngConst.flagEn,
                                    lang: AppConstants.english,
                                    isLocale:
                                        EasyLocale.all[0] == context.locale,
                                  ),
                                  LanguageButton(
                                    onTap: () {
                                      languageCubit
                                          .updateLocale(AppConstants.ru);
                                      context.setLocale(EasyLocale.all[1]);
                                    },
                                    imgUrl: AppPngConst.flagRu,
                                    lang: AppConstants.russian,
                                    isLocale:
                                        EasyLocale.all[1] == context.locale,
                                  ).paddingSymmetric(vertical: 12.h),
                                  LanguageButton(
                                    onTap: () {
                                      languageCubit
                                          .updateLocale(AppConstants.uz);
                                      context.setLocale(EasyLocale.all[2]);
                                    },
                                    imgUrl: AppPngConst.flagUz,
                                    lang: AppConstants.uzbek,
                                    isLocale:
                                        EasyLocale.all[2] == context.locale,
                                  ),
                                ],
                              ),
                            ),
                            AppCustomButton(
                              isLoading: false,
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, Routes.signUp);
                              },
                              text: LocaleKeys.continuE.tr(),
                            )
                          ],
                        ),
                      ).paddingOnly(top: SizesCons.size_48.h),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
