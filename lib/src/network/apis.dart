class Apis {
  Apis._();

  /// Base URl from Server
  static String? _baseUrl;

  static set baseUrl(String? url) {
    _baseUrl = url;
  }

  static String get baseUrl => _baseUrl ?? '';

  /// Auth User End-Point
  static String authUser = "$baseUrl/auth/user";

  /// Send Email OTP endpoint
  static Uri sendEmailOTP = Uri.parse("$baseUrl/sendEmail");

  /// Verify OTP endpoint
  static Uri verifyOTP = Uri.parse("$baseUrl/otpVerify");
}
