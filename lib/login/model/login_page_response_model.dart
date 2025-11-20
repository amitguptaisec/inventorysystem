class LoginPageResponseModel {
  int? status;
  String? token;
  String? email;
  String? message;

  LoginPageResponseModel({this.status, this.token, this.email, this.message});

  LoginPageResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    email = json['email'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['token'] = token;
    data['email'] = email;
    data['message'] = message;
    return data;
  }
}

// class LoginPageResponseModel {
//  int? status;
//   String? success;
//   String? error;

//   LoginPageResponseModel({this.status, this.success, this.error});

//   LoginPageResponseModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     success = json['success'];
//     error = json['Error'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['success'] = success;
//     data['Error'] = error;
//     return data;
//   }
// }
