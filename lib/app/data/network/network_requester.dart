import 'dart:developer';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:starter/app/data/values/constants.dart';
import 'package:starter/app/data/values/env.dart';
import 'package:starter/utils/helper/exception_handler.dart';
import 'package:starter/utils/storage/storage_utils.dart';

class NetworkRequester {
  late Dio _dio;

  static final NetworkRequester public = NetworkRequester._publicRequest();

  NetworkRequester._publicRequest() {
    preparePublicRequest();
  }

  void preparePublicRequest() {
    BaseOptions dioOptions = BaseOptions(
      connectTimeout: Timeouts.CONNECT_TIMEOUT,
      receiveTimeout: Timeouts.RECEIVE_TIMEOUT,
      baseUrl: Env.baseURL,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {
        'Accept': Headers.jsonContentType,
      },
    );

    _dio = Dio(dioOptions);

    _dio.interceptors.clear();

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    _dio.interceptors.add(LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      logPrint: _printLog,
    ));
    // DioCacheManager(CacheConfig(baseUrl: Env.baseURL)).interceptor;
  }

  static final NetworkRequester shared = NetworkRequester._privateConstructor();

  NetworkRequester._privateConstructor() {
    prepareRequest();
  }

  NetworkRequester._authenticatedRequest() {
    prepareAuthenticatedRequest();
  }

  NetworkRequester._rawRequest() {
    prepareRawRequest();
  }

  static final NetworkRequester authenticated =
      NetworkRequester._authenticatedRequest();

  static final NetworkRequester raw = NetworkRequester._rawRequest();

  void prepareRawRequest() {
    _dio = Dio();

    _dio.interceptors.clear();

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _dio.interceptors.add(LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      logPrint: _printLog,
    ));
    // DioCacheManager(CacheConfig(baseUrl: Env.baseURL)).interceptor;
  }

  void prepareAuthenticatedRequest() {
    log('PRIORITY: ${Storage.getToken()}');
    debugPrint('PRIORITY: ${Storage.getToken()}');
    BaseOptions dioOptions = BaseOptions(
      connectTimeout: Timeouts.CONNECT_TIMEOUT,
      receiveTimeout: Timeouts.RECEIVE_TIMEOUT,
      baseUrl: Env.baseURL,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {
        'Accept': Headers.jsonContentType,
        'Authorization': 'Bearer ${Storage.getToken()}',
      },
    );

    _dio = Dio(dioOptions);

    _dio.interceptors.clear();

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    _dio.interceptors.addAll([
      LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        logPrint: _printLog,
      ),
      // DioCacheManager(CacheConfig(baseUrl: Env.baseURL)).interceptor
    ]);
  }

  void prepareRequest() {
    BaseOptions dioOptions = BaseOptions(
      connectTimeout: Timeouts.CONNECT_TIMEOUT,
      receiveTimeout: Timeouts.RECEIVE_TIMEOUT,
      baseUrl: Env.baseURL,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {
        'Accept': Headers.jsonContentType,
      },
    );

    _dio = Dio(dioOptions);

    _dio.interceptors.clear();

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _dio.interceptors.add(LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      logPrint: _printLog,
    ));
    // DioCacheManager(CacheConfig(baseUrl: Env.baseURL)).interceptor;
  }

  _printLog(Object object) => log(object.toString());

  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: query);
      return response.data;
    } on Exception catch (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.post(
        path,
        queryParameters: query,
        data: data,
      );
      return response.data;
    } on Exception catch (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> put({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.put(path, queryParameters: query, data: data);
      return response.data;
    } on Exception catch (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> patch({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response =
          await _dio.patch(path, queryParameters: query, data: data);
      return response.data;
    } on Exception catch (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> delete({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response =
          await _dio.delete(path, queryParameters: query, data: data);
      return response.data;
    } on Exception catch (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
      return ExceptionHandler.handleError(error);
    }
  }

  // Future<dynamic> uploadFile({
  //   required String path,
  //   Map<String, dynamic>? query,
  //   required bool isImage,
  //   required File file,
  //   required Function(int count, int total) progressCallback,
  // }) async {
  //   final asset = FormData.fromMap({
  //     "file": await MultipartFile.fromFile(file.path,
  //         filename: file.path.split('/').last,
  //         contentType: isImage
  //             ? MediaType('image', 'jpeg')
  //             : MediaType('application', 'pdf'))
  //   });
  //   try {
  //     final response = await _dio.put(path,
  //         queryParameters: query,
  //         data: asset,
  //         onSendProgress: (count, total) => progressCallback(count, total));
  //
  //     debugPrint("response pdf: ${response.data}");
  //
  //     http.put(
  //       Uri.parse(path),
  //       headers: {
  //         'Content-Type': isImage ? 'image/jpeg' : 'application/pdf',
  //         'Accept': "*/*",
  //         'Content-Length': File(file.path).lengthSync().toString(),
  //         'Connection': 'keep-alive',
  //       },
  //       body: File(file.path).readAsBytesSync(),
  //     );
  //     return response.data;
  //   } on Exception catch (error, stack) {
  //     FirebaseCrashlytics.instance.recordError(error, stack);
  //     return ExceptionHandler.handleError(error);
  //   }
  // }
}

// class NetworkRequester {
//   late Dio _dio;
//
//   NetworkRequester() {
//     prepareRequest();
//   }
//
//   void prepareRequest() {
//     BaseOptions dioOptions = BaseOptions(
//       connectTimeout: Timeouts.CONNECT_TIMEOUT,
//       receiveTimeout: Timeouts.RECEIVE_TIMEOUT,
//       baseUrl: Env.baseURL,
//       contentType: Headers.jsonContentType,
//       responseType: ResponseType.json,
//       headers: {'Accept': Headers.jsonContentType},
//     );
//
//     _dio = Dio(dioOptions);
//
//     _dio.interceptors.clear();
//
//     _dio.interceptors.add(LogInterceptor(
//       error: true,
//       request: true,
//       requestBody: true,
//       requestHeader: true,
//       responseBody: true,
//       responseHeader: true,
//       logPrint: _printLog,
//     ));
//   }
//
//   _printLog(Object object) => log(object.toString());
//
//   void prepareAuthenticatedRequest() {
//     log('PRIORITY: ${Storage.getToken()}');
//     debugPrint('PRIORITY: ${Storage.getToken()}');
//     BaseOptions dioOptions = BaseOptions(
//       connectTimeout: Timeouts.CONNECT_TIMEOUT,
//       receiveTimeout: Timeouts.RECEIVE_TIMEOUT,
//       baseUrl: Env.baseURL,
//       contentType: Headers.jsonContentType,
//       responseType: ResponseType.json,
//       headers: {
//         'Accept': Headers.jsonContentType,
//         'Authorization': 'Bearer ${Storage.getToken()}',
//       },
//     );
//
//     NetworkRequester._authenticatedRequest() {
//       prepareAuthenticatedRequest();
//     }
//
//     static final NetworkRequester authenticated =
//     NetworkRequester._authenticatedRequest();
//
//   Future<dynamic> get({
//     required String path,
//     Map<String, dynamic>? query,
//   }) async {
//     try {
//       final response = await _dio.get(path, queryParameters: query);
//       return response.data;
//     } on Exception catch (error, stack) {
//       FirebaseCrashlytics.instance.recordError(error, stack);
//       return ExceptionHandler.handleError(error);
//     }
//   }
//
//   Future<dynamic> post({
//     required String path,
//     Map<String, dynamic>? query,
//     Map<String, dynamic>? data,
//   }) async {
//     try {
//       final response = await _dio.post(
//         path,
//         queryParameters: query,
//         data: data,
//       );
//       return response.data;
//     } on Exception catch (error, stack) {
//       FirebaseCrashlytics.instance.recordError(error, stack);
//       return ExceptionHandler.handleError(error);
//     }
//   }
//
//   Future<dynamic> put({
//     required String path,
//     Map<String, dynamic>? query,
//     Map<String, dynamic>? data,
//   }) async {
//     try {
//       final response = await _dio.put(path, queryParameters: query, data: data);
//       return response.data;
//     } on Exception catch (error, stack) {
//       FirebaseCrashlytics.instance.recordError(error, stack);
//       return ExceptionHandler.handleError(error);
//     }
//   }
//
//   Future<dynamic> patch({
//     required String path,
//     Map<String, dynamic>? query,
//     Map<String, dynamic>? data,
//   }) async {
//     try {
//       final response =
//           await _dio.patch(path, queryParameters: query, data: data);
//       return response.data;
//     } on Exception catch (error, stack) {
//       FirebaseCrashlytics.instance.recordError(error, stack);
//       return ExceptionHandler.handleError(error);
//     }
//   }
//
//   Future<dynamic> delete({
//     required String path,
//     Map<String, dynamic>? query,
//     Map<String, dynamic>? data,
//   }) async {
//     try {
//       final response =
//           await _dio.delete(path, queryParameters: query, data: data);
//       return response.data;
//     } on Exception catch (error, stack) {
//       FirebaseCrashlytics.instance.recordError(error, stack);
//       return ExceptionHandler.handleError(error);
//     }
//   }
// }
