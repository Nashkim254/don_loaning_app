// //Otp
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:don/src/Apis/api.dart';
import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/models/history_model.dart';
import 'package:don/src/models/loan_payback_model.dart';
import 'package:don/src/models/login_model.dart';
import 'package:don/src/models/notifications_model.dart';
import 'package:don/src/models/otp_model.dart';
import 'package:don/src/models/phone_model.dart';
import 'package:don/src/models/register.dart';
import 'package:don/src/models/request_loan_model.dart';
import 'package:don/src/models/reset_pass_model.dart';
import 'package:get/get.dart' as state;

FormData convertFormData(body) {
  return FormData.fromMap(body);
}

//send otp to phone
Future<PhoneResponseModel> phone(PhoneModel modelData) async {
  Map? data;
  int? code;
  try {
    Response response = await Apis.dio.post(
      '/request-phone-verify/',
      data: convertFormData(modelData.toJson()),
    );

    print('User created: ${response.data}');
    data = response.data;
    code = 200;
  } on DioError catch (e) {
    ///TODO MK ADD ERRORS
    // MyException exection = MyException();
    data = e.response!.data;
    code = e.response!.statusCode;
    if (e.type == DioErrorType.response) {
      print('catched');
      print(e.response!.statusCode);
      print(e.response!.data);
      data = e.response!.data;
      showToastError('Invalid data Provided');
    }
    if (e.type == DioErrorType.connectTimeout) {
      print('check your connection');
      showToastError('check your connection');
    }

    if (e.type == DioErrorType.receiveTimeout) {
      print('unable to connect to the server');
      showToastError('check your connection');
    }

    if (e.type == DioErrorType.other) {
      print('Something went wrong');
    }
  }
  return PhoneResponseModel(data: data, code: code!);
}

//verify otp
Future<OtpResponseModel> verifyOtp(OtpModel modelData) async {
  Map? data;
  try {
    Response response = await Apis.dio.post(
      '/verify-phone-code/',
      data: convertFormData(modelData.toJson()),
    );

    print('verified: ${response.data}');
    data = response.data;
  } on DioError catch (e) {
    ///TODO MK ADD ERRORS
    // MyException exection = MyException();
    data = e.response!.data;
    if (e.type == DioErrorType.response) {
      print('catched');
      print(e.response!.statusCode);
      print(e.response!.data);
      data = e.response!.data;
      showToastError('Invalid data Provided');
    }
    if (e.type == DioErrorType.connectTimeout) {
      print('check your connection');
      showToastError('check your connection');
    }

    if (e.type == DioErrorType.receiveTimeout) {
      print('unable to connect to the server');
      showToastError('check your connection');
    }

    if (e.type == DioErrorType.other) {
      print('Something went wrong');
    }
  }
  return OtpResponseModel(data: data);
}

//register user
Future<RegisterResponseModel> register(RegisterModel modelData) async {
  Map? data;
  int? code;
  try {
    Response response = await Apis.dio.post(
      '/register/',
      data: convertFormData(modelData.toJson()),
    );

    print('registered: ${response.data}');
    data = response.data;
    code = 200;
  } on DioError catch (e) {
    ///TODO MK ADD ERRORS
    // MyException exection = MyException();
    data = e.response!.data;
    code = e.response!.statusCode;
    if (e.type == DioErrorType.response) {
      print('catched');
      print(e.response!.statusCode);
      print(e.response!.data);
      data = e.response!.data;
      showToastError('A user with similar credentials exists');
    }
    if (e.type == DioErrorType.connectTimeout) {
      print('check your connection');
      showToastError('check your connection');
    }

    if (e.type == DioErrorType.receiveTimeout) {
      print('unable to connect to the server');
      showToastError('check your connection');
    }

    if (e.type == DioErrorType.other) {
      print('Something went wrong');
    }
  }
  return RegisterResponseModel(data: data, code: code!);
}

//Login user
Future<LoginResponseModel> login(LoginModel modelData) async {
  Map? data;
  int? code;
  try {
    Response response = await Apis.dio.post(
      '/login/',
      data: convertFormData(modelData.toJson()),
    );

    print('logged in: ${response.data}');
    data = response.data;
    code = 200;
  } on DioError catch (e) {
    ///TODO MK ADD ERRORS
    // MyException exection = MyException();
    data = e.response!.data;
    code = e.response!.statusCode;
    if (e.type == DioErrorType.response) {
      print('catched');
      print(e.response!.statusCode);
      print(e.response!.data);
      data = e.response!.data;
      state.Get.back();
      showToastError('${e.response!.data['non_field_errors']}');
    }
    if (e.type == DioErrorType.connectTimeout) {
      print('check your connection');
      showToastError('check your connection');
    }

    if (e.type == DioErrorType.receiveTimeout) {
      print('unable to connect to the server');
      showToastError('check your connection');
    }

    if (e.type == DioErrorType.other) {
      print('Something went wrong');
    }
  }
  return LoginResponseModel(data: data, code: code!);
}

