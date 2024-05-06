class CheckIfUserExistRes {
  bool isExist;
  String? uid;
  String? email;
  String? phoneNumber;
  String? token;

  CheckIfUserExistRes({
    this.isExist = false,
    this.uid,
    this.email,
    this.phoneNumber,
    this.token,
  });

  factory CheckIfUserExistRes.fromJson(Map<String, dynamic> json) {
    return CheckIfUserExistRes(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      token: json['token'] ?? '',
    );
  }

  @override
  String toString() =>
      "isExist: $isExist -> uid: $uid -> email: $email -> phoneNumber: $phoneNumber" " -> token: $token";
}
