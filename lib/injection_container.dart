import 'package:get_it/get_it.dart';
import 'package:perfetto/features/auth/data/data_source/auth_data_source.dart';
import 'package:perfetto/features/auth/data/repository/auth_repository_impl.dart';
import 'package:perfetto/features/auth/domain/auth_repository/auth_repository.dart';
import 'package:perfetto/features/auth/presentation/cubits/language/language_cubit.dart';
import 'package:perfetto/features/auth/presentation/cubits/otp/otp_cubit.dart';
import 'package:perfetto/features/auth/presentation/cubits/sign_up/sign_up_cubit.dart';
import 'package:perfetto/features/auth/presentation/cubits/splash/splash_cubit.dart';

final sl = GetIt.instance;

void init() {
  sl.registerFactory<SplashCubit>(() => SplashCubit());
  sl.registerFactory<LanguageCubit>(() => LanguageCubit());
  sl.registerFactory<SignUpCubit>(() => SignUpCubit(sl()));
  sl.registerFactory(
    () => OtpCubit(sl()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authDataSource: sl()),
  );

  sl.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(),
  );
}
