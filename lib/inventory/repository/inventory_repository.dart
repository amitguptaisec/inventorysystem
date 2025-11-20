import 'dart:convert';
import 'package:dio/dio.dart';

import '../../network/api_builder.dart';
import '../../network/api_const.dart';
import '../../network/apiclient.dart';
import '../../network/exception_handler/exception.dart';
import '../model/inventory_add_resp_model.dart';
import '../model/inventory_list_page_response_model.dart';

abstract class InventoryRepo {
  Future inventoryListpage({required jsonPostdata});
   Future inventoryAddpage({required jsonPostdata});
}

class InventoryRepoImpl extends InventoryRepo {
  final ApiClient _apiClient = ApiBuilder().apiClient();

  @override
  Future inventoryListpage({jsonPostdata}) async {
    try {
      Response response = await _apiClient.post(
        ApiConst.getInventoryList,
        data: json.encode(jsonPostdata),
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        InventoryListRespModel inventoryRespData = InventoryListRespModel.fromJson(
          response.data,
        );
        return inventoryRespData;
      } else {
        var error = ExceptionHandler().handleException(response.data["Error"]);
        InventoryListRespModel inventoryRespData = InventoryListRespModel.fromJson(
          response.data,
        );
        var data = {"Status": 500, "Error": error, "Success": inventoryRespData};

        return data;
      }
    } catch (e) {
      rethrow;
    }
  }
  @override
  Future inventoryAddpage({jsonPostdata}) async {
    try {
      Response response = await _apiClient.post(
        ApiConst.addInventory,
        data: json.encode(jsonPostdata),
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        InventoryAddRespModel inventoryRespData = InventoryAddRespModel.fromJson(
          response.data,
        );
        return inventoryRespData;
      } else {
        var error = ExceptionHandler().handleException(response.data["Error"]);
        InventoryAddRespModel inventoryRespData = InventoryAddRespModel.fromJson(
          response.data,
        );
        var data = {"Status": 500, "Error": error, "Success": inventoryRespData};

        return data;
      }
    } catch (e) {
      rethrow;
    }}
}
