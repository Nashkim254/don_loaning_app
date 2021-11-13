// //Otp
import 'package:dio/dio.dart';
import 'package:don/src/Apis/api.dart';
import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/models/login_model.dart';
import 'package:don/src/models/otp_model.dart';
import 'package:don/src/models/phone_model.dart';
import 'package:don/src/models/register.dart';
FormData convertFormData(body) {
  return FormData.fromMap(body);
}
//send otp to phone
Future<PhoneResponseModel> phone(PhoneModel modelData) async {
  Map? data;
  try {
    Response response = await Apis.dio.post(
      '/request-phone-verify/',
      data: convertFormData(modelData.toJson()),
    );

    print('User created: ${response.data}');
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
  try {
    Response response = await Apis.dio.post(
      '/register/',
      data: convertFormData(modelData.toJson()),
    );

    print('registered: ${response.data}');
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
  return RegisterResponseModel(data: data);
}


//Login user
Future<LoginResponseModel> login(LoginModel modelData) async {
  Map? data;
  try {
    Response response = await Apis.dio.post(
      '/login/',
      data: convertFormData(modelData.toJson()),
    );

    print('logged in: ${response.data}');
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
  return LoginResponseModel(data: data);
}