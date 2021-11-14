class LoginResponseModel<T>{

  T data;
  int code;

  LoginResponseModel({
    required this.data,
    this.code=200
  });

}




class LoginModel {
  String? username;
  //String? email;
  String? password;

  LoginModel({
    required this.username,
   // required this.email,
    required this.password,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
   // email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    //data['email'] = email;
    data['password'] = password;
    return data;
  }
}