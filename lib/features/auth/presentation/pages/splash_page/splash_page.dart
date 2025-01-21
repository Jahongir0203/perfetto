import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:perfetto/core/constants/app_color_cons.dart';
import 'package:perfetto/core/constants/app_svg_cons.dart';
import 'package:perfetto/core/helpers/enum_helpers.dart';
import 'package:perfetto/core/navigation/route_names.dart';

import '../../../../../injection_container.dart';
import '../../cubits/splash/splash_cubit.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  final splashCubit = sl<SplashCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => splashCubit,
      child: BlocListener<SplashCubit, SplashState>(
        bloc: splashCubit..navigate(),
        listener: (context, SplashState state) {
          if (state.status == RequestStatus.loaded) {
            Navigator.pushReplacementNamed(context, Routes.language);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.cFFFFFF,
          body: Center(
            child: SvgPicture.asset(AppSvgConst.icSplash),
          ),
        ),
      ),
    );
  }
}
