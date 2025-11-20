part of 'inventory_bloc.dart';

abstract class InventoryEvent extends Equatable {
  const InventoryEvent();

  @override
  List<Object?> get props => [];
}

class InventoryListEvent extends InventoryEvent {
  final String? userId;
  final String? pasword;

  const InventoryListEvent({this.userId, this.pasword});

  @override
  List<Object> get props => [];
} 
class InventoryAddEvent extends InventoryEvent {
  final String? userId;
  final String? pasword;
  final String? inventoryName;
  final int? categoryId;
  final int? quantity;

  const InventoryAddEvent({this.userId,this.pasword,this.inventoryName,this.categoryId,this.quantity});

  @override
  List<Object> get props => [];
} 
