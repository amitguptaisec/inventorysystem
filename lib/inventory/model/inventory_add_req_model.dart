class InventoryAddReqModel {
  String? userName;
  String? passWord;
  String? inventoryName;
  int? categoryId;
  int? quantity;

  InventoryAddReqModel(
      {this.userName,
      this.passWord,
      this.inventoryName,
      this.categoryId,
      this.quantity});

  InventoryAddReqModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    passWord = json['passWord'];
    inventoryName = json['Inventory_Name'];
    categoryId = json['category_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['passWord'] = passWord;
    data['Inventory_Name'] = inventoryName;
    data['category_id'] = categoryId;
    data['quantity'] = quantity;
    return data;
  }
}