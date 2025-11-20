class InventoryListRequestModel {
  String? userName;
  String? passWord;

  InventoryListRequestModel({this.userName, this.passWord});

  InventoryListRequestModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    passWord = json['passWord'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['passWord'] = passWord;
    return data;
  }
}
