import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/login_page_request_model.dart';
import '../model/login_page_response_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  var loginRepo;

  LoginBloc({required this.loginRepo}) : super(LoginInitial()) {
    on<LoginPageEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        LoginPageResponseModel loginresp = await loginRepo.loginpage(
          jsonPostdata: LoginRequestModel(
            userName: event.userId,
            passWord: event.pasword,
          ),
        );

        if (loginresp.status == 200) {
          emit(LoginSuccessstate(loginResp: loginresp));
        } else {
          emit(LoginFailedState(message: loginresp.message.toString()));
        }
      } catch (e) {
        debugPrint("-----> $e");
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
