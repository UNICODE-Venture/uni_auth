import 'dart:convert';
import 'dart:developer';
import 'package:uni_auth/src/core/models/check_user_exist_res.dart';
import 'package:uni_auth/src/core/models/user_auth_calls_res.dart';
import 'package:uni_auth/src/extention/ui_extentions.dart';
import 'package:uni_auth/src/network/apis.dart';
import 'package:http/http.dart' as http;

class ServerCalls {
  ServerCalls._();

  /// Create User With Phone Number Directly from [Admin_SDK] [POST]
  static Future<UserAuthCallsResponse?> createUser({String? phoneNumber}) async {
    try {
      Map<String, dynamic> credentialMap = {
        "phone": phoneNumber,
      };
      log('credentialMap : $credentialMap');
      final result = await http.post(Uri.parse(Apis.authUser), body: jsonEncode(credentialMap));
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
  /// Create [JWT] Token for [UserModel] from [Admin_SDK] [PATCH]
  static Future<String> createToken({String? userId}) async {
    try {
      Map<String, dynamic> credentialMap = {"uid": userId};
      log('credentialMap : $credentialMap');
      final result = await http.patch(Uri.parse(Apis.authUser), body: jsonEncode(credentialMap));
      final resultBody = jsonDecode(result.body);
      log('resultBody: $resultBody');
      return result.statusCode.isSuccess ? resultBody['token'] : '';
    } catch (e) {
      log('Failure ==> : ${e.toString()}');
      return e.toString();
    }
  }

  //-----------------------------------------------------------------------------------
  /// Check If User Exist - [Admin_SDK] [GET]
  static Future<CheckIfUserExistRes> checkIfUserExist({
    String? uid,
    String? email,
    String? phoneNumber,
    String? userIdentifier,
  }) async {
    if (email == null && phoneNumber == null && userIdentifier == null) {
      return CheckIfUserExistRes();
    }
    try {
      Map<String, dynamic> credentialMap = {
        "email": email,
        "phoneNumber": phoneNumber,
        "userIdentifier": userIdentifier,
      };
      log('Check User Exist Inputs : $credentialMap');
      Map<String, String> params = {
        if (uid != null) 'uid': uid,
        if (email != null) 'email': email,
        if (phoneNumber != null) 'phoneNumber': phoneNumber,
        if (userIdentifier != null) 'userIdentifier': userIdentifier,
      };
      Uri uri = Uri.parse(Apis.authUser).replace(queryParameters: params);
      final result = await http.get(uri);
      final resultBody = jsonDecode(result.body);
      log('Check User Exist : $resultBody');
      CheckIfUserExistRes res = CheckIfUserExistRes.fromJson(resultBody);
      res.isExist = res.user?.uid?.isNotEmpty ?? false;
      return res;
    } catch (e) {
      log('Failure ==> [Check User Exist] : ${e.toString()}');
      return CheckIfUserExistRes();
    }
  }

  //-----------------------------------------------------------------------------------
  /// Update Auth User - [Admin_SDK] [PUT]
  static Future<UserAuthCallsResponse?> updateAuthUser({
    required String uId,
    String? phoneNumber,
    String? email,
    String? password,
  }) async {
    if (uId.isNotEmpty && (phoneNumber != null || email != null || password != null)) {
      try {
        Map<String, dynamic> credentialMap = {
          "uid": uId,
          if (phoneNumber != null) "phone": phoneNumber,
          if (email != null) "email": email,
          if (password != null) "password": password,
        };
        log('Update Auth User Inputs : $credentialMap');
        final result = await http.put(Uri.parse(Apis.authUser), body: jsonEncode(credentialMap));
        final resultBody = jsonDecode(result.body);
        log('Update Auth User Result : $resultBody');
        UserAuthCallsResponse res = UserAuthCallsResponse.fromJson(resultBody);
        res.isSuccess = res.user?.uid?.isNotEmpty ?? false;
        return result.statusCode.isSuccess ? res : null;
      } catch (e) {
        log('Failure ==> [Update Auth User] : ${e.toString()}');
        return UserAuthCallsResponse(isSuccess: false, errorMsg: e.toString());
      }
    } else {
      return UserAuthCallsResponse(isSuccess: false, errorMsg: 'Invalid Inputs');
    }
  }
  //-----------------------------------------------------------------------------------
}
