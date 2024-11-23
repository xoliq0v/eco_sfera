mixin CategoriesEndpoint {
  static const _basePath = '/api/v1/categories';

  static const top = '$_basePath/top';
  static const all = '$_basePath/all';
}

mixin DrugInfoEndpoint {
  static const _basePath = '/api/v1/drugs-info';

  static String byId(int id) => '$_basePath/$id';
  static String byName = '$_basePath/by-name';
  static String byCategoryId = '$_basePath/by-category-id';
}

mixin OrganizationEndpoint {
  static const _basePath = '/api/v1/organizations';

  static String id(int id) => '$_basePath/$id';

  static String idAdvance(int id) => '$_basePath/$id/advanced-info';
  static String popular = '$_basePath/popular';
  static String nearby = '$_basePath/nearby';
  static String all = '$_basePath/all';
}

mixin DrugControllerEndpoint {
  static const _basePath = '/api/v1/drugs';

  static String favorites = '$_basePath/favorites';
  static String details = '$_basePath/details';
  static String byOrganization = '$_basePath/by-organization';
}

mixin AuthEndpoint {
  static const base = 'api/employee/login';
}

mixin ClientEndpoint {
  static const _basePath = 'api/employee';

  static String client = _basePath;
  static String logout = '$_basePath/logout';
  static String clientData = '$_basePath/data';
}
