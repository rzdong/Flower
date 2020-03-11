import 'dart:io';

import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

import 'WheatherInterceptor.dart';

class Weather {


  Weather([this.context]) {
    _options = Options(extra: {"context": context});
  }

  BuildContext context;
  Options _options;

  static Dio dio = new Dio(BaseOptions(
    connectTimeout: 6000,
    baseUrl: 'https://free-api.heweather.net/s6/weather'
  ));

  static String username = "HE1902162359531903";

  static String key = "bc55932daedd4fa9bf52eb374fc9904b";

  static void init() {
    dio.interceptors.add(WheatherInterceptor());
    dio.options.headers[HttpHeaders.authorizationHeader] = "usertoken";
  }

  /// 获取天气
  Future getWeathre({
      Map<String, dynamic> query,
    }) async {
    Map<String, dynamic> queryParameters = formatQuery(query);
    print(queryParameters);
    Response r = await dio.get(
      "/lifestyle",
      queryParameters: queryParameters,
      options: _options,
    );
    print(r.data);
    return r.data.toString();
  }

  /// 格式化参数
  /// 1. 将请求参数格式化为“key=value”格式，如“k1=v1”、“k2=v2”、“k3=v3”；
  /// 2. 去除请求参数中值为空的参数
  /// 3. 去除请求参数中参数为sign 的参数 ( 签名参数不参与签名算法 )
  /// 4. 将第3步剩余的键值对以字典序升序排列，并用 & 符号连接，如 a=1&b=2&m=3&w=4
  /// 5. 将第4步得到的字符串后拼接上API密钥, 假设密钥为 abc , 则 结果为: a=1&b=2&m=3&w=4abc
  /// 6. 将第5步得到的字符串进行MD5加密 ( 注 ：字符集为 UTF-8 )，得到签名结果
  /// 7. 将第6步得到的签名结果 作为参数添加至请求中，参数名为 sign, 即 sign=xxxxxxx
  /// 
  /// ```dart
  ///   enter {
  ///     location: 'beijing'
  ///   }
  ///   output {
  ///     location: 'beijing',
  ///     t: string, // 时间戳（s）
  ///     username: Weather.username
  ///     sign: '经过上面步骤计算出的sign'
  ///   }
  /// ```
  Map<String, dynamic> formatQuery(Map<String, dynamic> params) {
    params["t"] = (DateTime.now().millisecondsSinceEpoch / 1000).round().toString();
    params["username"] = Weather.username;
    // 拷贝map
    Map<String, dynamic> map = Map(); 
    // 合成键值对
    List<String> list = [];
    for (var item in params.keys.toList()) {
      list.add(item + '=' + params[item]);
      map[item] = params[item];
    }
    // key排序
    list.sort();
    // 连接键值对
    String str = list.join('&') + Weather.key;
    // md5转化
    String sign = md5.convert(utf8.encode(str)).toString();
    map["sign"] = sign;
    return map;
  }
}