import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/stockout_add_req_model.dart';
import '../model/stockout_add_resp_model.dart';
import '../model/stockout_list_page_response_model.dart';
import '../model/stockout_list_page_request_model.dart';

part 'stockout_event.dart';
part 'stockout_state.dart';

class StockoutBloc extends Bloc<StockoutEvent, StockoutState> {
  var stockoutRepo;

  StockoutBloc({required this.stockoutRepo}) : super(StockoutInitial()) {
    on<StockoutListEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      emit(StockoutLoadingState());
      try {
        StockoutListRespModel stockoutresp = await stockoutRepo.loginpage(
          jsonPostdata: StockoutListRequestModel(
            userName: prefs.getString("saved_username"),
            passWord: prefs.getString("saved_password"),
          ),
        );

        if (stockoutresp.status == 200) {
          emit(StockoutListSuccessstate(stockoutListResp: stockoutresp));
        } else {
          emit(StockoutListFailedState(message: stockoutresp.error.toString()));
        }
      } catch (e) {
        debugPrint("-----> $e");
        emit(StockoutListFailedState(message: e.toString()));
      } //
    });

    on<StockoutAddEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      emit(StockoutLoadingState());
      try {
        StockoutAddRespModel stockoutresp = await stockoutRepo.loginpage(
          jsonPostdata: StockoutAddReqModel(
            userName: prefs.getString("saved_username"),
            passWord: prefs.getString("saved_password"),
            inventoryId: event.inventoryId,
            quantity: event.quantity,
          ),
        );

        if (stockoutresp.status == 200) {
          emit(StockoutAddSuccessstate(stockoutAddResp: stockoutresp));
        } else {
          emit(StockoutListFailedState(message: stockoutresp.error.toString()));
        }
      } catch (e) {
        debugPrint("-----> $e");
        emit(StockoutListFailedState(message: e.toString()));
      } //
    });
  }
}
