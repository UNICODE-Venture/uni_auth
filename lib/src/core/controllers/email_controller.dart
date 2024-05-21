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
  static Future<EmailOtpResponse> sendEmailOTP(AuthData authFields) async {
    EmailOtpResponse response = EmailOtpResponse();
    try {
      EmailTemplate emailTemplate = EmailTemplate(email: authFields.email);
      debugPrint('credentialMap : ${emailTemplate.toMapSendEmail()}');
      final result = await http.post(Apis.sendEmailOTP,
          body: emailTemplate.toJsonSendEmail());
      final resultBody = jsonDecode(result.body);
      debugPrint('resultBody: $resultBody');
      response = EmailOtpResponse.fromJson(resultBody);
      response.isSuccess = result.statusCode.isSuccess;
      return response;
    } catch (e) {
      debugPrint('Failure ==> : ${e.toString()}');
      response.error = e.toString();
      response.message = e.toString();
      return response;
    }
  }

  ///* Verify OTP
  static Future<EmailOtpResponse> verifyOTP(AuthData authFields) async {
    EmailOtpResponse response = EmailOtpResponse();
    try {
      EmailTemplate emailTemplate =
          EmailTemplate(email: authFields.email, otp: authFields.otp);
      debugPrint('credentialMap : ${emailTemplate.toMap()}');
      final result =
          await http.post(Apis.verifyOTP, body: emailTemplate.toJson());
      final resultBody = jsonDecode(result.body);
      debugPrint('resultBody: $resultBody');
      response = EmailOtpResponse.fromJson(resultBody);
      response.isSuccess = result.statusCode.isSuccess;

      return response;
    } catch (e) {
      debugPrint('Failure ==> : ${e.toString()}');
      response.error = e.toString();
      response.message = e.toString();
      return response;
    }
  }
}
