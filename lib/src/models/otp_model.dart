class OtpResponseModel<T>{

  T data;
  int code;

  OtpResponseModel({
    required this.data,
    this.code=200
  });

}




class OtpModel {
  String? phone;
  String? code;

  OtpModel({
    required this.phone,
    required this.code,
  });

  OtpModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['code'] = code;
    return data;
  }
}