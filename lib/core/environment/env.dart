enum ENV {
  DESA,
  QA,
  PROD,
}

extension Environment on ENV {
  static ENV type = ENV.DESA;
  static Map<String, dynamic> get appConfig {
    switch (type) {
      case ENV.DESA:
        return {
          "Environment": "DESARROLLO",
          "baseUrl": "https://api-flutter-curso.herokuapp.com",
          "connectTimeout": 60000,
          "receiveTimeout": 60000,
          "sendTimeout": 60000,
        };
      case ENV.QA:
        return {
          "Environment": "QA",
          "baseUrl": "https://qa-api-reservation-flutter.herokuapp.com",
          "connectTimeout": 60000,
          "receiveTimeout": 60000,
          "sendTimeout": 60000,
        };
      case ENV.PROD:
        return {
          "Environment": "PRODUCCIÓN",
          "baseUrl": "https://prod-api-reservation-flutter.herokuapp.com",
          "connectTimeout": 60000,
          "receiveTimeout": 60000,
          "sendTimeout": 60000,
        };
      default:
        return {};
    }
  }
}
