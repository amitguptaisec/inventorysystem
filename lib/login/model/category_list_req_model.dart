class CategoryListRequestModel {
  String? userName;
  String? passWord;

  CategoryListRequestModel({this.userName, this.passWord});

  CategoryListRequestModel.fromJson(Map<String, dynamic> json) {
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
