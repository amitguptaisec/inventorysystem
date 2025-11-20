part of 'stockout_bloc.dart';

abstract class StockoutState extends Equatable {
  const StockoutState();

  @override
  List<Object?> get props => [];
}

class StockoutInitial extends StockoutState {}

class StockoutLoadingState extends StockoutState {}

class StockoutListSuccessstate extends StockoutState {
  final StockoutListRespModel stockoutListResp;
  const StockoutListSuccessstate({required this.stockoutListResp});
  @override
  List<Object> get props => [stockoutListResp];
}

class StockoutListFailedState extends StockoutState {
  final String? message;
  const StockoutListFailedState({required this.message});
  @override
  List<String> get props => [message.toString()];
}

class StockoutAddSuccessstate extends StockoutState {
  final StockoutAddRespModel stockoutAddResp;
  const StockoutAddSuccessstate({required this.stockoutAddResp});
  @override
  List<Object> get props => [stockoutAddResp];
}

class StockoutAddFailedState extends StockoutState {
  final String? message;
  const StockoutAddFailedState({required this.message});
  @override
  List<String> get props => [message.toString()];
}
