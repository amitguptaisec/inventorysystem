import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'api_const.dart';
import 'apiclient.dart';
import 'exception_handler/exception.dart';
import 'interceptor/dio_logging_interceptor.dart';

class DioClient extends ApiClient {
  Dio? dioClient;
  // CertificatePinning? certificatePin;

  DioClient.defaultClient({BaseOptions? baseOptions, String? baseUrl}) {
    baseOptions ??= BaseOptions(
      baseUrl: baseUrl ?? ApiConst.domain,
      connectTimeout: Duration(seconds: 120),
      receiveTimeout: Duration(seconds: 120),
    );
    dioClient = Dio(baseOptions);
    // dioClient?.interceptors.add(DioCommonHeadersInterceptor());
    if (kDebugMode) {
      dioClient?.interceptors.add(DioLoggingInterceptor());
    }
    // dioClient?.interceptors.add(DioPerformanceInterceptor());
    //dioClient?.interceptors.add(alice.getDioInterceptor());
    // certificatePin=LiveDomainPinning();
  }

  @override
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool isWithHeader = false,
  }) async {
    try {
      // if(uri.contains(ApiConst.liveDomain)){
      //   certificatePin!.loadCertificate(dioClient!);
      // }

      final Response response = await dioClient!.get(
        uri,
        queryParameters: queryParameters,
        options: options,
      );
      if (isWithHeader) {
        return response;
      }
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      throw ExceptionHandler().handleException(e.toString());
    }
  }

  @override
  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      // if(uri.contains(ApiConst.liveDomain)){
      //   certificatePin!.loadCertificate(dioClient!);
      // }

      final Response response = await dioClient!.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      throw ExceptionHandler().handleException(e.toString());
    }
  }

  @override
  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      // if(uri.contains(ApiConst.liveDomain)){
      //   certificatePin!.loadCertificate(dioClient!);
      // }

      final response = await dioClient!.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      throw ExceptionHandler().handleException(e.toString());
    }
  }

  void _handleDioError(DioException e) {
    if (e.requestOptions.path.contains("/api/algo/") &&
        e.response?.data["Data"]["Message"] != null) {
      /*
      if statement is added to handle the intellect api errors in execution algos
       */
      // throw ExceptionHandler().handleException(e.response?.data['Data']['Message']);
      throw e.response?.data["Data"]["Message"];
    } else if (e.message != null) {
      throw ExceptionHandler().handleException(e.message!);
    } else if (e.error != null) {
      throw ExceptionHandler().handleException(e.error.toString());
    } else {
      throw ExceptionHandler().handleException(
        "Something went wrong, please try after some time.",
      );
    }
  }

  @override
  Future head(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool isWithHeader = false,
  }) async {
    try {
      // if(uri.contains(ApiConst.liveDomain)){
      //   certificatePin!.loadCertificate(dioClient!);
      // }
      final Response response = await dioClient!.head(
        uri,
        queryParameters: queryParameters,
        options: options,
      );
      if (isWithHeader) {
        return response;
      }
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      throw ExceptionHandler().handleException(e.toString());
    }
  }
}
