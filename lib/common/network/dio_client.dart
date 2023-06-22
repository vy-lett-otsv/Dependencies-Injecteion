import 'package:dio/dio.dart';
import 'package:injection/common/network/api_config.dart';

class DioClient {
  final Dio dio;

  DioClient(this.dio) {
    dio
      ..options.baseUrl = ApiConfig.baseUrl
      ..options.headers = ApiConfig.header;
  }
}