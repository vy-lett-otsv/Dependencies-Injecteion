class ApiConfig {
  ApiConfig._();

  static const token = "";

  static const String baseUrl = "http://103.90.234.225:3002";
  static const labelProduct = "/users/me";
  static const header = {
    'Authorization': 'Bearer $token',
  };
}