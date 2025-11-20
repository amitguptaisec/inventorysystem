part of 'inventory_bloc.dart';

abstract class InventoryState extends Equatable {
  const InventoryState();

  @override
  List<Object?> get props => [];
}

class InventoryInitial extends InventoryState {}

class InventoryLoadingState extends InventoryState {}

class InventoryListSuccessstate extends InventoryState {
  final InventoryListRespModel inventoryListResp;
  const InventoryListSuccessstate({required this.inventoryListResp});
  @override
  List<Object> get props => [inventoryListResp];
}

class InventoryListFailedState extends InventoryState {
  final String? message;
  const InventoryListFailedState({required this.message});
  @override
  List<String> get props => [message.toString()];
}

class InventoryAddSuccessstate extends InventoryState {
  final InventoryAddRespModel inventoryAddResp;
  const InventoryAddSuccessstate({required this.inventoryAddResp});
  @override
  List<Object> get props => [inventoryAddResp];
}

class InventoryAddFailedState extends InventoryState {
  final String? message;
  const InventoryAddFailedState({required this.message});
  @override
  List<String> get props => [message.toString()];
}
