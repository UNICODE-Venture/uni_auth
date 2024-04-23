import 'package:uni_auth/uni_auth.dart';

class UnifonicController {
  UnifonicController._();

  ///* PHONE SEND OTP
  static Future<AuthData> sendOTP(AuthData authFields) async {
    authFields.isSuccess = true;
    return authFields;
  }

  ///* Verify OTP
  static Future<AuthData> verifyOTP(AuthData result) async {
    result.isSuccess = true;
    return result;
  }

  ///* SEND SMS
  static Future<AuthData> sendSms(AuthData result) async {
    result.isSuccess = true;
    return result;
  }
}
