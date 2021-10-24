import 'package:cometocode/resources/app_config.dart';
import 'package:dio/dio.dart';

Dio provideDio({
  required AppConfig appConfig,
  //List<Interceptor> interceptors,
}) {
  BaseOptions options = new BaseOptions(
    baseUrl: "${appConfig.host}",
    headers: {
      'accept': Headers.jsonContentType,
    },
    contentType: Headers.jsonContentType,
    connectTimeout: 130000,
    receiveTimeout: 130000,
  );
  var dio = Dio(options);
  /* if (interceptors != null) {
   //TODO implement interceptors
  };*/
  return dio;
}

//Example
Dio provideDioExample({
  required AppConfig appConfig,
  //List<Interceptor> interceptors,
}) {
  BaseOptions options = new BaseOptions(
    baseUrl: appConfig.host,
    headers: {
      'accept': Headers.jsonContentType,
    },
    contentType: Headers.jsonContentType,
    connectTimeout: 120000,
    receiveTimeout: 120000,
  );
  var dio = Dio(options);
  return dio;
}
