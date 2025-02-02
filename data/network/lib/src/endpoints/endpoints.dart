mixin AuthEndpoint {
  static const base = 'api/employee/login';
}

mixin DriverEndpoint {

  static const _basePath = 'api/employee';

  static String clientData = '$_basePath/data?type=driver';
  static String logout = '$_basePath/logout';
  static String refreshFCMToken = '$_basePath/refresh-device-token';
  static String balance = '$_basePath/balance';
}

mixin CustomerEndpoint {
  static const _basePath = 'api/customers';

  static String customers = _basePath;
  static String search = '$_basePath/search';
  static String regions = 'api/regions';

}

mixin PartnerEndpoint {
  static const _basePath = 'api/partners';


  static String partners = _basePath;
  static String search = '$_basePath/search';
  static String data = 'api/employee/data?type=partner';
  static String order = 'api/partner/driver-orders';
  static String products = 'api/partner/products';
  static String changeStatus = 'api/partner/change-status';
  static String editPartner = 'api/partner/edit';
  static String info = 'api/partner';
  static String createOrder = 'api/employee/order';
  static String comments = 'api/partner/product-descriptions';
  static String postAd = 'api/partner/add-ad';
}

mixin TrashEndpoint {
  static const _basePath = 'api/trashes';

  static String trashes =_basePath;
  static String partnerTrashes = 'api/partner/products';
  static String changeTrashPrice = 'api/partner/edit-product-price'; //api/partner/edit-product-price
  static String addComment = 'api/partner/add-product-description';
}

mixin RouteEndpoint {
  static const _basePath = 'api/routes';

  static String routes = _basePath;
}

mixin OrderEndpoint {

  static const _basePath = 'api/bot-orders';

  static String orders = _basePath;
  static String watch = 'api/accept-order';
  static String changeStatus = 'api/partner/change-order-status';

}

mixin BuyEndpoint {

  static const _basePath = 'api/order';

  static String buy = _basePath;

}

mixin HistoryEndpoint{

  static const _basePath = 'api/order-history';

  static String history = _basePath;
  static String active = '/api/accepted-orders';

}

mixin TransactionEndpoint {
  static const _basePath = '/api/transactions';

  static String driver = _basePath;
}