import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../const/api_const.dart';

export '../const/api_const.dart';

final apiProvider = Provider<Dio>((ref) {
  final Dio httpClient = Dio()
    ..options.baseUrl = ApiConst.baseUrl
    ..interceptors.add(PrettyDioLogger(
      requestBody: true,
      responseBody: true,
    ));
  return httpClient;
});

class ErrorMessage implements Exception {
  ErrorMessage(this.message);
  final String message;

  @override
  String toString() {
    return message;
  }
}
