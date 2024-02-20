import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'endPoint.dart';

class DioHelper {

  static Dio? dio;

  static init(){
    dio=Dio(
        BaseOptions(
          baseUrl: EndPoint.baseUrl,
          receiveDataWhenStatusError: true,
          headers: {
            "Accept":"application/json",
          }
        )
    );

    dio?.interceptors.add(PrettyDioLogger());
// customization
    dio?.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }


  static Future<Response> getData({
    required String url,
    Map<String,dynamic> ?query,
    Map<String,dynamic>? data,
    String? token,
    bool withToken=false
  })
  async {
    dio!.options.headers = {
      'content-type':'application/json',
      if(withToken)
      'authorization': 'Bearer $token',
    };
    return await dio!.get(url,queryParameters:query,data: data);
  }


  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required dynamic data,
    String? token,
  }) {

    dio!.options.headers = {
      'content-type':'application/json',
      'authorization': 'Bearer $token',
    };
    return dio!.post(url, queryParameters: query, data: data);
  }




  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $token',
    };
    return dio!.put(url, queryParameters: query, data: data);
  }


  static Future<Response> deleteData({
    required String url,
    String? token,
  }) {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $token',
    };
    return dio!.delete(url);
  }






}