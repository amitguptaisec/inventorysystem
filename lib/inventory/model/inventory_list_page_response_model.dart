class InventoryListRespModel {
  int? status;
  Success? success;
  String? error;

  InventoryListRespModel({this.status, this.success, this.error});

  InventoryListRespModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success =
        json['success'] != null ? Success.fromJson(json['success']) : null;
    error = json['Error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (success != null) {
      data['success'] = success!.toJson();
    }
    data['Error'] = error;
    return data;
  }
}

class Success {
  List<InventoryList>? inventoryList;

  Success({this.inventoryList});

  Success.fromJson(Map<String, dynamic> json) {
    if (json['Inventory_List'] != null) {
      inventoryList = <InventoryList>[];
      json['Inventory_List'].forEach((v) {
        inventoryList!.add(InventoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (inventoryList != null) {
      data['Inventory_List'] =
          inventoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InventoryList {
  int? inventoryId;
  String? inventoryName;
  int? quantity;
  String? lastUpdated;
  int? categoryId;
  String? categoryName;

  InventoryList(
      {this.inventoryId,
      this.inventoryName,
      this.quantity,
      this.lastUpdated,
      this.categoryId,
      this.categoryName});

  InventoryList.fromJson(Map<String, dynamic> json) {
    inventoryId = json['inventory_id'];
    inventoryName = json['inventory_name'];
    quantity = json['quantity'];
    lastUpdated = json['last_updated'];
    categoryId = json['CategoryId'];
    categoryName = json['CategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['inventory_id'] = inventoryId;
    data['inventory_name'] = inventoryName;
    data['quantity'] = quantity;
    data['last_updated'] = lastUpdated;
    data['CategoryId'] = categoryId;
    data['CategoryName'] = categoryName;
    return data;
  }
}