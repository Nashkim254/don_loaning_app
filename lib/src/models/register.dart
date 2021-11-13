class RegisterResponseModel<T>{

  T data;
  int code;

  RegisterResponseModel({
    required this.data,
    this.code=200
  });

}




class RegisterModel {
  String? username;
  String? email;
  String? password1;
  String? password2;

  RegisterModel({
    required this.username,
    required this.email,
    required this.password1,
    required this.password2,
  });

  RegisterModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password1 = json['password1'];
    password2 = json['password2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['password1'] = password1;
    data['password2'] = password2;
    return data;
  }
}