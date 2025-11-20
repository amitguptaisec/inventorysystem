class StockoutAddRespModel {
  int? status;
  String? success;
  String? error;

  StockoutAddRespModel({this.status, this.success, this.error});

  StockoutAddRespModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    error = json['Error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success'] = success;
    data['Error'] = error;
    return data;
  }
}