class LoanPayResponseModel<T>{

  T data;
  int code;

  LoanPayResponseModel({
    required this.data,
    this.code=200
  });

}




class LoanPayModel {
  String? amount;
  //String? email;
  String? phone;

  LoanPayModel({
    required this.amount,
   // required this.email,
    required this.phone,
  });

  LoanPayModel.fromJson(Map<String, dynamic> json) {
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