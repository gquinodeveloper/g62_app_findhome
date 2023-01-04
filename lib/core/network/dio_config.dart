import 'package:dio/dio.dart';
import 'package:g62_find_home/core/environment/env.dart';
import 'package:g62_find_home/core/network/interceptors/logger_interceptor.dart';
import 'package:get/get.dart';

class DioConfig {
  static void initialize() {
    Get.put(
      Dio(
        BaseOptions(
          baseUrl: Environment.appConfig["baseUrl"],
          connectTimeout: Environment.appConfig["connectTimeout"],
          receiveTimeout: Environment.appConfig["receiveTimeout"],
          sendTimeout: Environment.appConfig["sendTimeout"],
          responseType: ResponseType.json,
        ),
      )..interceptors.addAll([
          LoggerInterceptor(),
        ]),
    );
  }
}
