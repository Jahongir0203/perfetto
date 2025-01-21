import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:perfetto/core/extensions/padding_extensions.dart';
import 'package:perfetto/core/helpers/enum_helpers.dart';
import 'package:perfetto/core/navigation/route_names.dart';
import 'package:perfetto/features/auth/presentation/cubits/otp/otp_cubit.dart';
import 'package:perfetto/features/auth/presentation/pages/otp_page/widget/otp_phone_number.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/constants/app_color_cons.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/app_svg_cons.dart';
import '../../../../../core/constants/locale_keys.g.dart';
import '../../../../../core/constants/size_constants.dart';
import '../../../../../core/utils/app_utils.dart';
import '../../../../../injection_container.dart';
import '../../widgets/app_custom_button.dart';
import '../../widgets/app_log_in_text_widget.dart';
import '../sign_up_page/widget/registration_text_widget.dart';

class OtpPage extends StatelessWidget {
  OtpPage({super.key, required this.phoneNumber});

  final String phoneNumber;
  final otpCubit = sl<OtpCubit>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.cFFD326,
      child: BlocProvider(
        create: (context) => otpCubit,
        child: BlocConsumer<OtpCubit, OtpState>(
          bloc: otpCubit..startTimer(),
          builder: (context, state) {
            return SafeArea(
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
                                    text: LocaleKeys.confirmation.tr(),
                                  ).paddingOnly(
                                      top: SizesCons.size_32.h,
                                      bottom: SizesCons.size_16.h),
                                  OtpPhoneNumberWidget(phoneNumber: phoneNumber)
                                      .paddingOnly(bottom: SizesCons.size_10.h),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      PinPutPage(),
                                      Text(
                                        state.time.toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              state.time.toString() == '00:00'
                                                  ? AppColors.cF04438
                                                  : AppColors.c2626262,
                                          fontFamily: AppConstants.sfProDisplay,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ).paddingOnly(bottom: SizesCons.size_28.h),
                                  AppLogInTextWidget()
                                ],
                              ),
                            ),
                            AppCustomButton(
                              isLoading: false,
                              onTap: () {
                                print('AaA');
                                otpCubit.checkTime(phoneNumber);
                              },
                              text: state.time.toString() == '00:00'
                                  ? LocaleKeys.resend.tr()
                                  : LocaleKeys.confirmation.tr(),
                            )
                          ],
                        ),
                      ).paddingOnly(top: SizesCons.size_48.h),
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (BuildContext context, OtpState state) {
            if (state.status == RequestStatus.loaded) {
              Navigator.pushReplacementNamed(context, Routes.home);
            }
          },
        ),
      ),
    );
  }
}

class PinPutPage extends StatelessWidget {
  PinPutPage({super.key});

  final otpCubit = sl<OtpCubit>();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: SizesCons.size_43.w,
      height: SizesCons.size_51.h,
      margin: EdgeInsets.only(right: SizesCons.size_14.w),
      textStyle: TextStyle(
          fontSize: 16,
          color: AppColors.c000000,
          fontFamily: AppConstants.sfProDisplay,
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.cEFEFEF),
          borderRadius: AppUtils.border12),
    );

    final errorPinTheme = PinTheme(
      width: SizesCons.size_43.w,
      height: SizesCons.size_51.h,
      textStyle: TextStyle(
          fontSize: 16,
          color: AppColors.cF04438,
          fontFamily: AppConstants.sfProDisplay,
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.cF04438),
          borderRadius: AppUtils.border12),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: AppColors.cEFEFEF,
        width: 1.sp,
      ),
      borderRadius: AppUtils.border12,
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: AppColors.cFFFFFF,
      ),
    );

    return BlocProvider(
      create: (context) => otpCubit,
      child: BlocBuilder<OtpCubit, OtpState>(
        bloc: otpCubit,
        builder: (context, state) {
          print(state.error);
          return Pinput(
            length: 5,
            controller: otpCubit.controller,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            errorText: state.error,
            errorPinTheme: errorPinTheme,
            errorTextStyle: TextStyle(
                fontSize: 16,
                color: AppColors.cF04438,
                fontFamily: AppConstants.sfProDisplay,
                fontWeight: FontWeight.w600),
            onChanged: (value) {

            },
            validator: (s) {

            },

            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onCompleted: (pin) => print(pin),
          );
        },
      ),
    );
  }
}
