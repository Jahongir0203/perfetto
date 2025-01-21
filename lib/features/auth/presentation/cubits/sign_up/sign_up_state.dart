part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {

  const factory SignUpState({
    RequestStatus? status,
    @Default(false)  bool isAvailable,
    @Default(null) String? phoneErrorText,
    @Default(null) String? nameErrorText,
    @Default(null) String? errorText,
  }) = _SignUpState;
}
