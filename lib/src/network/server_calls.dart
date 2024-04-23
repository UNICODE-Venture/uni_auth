import 'dart:convert';
import 'dart:developer';
import 'package:uni_auth/src/extention/ui_extentions.dart';
import 'package:uni_auth/src/network/apis.dart';
import 'package:http/http.dart' as http;

class ServerCalls {
  ServerCalls._();

  /// Create User With Phone Number Directly from [Admin_SDK]
  static Future<String> createUser({String? phoneNumber}) async {
    try {
      Map<String, dynamic> credentialMap = {
        "phone": phoneNumber,
      };
      log('credentialMap : $credentialMap');
      final result = await http.post(Apis.createUser, body: jsonEncode(credentialMap));
      final resultBody = jsonDecode(result.body);
      log('resultBody: $resultBody');
      return result.statusCode.isSuccess ? resultBody['user']['uid'] : '';
    } catch (e) {
      log('Failure ==> : ${e.toString()}');
      return e.toString();
    }
  }

  /// Create [JWT] Token for [User]
  static Future<String> createToken({String? userId}) async {
    try {
      Map<String, dynamic> credentialMap = {"uid": userId};
      log('credentialMap : $credentialMap');
      final result = await http.post(Apis.createToken, body: jsonEncode(credentialMap));
      final resultBody = jsonDecode(result.body);
      log('resultBody: $resultBody');
      return result.statusCode.isSuccess ? resultBody['token'] : '';
    } catch (e) {
      log('Failure ==> : ${e.toString()}');
      return e.toString();
    }
  }
}
