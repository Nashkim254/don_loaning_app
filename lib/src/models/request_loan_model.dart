class RequestResponseModel<T>{

  T data;
  int code;

  RequestResponseModel({
    required this.data,
    this.code=200
  });

}




class RequestModel {
  String? amount;
  String? filled_form;

  RequestModel({
    required this.amount,
    required this.filled_form,
  });

  RequestModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    filled_form = json['filled_form'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['filled_form'] = filled_form;
    return data;
  }
}