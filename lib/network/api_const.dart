class ApiConst {
  static const isPointingToLive = false;

  static const uatDomain = "http://192.168.0.2:8000/"; //uat
  static const liveDomain = "http://127.0.0.1:8000/"; //live

  static const domain = isPointingToLive ? liveDomain : uatDomain;
  static const String loginapi = '${domain}api/login/';
  static const String getInventoryList = '${domain}api/GetInventoryList/';
  static const String getStockoutList = '${domain}api/GetStockoutList/';
  static const String addInventory = '${domain}api/AddInventory/';
  static const String addStockout = '${domain}api/AddStockout/';
  static const String getCategoryList = '${domain}api/GetCategoryList/';
}
