import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:new_york_times/env.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();

      dio!.interceptors.add(AppendHeaderInterceptor());
      addDioLoggerInterceptor();
      addCashInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioLoggerInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
      ),
    );
  }

  static void addCashInterceptor() {
    final options = CacheOptions(
      // A default store is required for interceptor.
      store: MemCacheStore(),
      // Default.
      policy: CachePolicy.refresh,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 7),
      priority: CachePriority.normal,
      cipher: null,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );
    dio?.interceptors.add(DioCacheInterceptor(options: options));
  }
}

class AppendHeaderInterceptor extends Interceptor {
  AppendHeaderInterceptor();

  Duration timeOut = const Duration(seconds: 30);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.connectTimeout = timeOut;
    options.receiveTimeout = timeOut;
    options.headers['Accept'] = 'application/json';
    options.queryParameters['api-key'] = Env.apiKEY;

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      log("InValid Token");
      /// Function for refresh token
      /// await refreshToken();
    }
    // Pass the error to the next interceptor in the chain.
    handler.next(err);
  }
}
