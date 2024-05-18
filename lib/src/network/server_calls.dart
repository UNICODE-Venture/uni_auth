import 'dart:convert';
import 'dart:developer';
import 'package:uni_auth/src/core/models/check_user_exist_res.dart';
import 'package:uni_auth/src/core/models/user_auth_calls_res.dart';
import 'package:uni_auth/src/extention/ui_extentions.dart';
import 'package:uni_auth/src/network/apis.dart';
import 'package:http/http.dart' as http;

class ServerCalls {
  ServerCalls._();

  /// Create User With Phone Number Directly from [Admin_SDK]
  static Future<UserAuthCallsResponse?> createUser(
      {String? phoneNumber}) async {
    try {
      Map<String, dynamic> credentialMap = {
        "phone": phoneNumber,
      };
      log('credentialMap : $credentialMap');
      final result =
          await http.post(Apis.createUser, body: jsonEncode(credentialMap));
      final resultBody = jsonDecode(result.body);
      log('resultBody: $resultBody');
      UserAuthCallsResponse res = UserAuthCallsResponse.fromJson(resultBody);
      res.isSuccess = res.user?.uid?.isNotEmpty ?? false;
      return result.statusCode.isSuccess ? res : null;
    } catch (e) {
      log('Failure ==> : ${e.toString()}');
      return UserAuthCallsResponse(isSuccess: false, errorMsg: e.toString());
    }
  }

  //-----------------------------------------------------------------------------------
  /// Create [JWT] Token for [UserModel] from [Admin_SDK]
  static Future<String> createToken({String? userId}) async {
    try {
      Map<String, dynamic> credentialMap = {"uid": userId};
      log('credentialMap : $credentialMap');
      final result =
          await http.post(Apis.createToken, body: jsonEncode(credentialMap));
      final resultBody = jsonDecode(result.body);
      log('resultBody: $resultBody');
      return result.statusCode.isSuccess ? resultBody['token'] : '';
    } catch (e) {
      log('Failure ==> : ${e.toString()}');
      return e.toString();
    }
  }

  //-----------------------------------------------------------------------------------
  ///* Check If User Exist - [Admin_SDK]
  static Future<CheckIfUserExistRes> checkIfUserExist({
    String? email,
    String? phoneNumber,
    String? userIdentifier,
  }) async {
    try {
      Map<String, dynamic> credentialMap = {
        "email": email,
        "phoneNumber": phoneNumber,
        "userIdentifier": userIdentifier,
      };
      log('Check User Exist Inputs : $credentialMap');
      final result =
          await http.post(Apis.checkUserExist, body: jsonEncode(credentialMap));
      final resultBody = jsonDecode(result.body);
      log('Check User Exist : $resultBody');
      CheckIfUserExistRes res = CheckIfUserExistRes.fromJson(resultBody);
      res.isExist = res.uid?.isNotEmpty ?? false;
      return res;
    } catch (e) {
      log('Failure ==> [Check User Exist] : ${e.toString()}');
      return CheckIfUserExistRes();
    }
  }

  //-----------------------------------------------------------------------------------
  ///* Change Password - [Admin_SDK]
  static Future<UserAuthCallsResponse?> changePassword({
    required String uId,
    required String password,
  }) async {
    try {
      Map<String, dynamic> credentialMap = {
        "uid": uId,
        "password": password,
      };
      log('Change Password Inputs : $credentialMap');
      final result =
          await http.post(Apis.changePassword, body: jsonEncode(credentialMap));
      final resultBody = jsonDecode(result.body);
      log('Change Password Result : $resultBody');
      UserAuthCallsResponse res = UserAuthCallsResponse.fromJson(resultBody);
      res.isSuccess = res.user?.uid?.isNotEmpty ?? false;
      return result.statusCode.isSuccess ? res : null;
    } catch (e) {
      log('Failure ==> [Change Password] : ${e.toString()}');
      return UserAuthCallsResponse(isSuccess: false, errorMsg: e.toString());
    }
  }
  //-----------------------------------------------------------------------------------
}
