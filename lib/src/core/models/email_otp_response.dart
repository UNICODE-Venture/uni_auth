class EmailOtpResponse {
  bool isSuccess;
  String message;
  final String? token;
  String? error;

  EmailOtpResponse(
      {this.isSuccess = false, this.message = '', this.token, this.error});

  factory EmailOtpResponse.fromJson(Map<String, dynamic> json) {
    return EmailOtpResponse(
      message: json['message'],
      token: json['token'],
      error: json['error'],
    );
  }
}
