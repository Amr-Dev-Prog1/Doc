import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/networking/api_service.dart';
import 'package:flutter_application_1/core/networking/dio_factory.dart';
import 'package:flutter_application_1/features/login/data/repos/login_repo.dart';
import 'package:flutter_application_1/features/login/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGitIt() async {
  // Dio @ ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));

  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
}
