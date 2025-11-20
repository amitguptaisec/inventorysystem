import 'dart:convert';
import 'package:dio/dio.dart';

import '../../network/api_builder.dart';
import '../../network/api_const.dart';
import '../../network/apiclient.dart';
import '../../network/exception_handler/exception.dart';
import '../model/stockout_add_resp_model.dart';
import '../model/stockout_list_page_response_model.dart';

abstract class StockoutRepo {
  Future stockoutListpage({required jsonPostdata});
  Future stockoutAddpage({required jsonPostdata});
}

class StockoutRepoImpl extends StockoutRepo {
  final ApiClient _apiClient = ApiBuilder().apiClient();

  @override
  Future stockoutListpage({jsonPostdata}) async {
    try {
      Response response = await _apiClient.post(
        ApiConst.getInventoryList,
        data: json.encode(jsonPostdata),
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        StockoutListRespModel stockoutRespData = StockoutListRespModel.fromJson(
          response.data,
        );
        return stockoutRespData;
      } else {
        var error = ExceptionHandler().handleException(response.data["Error"]);
        StockoutListRespModel stockoutRespData = StockoutListRespModel.fromJson(
          response.data,
        );
        var data = {"Status": 500, "Error": error, "Success": stockoutRespData};

        return data;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future stockoutAddpage({jsonPostdata}) async {
    try {
      Response response = await _apiClient.post(
        ApiConst.addInventory,
        data: json.encode(jsonPostdata),
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        StockoutAddRespModel stockoutRespData = StockoutAddRespModel.fromJson(
          response.data,
        );
        return stockoutRespData;
      } else {
        var error = ExceptionHandler().handleException(response.data["Error"]);
        StockoutAddRespModel stockoutRespData = StockoutAddRespModel.fromJson(
          response.data,
        );
        var data = {"Status": 500, "Error": error, "Success": stockoutRespData};

        return data;
      }
    } catch (e) {
      rethrow;
    }
  }
}
