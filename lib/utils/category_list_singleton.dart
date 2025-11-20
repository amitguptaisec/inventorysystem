import '../login/model/category_list_resp_model.dart';

class CategoryListGlobalData {
  static final CategoryListGlobalData _instance = CategoryListGlobalData._internal();
  factory CategoryListGlobalData() => _instance;

  CategoryListGlobalData._internal();

  // Example fields
  CategoryListRespModel? categoryListData;

  // Setter example
  void setCategoryList(CategoryListRespModel listdata) {
    categoryListData = listdata;
  }
}
