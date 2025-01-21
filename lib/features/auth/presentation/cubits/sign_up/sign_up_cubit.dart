import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:perfetto/core/constants/locale_keys.g.dart';
import 'package:perfetto/features/auth/domain/auth_repository/auth_repository.dart';

import '../../../../../core/helpers/enum_helpers.dart';

part 'sign_up_state.dart';

part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final AuthRepository authRepository;

  SignUpCubit(this.authRepository) : super(const SignUpState());

  checkAvailability() async {
    if (validateName() && validatePhoneNumber()) {
      emit(
        state.copyWith(
          status: RequestStatus.loading,
          nameErrorText: null,
          phoneErrorText: null,
        ),
      );
      final response =
          await authRepository.getCode(phoneNUmber: phoneController.text);

      response.fold(
        (l) {
          emit(state.copyWith(
              status: RequestStatus.error, errorText: l.errorMessage));
        },
        (r) {
          emit(
            state.copyWith(
                status: RequestStatus.loaded,
                isAvailable: true,
                errorText: null),
          );
        },
      );
    } else {
      validatePhoneNumber();
      validateName();
    }
  }

  checkTextField() {
    checkAvailability();
    validateName();
    validatePhoneNumber();
  }

  bool validatePhoneNumber() {
    if (phoneController.text.length == 17) {
      emit(
        state.copyWith(
          phoneErrorText: null,
        ),
      );
      return true;
    } else {
      emit(
        state.copyWith(
          phoneErrorText: LocaleKeys.enterFullPhoneNumber.tr(),
        ),
      );
      return false;
    }
  }

  bool validateName() {
    if (nameController.text.isNotEmpty) {
      emit(
        state.copyWith(
          nameErrorText: null,
        ),
      );
      return true;
    } else {
      emit(
        state.copyWith(
          nameErrorText: LocaleKeys.errorName.tr(),
        ),
      );
      return false;
    }
  }
}
