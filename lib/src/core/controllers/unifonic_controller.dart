import 'package:uni_auth/uni_auth.dart';

class UnifonicController {
  UnifonicController._();

  ///* PHONE SEND OTP
  static Future<AuthData> sendOTP(AuthData authFields) async {
    return authFields;
  }

  ///* Verify OTP
  static Future<AuthData> verifyOTP(AuthData result) async {
    return result;
  }
}
