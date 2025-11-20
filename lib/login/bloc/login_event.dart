part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginPageEvent extends LoginEvent {
  final String? userId;
  final String? pasword;

  const LoginPageEvent({this.userId, this.pasword});

  @override
  List<Object> get props => [];
} 

class CategoryListEvent extends LoginEvent {
  final String? userId;
  final String? pasword;

  const CategoryListEvent({this.userId, this.pasword});

  @override
  List<Object> get props => [];
} 
