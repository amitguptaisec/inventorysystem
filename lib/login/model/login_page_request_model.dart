class LoginRequestModel {
  String? userName;
  String? passWord;

  LoginRequestModel({this.userName, this.passWord});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    userName = json['username'];
    passWord = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = userName;
    data['password'] = passWord;
    return data;
  }
}
