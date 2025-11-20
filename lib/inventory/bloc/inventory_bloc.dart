import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/inventory_add_req_model.dart';
import '../model/inventory_add_resp_model.dart';
import '../model/inventory_list_page_response_model.dart';
import '../model/linventory_list_page_request_model.dart';

part 'inventory_event.dart';
part 'inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  var inventoryRepo;

  InventoryBloc({required this.inventoryRepo}) : super(InventoryInitial()) {
    on<InventoryListEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      emit(InventoryLoadingState());
      try {
        InventoryListRespModel inventoryresp = await inventoryRepo.inventoryListpage(
          jsonPostdata: InventoryListRequestModel(
            userName: prefs.getString("saved_username"),
            passWord: prefs.getString("saved_password"),
          ),
        );

        if (inventoryresp.status == 200) {
          emit(InventoryListSuccessstate(inventoryListResp: inventoryresp));
        } else {
          emit(
            InventoryListFailedState(message: inventoryresp.error.toString()),
          );
        }
      } catch (e) {
        debugPrint("-----> $e");
        emit(InventoryListFailedState(message: e.toString()));
      } //
    });

    on<InventoryAddEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      emit(InventoryLoadingState());
      try {
        InventoryAddRespModel invnetoryresp = await inventoryRepo.inventoryAddpage(
          jsonPostdata: InventoryAddReqModel(
            userName: prefs.getString("saved_username"),
            passWord: prefs.getString("saved_password"),
            categoryId: event.categoryId,
            inventoryName: event.inventoryName,
            quantity: event.quantity,
          ),
        );

        if (invnetoryresp.status == 200) {
          emit(InventoryAddSuccessstate(inventoryAddResp: invnetoryresp));
        } else {
          emit(
            InventoryListFailedState(message: invnetoryresp.error.toString()),
          );
        }
      } catch (e) {
        debugPrint("-----> $e");
        emit(InventoryListFailedState(message: e.toString()));
      } //
    });
  }
}
