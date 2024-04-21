import 'package:firebase_auth/firebase_auth.dart';

class AuthData {
  bool isSuccess;
  User? user;
  late String errorMessage;
  String errorCode;
  late String email;
  late String password;
  late String phoneNumber;
  late String verificationId;
  late String otp;
  late String uniqueId;

  AuthData({
    this.isSuccess = false,
    this.user,
    this.errorMessage = '',
    this.errorCode = '',
    this.email = '',
    this.password = '',
    this.phoneNumber = '',
    this.verificationId = '',
    this.otp = '',
    this.uniqueId = '',
  });

  @override
  String toString() {
    return '\nuniqueId: $uniqueId,\nisSuccess: $isSuccess, \nuser: $user, \nEmail: $email, \nPassword:$password, \nerrorMessage: $errorMessage, \notp: $otp \nphoneNumber: $phoneNumber \nverificationId: $verificationId';
  }
}
