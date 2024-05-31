import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:medical_sync/core/network/api_services.dart';
import 'package:medical_sync/core/network/dio_factory.dart';
import 'package:medical_sync/features/login/data/repository/login_repository.dart';
import 'package:medical_sync/features/login/logic/cubit/login_cubit.dart';
import 'package:medical_sync/features/sign_up/data/repository/signup_repository.dart';
import 'package:medical_sync/features/sign_up/logic/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & Api Services
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));

  // singUp
  getIt
      .registerLazySingleton<SignupRepository>(() => SignupRepository(getIt()));
  getIt.registerLazySingleton<SignupCubit>(() => SignupCubit(getIt()));
}
