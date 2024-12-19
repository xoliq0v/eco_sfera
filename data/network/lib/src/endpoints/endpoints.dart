mixin AuthEndpoint {
  static const base = 'api/employee/login';
}

mixin ClientEndpoint {

  static const _basePath = 'api/employee';

  static String clientData = '$_basePath/data';
  static String logout = '$_basePath/logout';

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

}

mixin BuyEndpoint {

  static const _basePath = 'api/order';

  static String buy = _basePath;

}

mixin HistoryEndpoint{

  static const _basePath = 'api/order-history';

  static String history = _basePath;

}