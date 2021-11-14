class RestResponseModel<T>{

  T data;
  int code;

  RestResponseModel({
    required this.data,
    this.code=200
  });

}




class ResetModel {
  String? new_password1;
  String? new_password2;
  String? phone;
  String? code;

  ResetModel({
    required this.new_password1,
    required this.new_password2,
    required this.phone,
    required this.code,
  });

  ResetModel.fromJson(Map<String, dynamic> json) {
    new_password1 = json['new_password1'];
    new_password2 = json['new_password2'];
    phone = json['phone'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['new_password1'] = new_password1;
    data['new_password2'] = new_password2;
    data['code'] = code;
    data['phone'] = phone;
    return data;
  }
}