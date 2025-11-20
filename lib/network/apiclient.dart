import 'package:dio/dio.dart';

abstract class ApiClient {
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool isWithHeader,
  });
  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
  Future<dynamic> head(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool isWithHeader,
  });
}
