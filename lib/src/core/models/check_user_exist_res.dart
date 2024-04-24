class CheckIfUserExistRes {
  bool isExist;
  String? uid;
  String? email;
  String? phoneNumber;

  CheckIfUserExistRes({
    this.isExist = false,
    this.uid,
    this.email,
    this.phoneNumber,
  });

  factory CheckIfUserExistRes.fromJson(Map<String, dynamic> json) {
    return CheckIfUserExistRes(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
    );
  }

  @override
  String toString() => "isExist: $isExist -> uid: $uid -> email: $email -> phoneNumber: $phoneNumber";
}
