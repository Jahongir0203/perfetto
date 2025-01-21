import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:perfetto/core/constants/app_constants.dart';

import '../../../../../core/helpers/enum_helpers.dart';

part 'language_state.dart';

part 'language_cubit.freezed.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const LanguageState());

  updateLocale(String lang) {
    emit(state.copyWith(lang: lang));
  }
}