//Reset password
Future<PhoneResponseModel> requestResetCode(PhoneModel modelData) async {
  Map? data;
  try {
    Response response = await Apis.dio.post(
      '/request-password-reset-code/',
      data: convertFormData(modelData.toJson()),
    );

    print('verified: ${response.data}');
    data = response.data;
  } on DioError catch (e) {
    ///TODO MK ADD ERRORS
    // MyException exection = MyException();
    data = e.response!.data;
    if (e.type == DioErrorType.response) {
      print('catched');
      print(e.response!.statusCode);
      print(e.response!.data);
      data = e.response!.data;
      showToastError('Invalid data Provided');
    }
    if (e.type == DioErrorType.connectTimeout) {
      print('check your connection');
      showToastError('check your connection');
    }

    if (e.type == DioErrorType.receiveTimeout) {
      print('unable to connect to the server');
      showToastError('check your connection');
    }

    if (e.type == DioErrorType.other) {
      print('Something went wrong');
    }
  }
  return PhoneResponseModel(data: data);
}

//Reset password
Future<RestResponseModel> resetPass(ResetModel modelData) async {
  Map? data;
  try {
    Response response = await Apis.dio.post(
      '/password-reset/',
      data: convertFormData(modelData.toJson()),
    );

    print('verified: ${response.data}');
    data = response.data;
  } on DioError catch (e) {
    ///TODO MK ADD ERRORS
    // MyException exection = MyException();
    data = e.response!.data;
    if (e.type == DioErrorType.response) {
      print('catched');
      print(e.response!.statusCode);
      print(e.response!.data);
      data = e.response!.data;
      showToastError('Invalid data Provided');
    }
    if (e.type == DioErrorType.connectTimeout) {
      print('check your connection');
      showToastError('check your connection');
    }

    if (e.type == DioErrorType.receiveTimeout) {
      print('unable to connect to the server');
      showToastError('check your connection');
    }

    if (e.type == DioErrorType.other) {
      print('Something went wrong');
    }
  }
  return RestResponseModel(data: data);
}

Future<List<History>> getHistory(String token) async {
  try {
    Response response =
        await Apis.dio.get('https://api.luchian.co.ke/customer/loan-history/',
            options: Options(headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Token $token',
            }));
    if (response.statusCode == 200) {
      final body = json.decode(response.data);
      print(body);
      return body;
    }
  } catch (e) {
    print(e);
  }
  return [];
}

//loan history
//
Future<RequestResponseModel> requestLoan(
    RequestModel modelData, String token) async {
  Map? data;
  Dio _dio = Dio();
  try {
    Response response =
        await _dio.post('https://api.luchian.co.ke/customer/loan-history/',
            data: convertFormData(modelData.toJson()),
            options: Options(headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Token $token',
            }));

    print('verified: ${response.data}');
    data = response.data;
  } on DioError catch (e) {
    ///TODO MK ADD ERRORS
    // MyException exection = MyException();
    data = e.response!.data;
    if (e.type == DioErrorType.response) {
      print('catched');
      print(e.response!.statusCode);
      print(e.response!.data);
      data = e.response!.data;
      showToastError('Invalid data Provided');
    }
    if (e.type == DioErrorType.connectTimeout) {
      print('check your connection');
      showToastError('check your connection');
    }

    if (e.type == DioErrorType.receiveTimeout) {
      print('unable to connect to the server');
      showToastError('check your connection');
    }

    if (e.type == DioErrorType.other) {
      print('Something went wrong');
    }
  }
  return RequestResponseModel(data: data);
}

//loan history
Dio _dio = Dio();
Future<List<History>> fetchHis(String token) async {
  var response =
      await _dio.get("https://api.luchian.co.ke/customer/loan-history/",
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Token $token',
          }));

  if (response.statusCode == 200) {
    var jsonString = response.data;
    printSuccess(jsonString);
    return historyFromJson(jsonString);
  }else if(response.statusCode == 401){
    showToastError("${response.statusCode}");
  }
  throw Exception('error fetching history');
}

//Loan repay
Future<LoanPayResponseModel> loanRepay(LoanPayModel modelData,String token) async {
  Map? data;
  int? code;
  try {
    printSuccess(token);
    Response response = await Dio().post(
      'https://api.luchian.co.ke/mpesa/stk-push/',
      data: convertFormData(modelData.toJson()),
      options: Options(
         headers: {
        'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Token $token',
      }
      )
    );

    print('paying in: ${response.data}');
    data = response.data;
    code = 200;
  } on DioError catch (e) {
    ///TODO MK ADD ERRORS
    // MyException exection = MyException();
    data = e.response!.data;
    code = e.response!.statusCode;
    if (e.type == DioErrorType.response) {
      print('catched');
      print(e.response!.statusCode);
      print(e.response!.data);
      data = e.response!.data;
      //showToastError('${e.response!.data['non_field_errors']}');
    }
    if (e.type == DioErrorType.connectTimeout) {
      print('check your connection');
      showToastError('check your connection');
    }

    if (e.type == DioErrorType.receiveTimeout) {
      print('unable to connect to the server');
      showToastError('check your connection');
    }

    if (e.type == DioErrorType.other) {
      print('Something went wrong');
    }
  }
  return LoanPayResponseModel(data: data, code: code!);
}


//loan history
Future<List<Notification>> notify(String token) async {
  var response =
      await _dio.get("https://api.luchian.co.ke/notify/",
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Token $token',
          }));

  if (response.statusCode == 200) {
    var jsonString = response.data;
    printSuccess(response.data);
    return notificationFromJson(jsonString);
  }else if(response.statusCode == 401){
    showToastError("${response.statusCode}");
  }
  throw Exception('error fetching history');
}