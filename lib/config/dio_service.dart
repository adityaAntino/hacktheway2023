import 'dart:developer';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:hacktheway2023/config/get_it.dart';
import 'package:hacktheway2023/constant/string_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioUtil {
  Dio? _instance;
//method for getting dio instance
  Dio? getInstance() {
    _instance ??= createDioInstance();
    _instance?.interceptors.add(LogInterceptor(
        request: false,
        error: false,
        requestBody: false,
        requestHeader: false,
        responseHeader: false,
        responseBody: true,
        logPrint: (Object object) {
          if (object.toString().contains('uri') ||
              object.toString().contains('message')) {
            log('---->>>> $object');
          }
        }));
    return _instance;
  }

  Dio createDioInstance() {
    final Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    // adding interceptor
    dio.interceptors.clear();
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      final SharedPreferences prefs = getIt<SharedPreferences>();
      final String? accessToken = prefs.getString(StringConstant.accessToken);
      options.headers['Authorization'] = 'Bearer $accessToken';
      options.headers['Platform'] = 'user';
      log('Access Token : $accessToken');

      return handler.next(options); //modify your request
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      // ignore: unnecessary_null_comparison
      if (response != null) {
        return handler.next(response);
      } else if (response == null) {
        log('DIO RESPONSE IS $response');
        log('URL PATH- ${response.realUri.path}');
        return;
      }
    }, onError: (DioError e, ErrorInterceptorHandler handler) async {
      log('DIO API onError : ${e.requestOptions.path}');
      log('DIO RESPONSE ERROR : ${e.response} ${e.error}');
      if (e.response != null) {
        if (e.response?.statusCode == 402) {
          log('Dio Response Code 402');
        }
        if (e.response?.statusCode == 444) {
          log('Dio Response Code 444');
        }
        if (e.response?.statusCode == 445) {
          log('Dio Response Code 445');
        }
        if (e.response?.statusCode == 446) {
          log('Dio Response Code 446');
        }
        if (e.response?.statusCode == 401) {
          log('Dio Response Code 401');
        }
        if (e.response?.statusCode == 400) {
          log('Dio Response Code 400');
        }
        handler.resolve(e.response!);
      }
      // handler.resolve(e.response);
    }));
    return dio;
  }
}
