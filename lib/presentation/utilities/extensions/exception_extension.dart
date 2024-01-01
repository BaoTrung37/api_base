import 'package:api_base/presentation/utilities/errors/errors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

extension Error on Exception {
  String get appMessage {
    if (this is DioException) {
      final dioError = this as DioException;
      return dioError.message.toString();
    }
    debugPrint(toString());
    return '';
  }

  AppError get appError {
    if (this is DioException) {
      final dioError = this as DioException;
      ApiErrorType type;
      if (dioError.requestOptions.method == 'POST' ||
          dioError.requestOptions.method == 'PUT' ||
          dioError.requestOptions.method == 'PATCH' ||
          dioError.requestOptions.method == 'DELETE') {
        type = ApiErrorType.send;
      } else {
        type = ApiErrorType.receive;
      }
      return AppError(
        errorMessage: dioError.message,
        type: type,
      );
    }

    return const AppError(errorMessage: '');
  }
}
