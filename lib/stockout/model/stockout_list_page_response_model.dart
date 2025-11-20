class StockoutListRespModel {
  int? status;
  Success? success;
  String? error;

  StockoutListRespModel({this.status, this.success, this.error});

  StockoutListRespModel.fromJson(Map<String, dynamic> json) {
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
  List<StockoutList>? stockoutList;

  Success({this.stockoutList});

  Success.fromJson(Map<String, dynamic> json) {
    if (json['Stockout_List'] != null) {
      stockoutList = <StockoutList>[];
      json['Stockout_List'].forEach((v) {
        stockoutList!.add(StockoutList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (stockoutList != null) {
      data['Stockout_List'] =
          stockoutList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StockoutList {
  int? stockoutId;
  int? inventoryId;
  String? inventoryName;
  String? categoryName;
  int? quantity;
  String? datetime;

  StockoutList(
      {this.stockoutId,
      this.inventoryId,
      this.inventoryName,
      this.categoryName,
      this.quantity,
      this.datetime});

  StockoutList.fromJson(Map<String, dynamic> json) {
    stockoutId = json['stockout_id'];
    inventoryId = json['inventory_id'];
    inventoryName = json['inventory_name'];
    categoryName = json['category_name'];
    quantity = json['quantity'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stockout_id'] = stockoutId;
    data['inventory_id'] = inventoryId;
    data['inventory_name'] = inventoryName;
    data['category_name'] = categoryName;
    data['quantity'] = quantity;
    data['datetime'] = datetime;
    return data;
  }
}