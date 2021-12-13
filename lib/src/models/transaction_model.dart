class TransResponseModel<T>{

  T data;
  int code;

  TransResponseModel({
    required this.data,
    this.code=200
  });

}




class TransModel {
  String? transaction_id;

  TransModel({
    required this.transaction_id,
  });

  TransModel.fromJson(Map<String, dynamic> json) {
    transaction_id = json['transaction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transaction_id'] = transaction_id;
    return data;
  }
}