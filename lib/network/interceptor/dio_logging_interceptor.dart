import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioLoggingInterceptor extends Interceptor {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      if (Platform.isIOS) {
        debugPrint("URL >>>>>: ${options.path}");
      } else {
        log("URL >>>>>: ${options.path}");
      }
      if (options.data != null && options.data is String) {
        var data = JsonDecoder().convert(options.data);
        if (Platform.isIOS) {
          debugPrint(
            "REQUEST >>>>>: ${JsonEncoder.withIndent(' ').convert(data)}",
          );
          debugPrint("HEADERS >>>>>: ${options.headers}");
        } else {
          log("REQUEST >>>>>: ${JsonEncoder.withIndent(' ').convert(data)}");
          log("HEADERS >>>>>: ${options.headers}");
        }
      } else {
        log("REQUEST >>>>>: ${options.data}");
      }
    } catch (e) {
      debugPrint("catch >>>>>: ${e.toString()}");
      debugPrint(e.toString());
    }
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    try {
      if (Platform.isIOS) {
        debugPrint("URL: ${response.realUri} ->");
        if (!response.realUri.toString().contains("amazonaws")) {
          debugPrint(
            "RESPONSE: ${JsonEncoder.withIndent(' ').convert(response.data)}",
          );
        }
      } else {
        log("URL: ${response.realUri} ->");
        if (!response.realUri.toString().contains("amazonaws")) {
          log(
            "RESPONSE: ${JsonEncoder.withIndent(' ').convert(response.data)}",
          );
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      if (Platform.isIOS) {
        if (err.response != null) {
          debugPrint(
            "ERROR: $err\n${JsonEncoder.withIndent(' ').convert(err.response?.data)}",
          );
        } else {
          debugPrint("ERROR: $err");
        }
      } else {
        if (err.response != null) {
          log(
            "ERROR: $err\n${JsonEncoder.withIndent(' ').convert(err.response?.data)}",
          );
        } else {
          log("ERROR: $err");
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return super.onError(err, handler);
  }
}
