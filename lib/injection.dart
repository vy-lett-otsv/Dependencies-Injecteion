import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injection/common/network/dio_client.dart';
import 'package:injection/data/api/label_api.dart';
import 'package:injection/data/api/user_api.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //Dio
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));

  //User api
  getIt.registerLazySingleton(() => UserApi(dioClient: getIt<DioClient>()));

  //Label api
  getIt.registerLazySingleton(() => LabelApi(dioClient: getIt<DioClient>()));
}