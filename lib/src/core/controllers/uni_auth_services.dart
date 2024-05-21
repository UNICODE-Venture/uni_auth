import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:uni_auth/src/core/controllers/auth_error_handling.dart';
import 'package:uni_auth/src/core/controllers/email_controller.dart';
import 'package:uni_auth/src/core/controllers/unifonic_controller.dart';
import 'package:uni_auth/src/core/models/email_otp_response.dart';
import 'package:uni_auth/src/network/server_calls.dart';
import 'package:uni_auth/uni_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class UniAuthService {
  UniAuthService._();

  ///* Get Display Name
  static String get displayName => _auth.currentUser?.displayName ?? "---";

  ///* Get currently logged in `user` id
  static String get getUserID => _auth.currentUser?.uid ?? '';

  ///* Check user logged or not `bool`
  static bool get checkUserLoggedIn =>
      _auth.currentUser != null && getUserID.isNotEmpty;

  ///* Get currently logged in user
  static User get currentUser => _auth.currentUser!;

  ///* Create User With [Email] and [Password]
  static Future<AuthData> createUserWithEmail({
    required AuthData authData,
  }) async {
    AuthData authResult = authData;
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: authData.email,
        password: authData.password,
      );
      if (userCredential.user != null) {
        authResult.isSuccess = true;
        authResult.user = userCredential.user;
      } else {
        authResult.isSuccess = false;
      }
      log('User Created : ${authResult.user}');
      return authResult;
    } on FirebaseAuthException catch (e) {
      log('Failure ==> [FirebaseAuthException] : ${e.code}');
      authResult.isSuccess = false;
      authResult.errorCode = e.code;
      authResult.errorMessage =
          firebaseAuthExceptionErrors[e.code] ?? 'Something went wrong';
      return authResult;
    }
  }

  ///* Link With Credential
  static Future<AuthData> linkWithCredential({
    required AuthData authData,
    required AuthCredential credential,
  }) async {
    AuthData authResult = authData;
    try {
      log('credential ${credential.accessToken}');
      final linkResult =
          await _auth.currentUser!.linkWithCredential(credential);
      if (linkResult.user != null) {
        authResult.isSuccess = true;
        authResult.user = linkResult.user;
      } else {
        authResult.isSuccess = false;
      }
      return authResult;
    } on FirebaseAuthException catch (e) {
      log('Failure linkWithCredential ==> [FirebaseAuthException] : ${e.code}');
      authResult.isSuccess = false;
      authResult.errorCode = e.code;
      authResult.errorMessage =
          firebaseAuthExceptionErrors[e.code] ?? 'Something went wrong';
      return authResult;
    } catch (e) {
      log('Failure linkWithCredential ==> [Exception] : ${e.toString()}');
      authResult.isSuccess = false;
      authResult.errorCode = e.toString();
      authResult.errorMessage = 'Something went wrong';
      return authResult;
    }
  }

  ///* Sign In With Credential
  static Future<AuthData> signInWithCredential(
      AuthCredential credential) async {
    AuthData authResult = AuthData();
    try {
      UserCredential? userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.user != null) {
        authResult.isSuccess = true;
        authResult.user = userCredential.user;
      } else {
        authResult.isSuccess = false;
      }
      return authResult;
    } on FirebaseAuthException catch (e) {
      log('Failure ==> [FirebaseAuthException] : ${e.toString()}');
      authResult.isSuccess = false;
      authResult.errorCode = e.toString();
      authResult.errorMessage =
          firebaseAuthExceptionErrors[e.toString()] ?? 'Something went wrong';
      return authResult;
    }
  }

  ///* User Login with Email
  static Future<AuthData> userLoginWithEmail({
    required AuthData authData,
  }) async {
    AuthData authResult = authData;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: authData.email,
        password: authData.password,
      );

      if (userCredential.user != null) {
        authResult.isSuccess = true;
        authResult.user = userCredential.user;
      } else {
        authResult.isSuccess = false;
      }
      return authResult;
    } on FirebaseAuthException catch (e) {
      log('Failure ==> [FirebaseAuthException] : ${e.code}');
      authResult.isSuccess = false;
      authResult.errorCode = e.code;
      authResult.errorMessage =
          firebaseAuthExceptionErrors[e.code] ?? 'Something went wrong';
      return authResult;
    }
  }

  ///* Login with Token
  static Future<AuthData> loginWithToken({
    required String token,
  }) async {
    AuthData authResult = AuthData();
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithCustomToken(token);
      authResult.isSuccess = userCredential.user != null;
      authResult.user = userCredential.user;
      return authResult;
    } on FirebaseAuthException catch (e) {
      log(e.code);
      log(e.message ?? 'No message');
      switch (e.code) {
        case "invalid-custom-token":
          log("The supplied token is not a Firebase custom auth token.");
          break;
        case "custom-token-mismatch":
          log("The supplied token is for a different Firebase project.");
          break;
        default:
          log("Unknown error.");
      }
      authResult.isSuccess = false;
      authResult.errorCode = e.code;
      authResult.errorMessage =
          firebaseAuthExceptionErrors[e.code] ?? 'Something went wrong';
      return authResult;
    }
  }

  ///* Send the `OTP` through `SMS`
  static Future<AuthData> sendOTP(AuthData authFields) async {
    return UnifonicController.sendOTP(authFields);
  }

  ///* Verify the `OTP` sent by `SMS`
  static Future<AuthData> verifyOTP(AuthData authFields) async {
    return UnifonicController.verifyOTP(authFields);
  }

  ///* Email SEND OTP
  static Future<EmailOtpResponse> sendEmailOTP(AuthData authFields) async {
    return EmailController.sendEmailOTP(authFields);
  }

  ///* Verify OTP sent by Email
  static Future<EmailOtpResponse> verifyEmailOTP(AuthData authFields) async {
    return EmailController.verifyOTP(authFields);
  }

  ///* User Forget Password
  static Future<AuthData> userForgetPassword({
    required AuthData authData,
  }) async {
    AuthData authResult = authData;
    try {
      await _auth.sendPasswordResetEmail(
        email: authData.email,
      );
      authResult.isSuccess = true;
      return authResult;
    } on FirebaseAuthException catch (e) {
      log('Failure ==> [FirebaseAuthException] : ${e.code}');
      authResult.isSuccess = false;
      authResult.errorCode = e.code;
      authResult.errorMessage =
          firebaseAuthExceptionErrors[e.code] ?? 'Something went wrong';
      return authResult;
    }
  }

  ///* Log-out from [firebase-auth]
  static Future logOut() async => await _auth.signOut();

  ///* Delete User
  static Future deleteUser() async {
    try {
      await _auth.currentUser!.delete();
      return true;
    } on FirebaseAuthException catch (e) {
      log('Failure ==> [FirebaseAuthException] : ${e.code}');
      return false;
    }
  }

  /// Create User With Phone Number Directly from [Admin_SDK]
  static Future<UserAuthCallsResponse?> createUser(
      {String? phoneNumber}) async {
    return ServerCalls.createUser(phoneNumber: phoneNumber);
  }

  /// Create [JWT] Token for [User]
  static Future<String> createToken({String? userId}) async {
    return ServerCalls.createToken(userId: userId);
  }

  /// Check If User Exist - from [Admin_SDK]
  static Future<CheckIfUserExistRes> checkIfUserExist({
    String? email,
    String? phoneNumber,
    String? userIdentifier,
  }) async {
    return ServerCalls.checkIfUserExist(
      email: email,
      phoneNumber: phoneNumber,
      userIdentifier: userIdentifier,
    );
  }

  /// Change Password - [Admin_SDK]
  static Future<UserAuthCallsResponse?> changePassword(
      {required String uId, required String newPassword}) async {
    return ServerCalls.changePassword(uId: uId, password: newPassword);
  }
}
