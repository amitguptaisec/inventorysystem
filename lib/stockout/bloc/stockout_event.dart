part of 'stockout_bloc.dart';

abstract class StockoutEvent extends Equatable {
  const StockoutEvent();

  @override
  List<Object?> get props => [];
}

class StockoutListEvent extends StockoutEvent {
  final String? userId;
  final String? pasword;

  const StockoutListEvent({this.userId, this.pasword});

  @override
  List<Object> get props => [];
} 
class StockoutAddEvent extends StockoutEvent {
  final String? userId;
  final String? pasword;
  final int? inventoryId;
  final int? quantity;

  const StockoutAddEvent({this.userId,this.pasword,this.inventoryId,this.quantity});

  @override
  List<Object> get props => [];
} 
