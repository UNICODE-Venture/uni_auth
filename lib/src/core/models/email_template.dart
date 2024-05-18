// email template model contains the email required and otp initially empty and jsonEncode and jsonDecode methods

import 'dart:convert';

class EmailTemplate {
  String email;
  String otp;

  EmailTemplate({
    required this.email,
    this.otp = '',
  });

  ///* Verify OTP
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'otp': otp,
    };
  }

  String toJson() => json.encode(toMap());

  ///* Email SEND OTP

  Map<String, dynamic> toMapSendEmail() {
    return {
      'email': email,
    };
  }

  String toJsonSendEmail() => json.encode(toMapSendEmail());
}
