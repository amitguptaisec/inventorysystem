part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessstate extends LoginState {
  final LoginPageResponseModel loginResp;
  const LoginSuccessstate({required this.loginResp});
  @override
  List<Object> get props => [loginResp];
}

class LoginFailedState extends LoginState {
  final String? message;
  const LoginFailedState({required this.message});
  @override
  List<String> get props => [message.toString()];
}
class CategoryLoadingState extends LoginState {}

class CategoryListSuccessstate extends LoginState {
  final CategoryListRespModel categoryListResp;
  const CategoryListSuccessstate({required this.categoryListResp});
  @override
  List<Object> get props => [categoryListResp];
}