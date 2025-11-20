import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    // on<LoginPasswordChanged>((event, emit) {
    //   emit(state.copyWith(password: event.password));
    // });

    // on<LoginSubmitted>((event, emit) async {
    //   emit(state.copyWith(isSubmitting: true, error: null));

    //   final success = await repository.login(state.username, state.password);

    //   if (success) {
    //     emit(state.copyWith(isSubmitting: false, success: true));
    //   } else {
    //     emit(state.copyWith(
    //       isSubmitting: false,
    //       success: false,
    //       error: "Invalid username or password",
    //     ));
    //   }
    // });
  }
}
