import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:perfetto/core/constants/app_constants.dart';
import 'package:perfetto/core/constants/easy_locale.dart';
import 'package:perfetto/core/navigation/app_routes.dart';
import 'package:perfetto/features/auth/presentation/cubits/language/language_cubit.dart';

import 'core/navigation/route_names.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    saveLocale: true,
    fallbackLocale: EasyLocale.all.last,
    path: AppConstants.localePath,
    supportedLocales: EasyLocale.all,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LanguageCubit>(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(393, 852),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppConstants.perfetto,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              initialRoute: Routes.splash,
              onGenerateRoute: AppRoutes.onGenerateRoutes,
            ),
          );
        },
      ),
    );
  }
}
