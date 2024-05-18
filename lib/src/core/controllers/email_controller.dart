import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:uni_auth/src/core/models/email_template.dart';
import 'package:uni_auth/src/extention/ui_extentions.dart';
import 'package:uni_auth/src/network/apis.dart';
import 'package:uni_auth/uni_auth.dart';
import 'package:http/http.dart' as http;

class EmailController {
  EmailController._();

  ///* Email SEND OTP
  static Future<AuthData> sendEmailOTP(AuthData authFields) async {
    try {
      EmailTemplate emailTemplate = EmailTemplate(email: authFields.email);
      debugPrint('credentialMap : ${emailTemplate.toMapSendEmail()}');
      final result = await http.post(Apis.sendEmailOTP,
          body: emailTemplate.toJsonSendEmail());
      final resultBody = jsonDecode(result.body);
      debugPrint('resultBody: $resultBody');
      authFields.isSuccess = result.statusCode.isSuccess;
      if (!result.statusCode.isSuccess) {
        authFields.errorMessage = resultBody['message'];
      }
      return authFields;
    } catch (e) {
      debugPrint('Failure ==> : ${e.toString()}');
      authFields.isSuccess = false;
      authFields.errorMessage = e.toString();
      return authFields;
    }
  }

  ///* Verify OTP
  static Future<AuthData> verifyOTP(AuthData authFields) async {
    try {
      EmailTemplate emailTemplate =
          EmailTemplate(email: authFields.email, otp: authFields.otp);
      debugPrint('credentialMap : ${emailTemplate.toMap()}');
      final result =
          await http.post(Apis.verifyOTP, body: emailTemplate.toJson());
      final resultBody = jsonDecode(result.body);
      debugPrint('resultBody: $resultBody');
      authFields.isSuccess = result.statusCode.isSuccess;
      if (!result.statusCode.isSuccess) {
        authFields.errorMessage = resultBody['message'];
      }
      return authFields;
    } catch (e) {
      debugPrint('Failure ==> : ${e.toString()}');
      authFields.isSuccess = false;
      authFields.errorMessage = e.toString();
      return authFields;
    }
  }
}
