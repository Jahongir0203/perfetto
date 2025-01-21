import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:perfetto/core/constants/time_delay_cons.dart';
import 'package:perfetto/core/helpers/enum_helpers.dart';

part 'splash_state.dart';

part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  navigate() async {
    emit(state.copyWith(status: RequestStatus.loading));
    await Future.delayed(
      TimeDelayCons.duration3,
      () {
        emit(state.copyWith(status: RequestStatus.loaded));
      },
    );
  }
}
