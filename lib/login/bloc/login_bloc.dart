import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/category_list_singleton.dart';
import '../model/category_list_req_model.dart';
import '../model/category_list_resp_model.dart';
import '../model/login_page_request_model.dart';
import '../model/login_page_response_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  var loginRepo;

  LoginBloc({required this.loginRepo}) : super(LoginInitial()) {
    on<LoginPageEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      emit(LoginLoadingState());
      try {
        LoginPageResponseModel loginresp = await loginRepo.loginpage(
          jsonPostdata: LoginRequestModel(
            userName: event.userId,
            passWord: event.pasword,
          ),
        );

        if (loginresp.status == 200) {
          await prefs.setString("saved_username", event.userId.toString());
          await prefs.setString("saved_password", event.pasword.toString());
          await prefs.setString("saved_token", loginresp.token.toString());

          emit(LoginSuccessstate(loginResp: loginresp));
        } else {
          await prefs.remove("saved_username");
          await prefs.remove("saved_password");
          await prefs.remove("saved_token");
          emit(LoginFailedState(message: loginresp.message.toString()));
        }
      } catch (e) {
        debugPrint("-----> $e");
        await prefs.remove("saved_username");
        await prefs.remove("saved_password");
        await prefs.remove("saved_token");
        emit(LoginFailedState(message: e.toString()));
      } //
    });

     on<CategoryListEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      emit(CategoryLoadingState());
      try {
        CategoryListRespModel categoryresp = await loginRepo
            .categoryListpage(
              jsonPostdata: CategoryListRequestModel(
                userName: prefs.getString("saved_username"),
                passWord: prefs.getString("saved_password"),
              ),
            );

        if (categoryresp.status == 200) {
          CategoryListGlobalData().setCategoryList(categoryresp);
          emit(CategoryListSuccessstate(categoryListResp: categoryresp));
        } 
      } catch (e) {
        debugPrint("-----> $e");
      } //
    });
  }
}
