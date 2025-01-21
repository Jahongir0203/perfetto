import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:perfetto/core/constants/locale_keys.g.dart';
import 'package:perfetto/core/exceptions/exceptions.dart';
import 'package:perfetto/core/exceptions/failure.dart';
import 'package:perfetto/core/helpers/enum_helpers.dart';
import 'package:perfetto/features/auth/domain/auth_repository/auth_repository.dart';

part 'otp_state.dart';

part 'otp_cubit.freezed.dart';

class OtpCubit extends Cubit<OtpState> {
  TextEditingController controller = TextEditingController();
  final AuthRepository authRepository;

  OtpCubit(this.authRepository) : super(const OtpState());
  Timer? _timer;
  int _remainingSeconds = 120; // 2 minutes in seconds

  void startTimer() {
    emit(state.copyWith(time: "2:00"));
    _timer?.cancel();
    _remainingSeconds = 120;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        final minutes = _remainingSeconds ~/ 60;
        final seconds = _remainingSeconds % 60;
        emit(state.copyWith(
            time:
                "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}"));
      } else {
        _timer?.cancel();
        emit(state.copyWith(isResend: true));
        // emit(
        //   state.copyWith(time: "00:00"),
        // );
      }
    });
  }

  void resetTimer() {
    _timer?.cancel();
    _remainingSeconds = 120;
    emit(
      state.copyWith(time: "02:00"),
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  checkCode(String phoneNumber) {
    checkTime(phoneNumber);
  }

  Future<void> checkTime(String phoneNumber) async {
    if (state.time == '00:00') {
      try {
        final response = await authRepository.getCode(phoneNUmber: phoneNumber);
        response.fold(
          (l) {},
          (r) {
            startTimer();
          },
        );
      } on ServerFailure catch (e) {
        print(e);
      }
    } else {
      print("else");
      if (controller.text.length < 5) {
        print('Less than 5');
        emit(state.copyWith(error: LocaleKeys.errorCode.tr()));
      } else {
        try {
          final response = await authRepository.verifyCode(
              phoneNumber: phoneNumber, code: controller.text);
          response.fold(
            (l) {
              emit(state.copyWith(error: LocaleKeys.errorCode.tr()));
            },
            (r) {
              emit(state.copyWith(status: RequestStatus.loaded));
            },
          );
        } on ServerFailure catch (e) {
          print(e);
          emit(state.copyWith(error: LocaleKeys.errorCode.tr()));
        }
      }
    }
  }
}
