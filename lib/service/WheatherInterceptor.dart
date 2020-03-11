
import 'package:dio/dio.dart';

class WheatherInterceptor extends Interceptor {

  @override
  Future onRequest(RequestOptions options) async {
    print("WheatherInterceptor=============");
    return options;
  }
}