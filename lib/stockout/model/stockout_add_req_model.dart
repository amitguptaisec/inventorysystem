class StockoutAddReqModel {
  String? userName;
  String? passWord;
  int? inventoryId;
  int? quantity;

  StockoutAddReqModel(
      {this.userName, this.passWord, this.inventoryId, this.quantity});

  StockoutAddReqModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    passWord = json['passWord'];
    inventoryId = json['Inventory_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['passWord'] = passWord;
    data['Inventory_id'] = inventoryId;
    data['quantity'] = quantity;
    return data;
  }
}