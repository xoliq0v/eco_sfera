mixin AuthEndpoint {
  static const base = 'api/employee/login';
}

mixin DriverEndpoint {

  static const _basePath = 'api/employee';

  static String clientData = '$_basePath/data?type=driver';
  static String logout = '$_basePath/logout';
  static String refreshFCMToken = '$_basePath/refresh-device-token';

}

mixin CustomerEndpoint {
  static const _basePath = 'api/customers';

  static String customers = _basePath;
  static String search = '$_basePath/search';
}

mixin PartnerEndpoint {
  static const _basePath = 'api/partners';


  static String partners = _basePath;
  static String search = '$_basePath/search';
  static String data = '$_basePath/data?type=partner';
}

mixin TrashEndpoint {
  static const _basePath = 'api/trashes';

  static String trashes =_basePath;
}

mixin RouteEndpoint {
  static const _basePath = 'api/routes';

  static String routes = _basePath;
}

mixin OrderEndpoint {

  static const _basePath = 'api/bot-orders';

  static String orders = _basePath;
  static String watch = 'api/accept-order';

}

mixin BuyEndpoint {

  static const _basePath = 'api/order';

  static String buy = _basePath;

}

mixin HistoryEndpoint{

  static const _basePath = 'api/order-history';

  static String history = _basePath;

}