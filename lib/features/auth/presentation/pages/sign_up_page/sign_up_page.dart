import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:perfetto/core/constants/app_color_cons.dart';
import 'package:perfetto/core/constants/app_constants.dart';
import 'package:perfetto/core/constants/app_png_cons.dart';
import 'package:perfetto/core/constants/app_svg_cons.dart';
import 'package:perfetto/core/constants/easy_locale.dart';
import 'package:perfetto/core/constants/locale_keys.g.dart';
import 'package:perfetto/core/constants/size_constants.dart';
import 'package:perfetto/core/extensions/padding_extensions.dart';
import 'package:perfetto/core/helpers/enum_helpers.dart';
import 'package:perfetto/core/helpers/formatter_helper.dart';
import 'package:perfetto/core/theme/text_style.dart';
import 'package:perfetto/core/utils/app_utils.dart';
import 'package:perfetto/features/auth/presentation/pages/language_page/widgets/language_button.dart';
import 'package:perfetto/features/auth/presentation/pages/sign_up_page/widget/registration_text_widget.dart';
import 'package:perfetto/features/auth/presentation/pages/sign_up_page/widget/title_text_widget.dart';

import '../../../../../core/navigation/route_names.dart';
import '../../../../../core/utils/app_utils.dart';
import '../../../../../injection_container.dart';
import '../../cubits/language/language_cubit.dart';
import '../../cubits/sign_up/sign_up_cubit.dart';
import '../../widgets/app_custom_button.dart';
import '../../widgets/app_text_form_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final signUpCubit = sl<SignUpCubit>();

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: A, // Status bar color
    //     statusBarIconBrightness: Brightness.light, // Icons color
    //   ),
    // );
    return BlocProvider(
      create: (context) => signUpCubit,
      child: BlocConsumer<SignUpCubit, SignUpState>(
        bloc: signUpCubit,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RegistrationTextWidget(
                                    text: LocaleKeys.registration.tr(),
                                  ).paddingOnly(
                                      top: SizesCons.size_32.h,
                                      bottom: SizesCons.size_16.h),
                                  TitleTextWidget(
                                    text: LocaleKeys.name.tr(),
                                  ).paddingOnly(bottom: SizesCons.size_8.h),
                                  AppTextFormField(
                                    controller: signUpCubit.nameController,
                                    onTap: () {},
                                    onChanged: (v) {
                                      signUpCubit.validateName();
                                    },
                                    errorText: state.nameErrorText,
                                    hintText: LocaleKeys.name.tr(),
                                  ).paddingOnly(bottom: SizesCons.size_12.h),
                                  TitleTextWidget(
                                    text: LocaleKeys.phoneNumber.tr(),
                                  ).paddingOnly(bottom: SizesCons.size_8.h),
                                  AppTextFormField(
                                    controller: signUpCubit.phoneController,
                                    onTap: () {},
                                    onChanged: (v) {
                                      signUpCubit.validatePhoneNumber();
                                    },
                                    errorText: state.phoneErrorText,
                                    preFixIcon: AppPngConst.flagUz,
                                    hintText: AppConstants.hintText,
                                    formatter: FormatterHelpers.phoneFormatter,
                                  ).paddingOnly(bottom: SizesCons.size_28.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        LocaleKeys.haveAnAccount.tr(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily:
                                                AppConstants.sfProDisplay,
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
                                              fontFamily:
                                                  AppConstants.sfProDisplay,
                                              color: AppColors.c0068E1),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            AppCustomButton(
                              isLoading: state.status == RequestStatus.loading
                                  ? true
                                  : false,
                              onTap: () {
                                signUpCubit.checkAvailability();
                              },
                              text: LocaleKeys.registration.tr(),
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
        listener: (BuildContext context, SignUpState state) {
          if (state.status == RequestStatus.loaded) {
            print('Success');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(milliseconds: 300),
                backgroundColor: AppColors.cGreen,
                content: Text('Success'),
              ),
            );
            Navigator.pushReplacementNamed(context, Routes.otp,
                arguments: signUpCubit.phoneController.text);
          }

          if (state.status == RequestStatus.error) {
            print('Error');
            ScaffoldMessenger.of(context).showSnackBar(

              snackBarAnimationStyle: AnimationStyle(),
              SnackBar(

                duration: Duration(milliseconds: 300),
                backgroundColor: AppColors.cF04438,
                content: Text(state.errorText ?? "Server Error"),
              ),
            );
          }
        },
      ),
    );
  }
}
