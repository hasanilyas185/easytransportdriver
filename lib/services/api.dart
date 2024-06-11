import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  static final BaseOptions _options = BaseOptions(
    baseUrl: "https://4ad9-39-35-208-229.ngrok-free.app",
    contentType: "application/json",
    connectTimeout: const Duration(milliseconds: 60000),
    receiveTimeout: const Duration(milliseconds: 60000),
    headers: {},
  );
  static final Dio _ins = Dio(_options);
  static Dio get ins => Api._ins;

  static init(GlobalKey<NavigatorState> key) {
    _ins.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        return handler.next(options);
      },
      onResponse: (response, handler) async {
        return handler.next(response);
      },
      onError: (error, interceptor) async {
        interceptor.next(error);
      },
    ));
  }
}
