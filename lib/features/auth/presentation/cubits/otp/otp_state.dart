part of 'otp_cubit.dart';

@freezed
class OtpState with _$OtpState {
  const factory OtpState({
    RequestStatus? status,
    String? time,
    @Default(null) String? error,
    @Default(false) bool isResend,
  }) = _OtpState;
}
