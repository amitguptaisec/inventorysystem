class CategoryListRespModel {
  int? status;
  Success? success;
  String? error;

  CategoryListRespModel({this.status, this.success, this.error});

  CategoryListRespModel.fromJson(Map<String, dynamic> json) {
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
  List<CategoryList>? categoryList;

  Success({this.categoryList});

  Success.fromJson(Map<String, dynamic> json) {
    if (json['Category_List'] != null) {
      categoryList = <CategoryList>[];
      json['Category_List'].forEach((v) {
        categoryList!.add(CategoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categoryList != null) {
      data['Category_List'] =
          categoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryList {
  int? categoryId;
  String? categoryName;

  CategoryList({this.categoryId, this.categoryName});

  CategoryList.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    return data;
  }
}