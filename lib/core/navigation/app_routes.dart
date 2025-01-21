import 'package:flutter/material.dart';
import 'package:perfetto/core/navigation/route_names.dart';
import 'package:perfetto/features/auth/presentation/pages/home_page/home_page.dart';
import 'package:perfetto/features/auth/presentation/pages/language_page/language_page.dart';
import 'package:perfetto/features/auth/presentation/pages/otp_page/otp_page.dart';
import 'package:perfetto/features/auth/presentation/pages/sign_up_page/sign_up_page.dart';
import 'package:perfetto/features/auth/presentation/pages/splash_page/splash_page.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case (Routes.splash):
        return MaterialPageRoute(
          builder: (context) => SplashPage(),
        );

      case (Routes.language):
        return MaterialPageRoute(
          builder: (context) => LanguagePage(),
        );
      case (Routes.signUp):
        return MaterialPageRoute(
          builder: (context) => SignUpPage(),
        );
      case (Routes.otp):
        return MaterialPageRoute(
          builder: (context) => OtpPage(
            phoneNumber: settings.arguments as String,
          ),
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
    }
    return null;
  }
}
