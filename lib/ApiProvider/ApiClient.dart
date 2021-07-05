import 'dart:async';
import 'dart:io';
import 'package:ecommerce_app/ApiProvider/App_Exception.dart';
import 'package:ecommerce_app/Util/AppUrl.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/Util/Enums.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';



class ApiClient extends GetxService {
  late Dio _dio;

  //this is for header
  static header() => {
        'Content-Type': 'application/json',
      };

  Future<ApiClient> init() async {
    _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      headers: header(),
    ));
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('REQUEST[${options.method}] => PATH: ${options.path} '
              '=> Request Values: ${options.queryParameters}, => HEADERS: ${options.headers}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
          return handler.next(response);
        },
        onError: (err, handler) {
          print('ERROR[${err.response?.statusCode}]');
          return handler.next(err);
        },
      ),
    );
  }

  Future request(String url, Method method, Map<String, dynamic>? params,
      bool formData) async {
    Response response;

    try {
      if (method == Method.POST) {
        response = await _dio.post(url,
            data: formData == true ? FormData.fromMap(params!) : params);
      } else if (method == Method.DELETE) {
        response = await _dio.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio.patch(url);
      } else {
        response = await _dio.get(
          url,
          queryParameters: params,
        );
      }

      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 400) {
        throw BadRequestException("${response.data}", url.toString());
      } else if (response.statusCode == 403) {
        throw UnauthorizedException("${response.data}", url.toString());
      } else {
        throw FetchDataException("${response.data}", url.toString());
      }
    } on SocketException {
      throw FetchDataException("No internet Connection", url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "Api not responding in time", url.toString());
    } catch (e) {
      return {'error in Api_client ${e.toString()}'};
    }
  }
}
