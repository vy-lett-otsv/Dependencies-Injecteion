import 'dart:io';

import 'package:dio/dio.dart';

import '../../core/app_strings.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = AppString.cancelRequest;
        break;
      case DioExceptionType.badCertificate:
        message = AppString.badCertificate;
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioExceptionType.connectionError:
        message = AppString.connectionError;
        break;
      case DioExceptionType.connectionTimeout:
        message = AppString.connectionTimeOut;
        break;
      case DioExceptionType.receiveTimeout:
        message = AppString.receiveTimeOut;
        break;
      case DioExceptionType.unknown:
        if (dioError.error is SocketException) {
          message = AppString.socketException;
          break;
        }
        message = AppString.unexpectedError;
        break;
      default:
        message = AppString.unknownError;
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return AppString.badRequest;
      case 401:
        return AppString.unauthorized;
      case 403:
        return AppString.forbidden;
      case 404:
        return AppString.notFound;
      case 422:
        return AppString.duplicateEmail;
      case 500:
        return AppString.internalServerError;
      case 502:
        return AppString.badGateway;
      default:
        return AppString.unknownError;
    }
  }

  @override
  String toString() => message;
}
