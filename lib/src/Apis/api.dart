import 'package:dio/dio.dart';


class Apis {

  //App production
  static bool appProduction = false;

  //local server url
  // static String baseUrl = "http://192.168.88.12:4000";

  //staging server url
  // static String baseUrl = "http://41.209.55.126:4000";

  //live server
  static String baseUrl = "https://api.luchian.co.ke/auth";

  static int connectTimeout = 5000;
  static int receiveTimeout = 3000;

  static String sentryDns = "";

  static Dio dio = Dio(
    BaseOptions(
      baseUrl: Apis.baseUrl,
      connectTimeout: Apis.connectTimeout,
      receiveTimeout: Apis.receiveTimeout,
    ),
  );

}
