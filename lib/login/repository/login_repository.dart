import 'dart:convert';
import 'package:dio/dio.dart';

import '../../network/api_builder.dart';
import '../../network/api_const.dart';
import '../../network/apiclient.dart';
import '../../network/exception_handler/exception.dart';
import '../model/login_page_response_model.dart';

abstract class LoginRepo {
  Future loginpage({required jsonPostdata});
}

class LoginRepoImpl extends LoginRepo {
  final ApiClient _apiClient = ApiBuilder().apiClient();

  @override
  Future loginpage({jsonPostdata}) async {
    try {
      Response response = await _apiClient.post(
        ApiConst.loginapi,
        data: json.encode(jsonPostdata),
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        LoginPageResponseModel loginRespData = LoginPageResponseModel.fromJson(
          response.data,
        );
        return loginRespData;
      } else {
        var error = ExceptionHandler().handleException(response.data["Error"]);
        LoginPageResponseModel loginRespData = LoginPageResponseModel.fromJson(
          response.data,
        );
        var data = {"Status": 500, "Error": error, "Success": loginRespData};

        return data;
      }
    } catch (e) {
      rethrow;
    }
  }
}
