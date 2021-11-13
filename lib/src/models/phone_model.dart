class PhoneResponseModel<T>{

  T data;
  int code;

  PhoneResponseModel({
    required this.data,
    this.code=200
  });

}




class PhoneModel {
  String? phone;

  PhoneModel({
    required this.phone,
  });

  PhoneModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    return data;
  }
}