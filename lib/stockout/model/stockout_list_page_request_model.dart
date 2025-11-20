class StockoutListRequestModel {
  String? userName;
  String? passWord;

  StockoutListRequestModel({this.userName, this.passWord});

  StockoutListRequestModel.fromJson(Map<String, dynamic> json) {
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
