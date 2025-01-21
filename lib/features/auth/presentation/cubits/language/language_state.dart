part of 'language_cubit.dart';

@freezed
class LanguageState with _$LanguageState {
  const factory LanguageState({
    final RequestStatus? status,
    @Default(AppConstants.en) String lang,
  }) = _LanguageState;
}
