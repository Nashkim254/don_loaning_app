class StkResponseModel<T>{

  T data;
  int code;

  StkResponseModel({
    required this.data,
    this.code=200
  });

}




class StkModel {
  String? amount;
  String? phone;

  StkModel({
    required this.amount,
    required this.phone,
  });

  StkModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
   // email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    //data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}