import 'package:dio/dio.dart';
import 'dio_exception.dart';

abstract class ApiHelper<T> {
  late final T data;

  Future<bool> _requestMethodTemplate(Future<Response<dynamic>> apiCallback) async {
    final Response response = await apiCallback;
    if (response.statusCode == 200) {
      return true;
    } else {
      throw DioExceptions;
    }
  }

  Future<bool> makePostRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  Future<bool> makePutRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  Future<bool> makeDeleteRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  Future<bool> makeGetRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  Future<List<T>> makeGetRequestList(Future<Response<dynamic>> apiCallback, T Function(Map<String, dynamic> json) getJsonCallback) async {
    final Response response = await apiCallback;

    // final List<T> items = List<T>.from(json.decode(json.encode(response.data)).map((item) => getJsonCallback(item)),
    final List<T> items = List<T>.from(response.data.map((item) => getJsonCallback));
    if (response.statusCode == 200) {
      return items;
    } else {
      throw DioExceptions;
    }
  }
}