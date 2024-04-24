class Apis {
  Apis._();

  /// Base URl from Server
  static String? _baseUrl;

  static set baseUrl(String? url) {
    _baseUrl = url;
  }

  static String get baseUrl => _baseUrl ?? '';

  /// Create User endpoint
  static Uri createUser = Uri.parse("$baseUrl/createUser");

  /// Create Token endpoint
  static Uri createToken = Uri.parse("$baseUrl/createToken");

  /// Check If User Exist Or Not
  static Uri checkUserExist = Uri.parse("$baseUrl/checkUser");
}
