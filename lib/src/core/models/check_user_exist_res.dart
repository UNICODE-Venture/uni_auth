class CheckIfUserExistRes {
  bool isExist;
  AuthUser? user;

  CheckIfUserExistRes({
    this.isExist = false,
    this.user,
  });

  factory CheckIfUserExistRes.fromJson(Map<String, dynamic> json) {
    return CheckIfUserExistRes(
      isExist: json['isExist'] ?? false,
      user: AuthUser.fromJson(json['user']),
    );
  }
  @override
  String toString() =>
      "isExist: $isExist -> uid: ${user?.uid} -> email: ${user?.email} -> phoneNumber: ${user?.phoneNumber}"
      " -> token: ${user?.token}";
}

class AuthUser {
  String? uid;
  String? email;
  String? phoneNumber;
  String? userAuthType;
  String? token;

  AuthUser({
    this.uid,
    this.email,
    this.phoneNumber,
    this.userAuthType,
    this.token,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      userAuthType: json['userAuthType'] ?? '',
      token: json['token'] ?? '',
    );
  }
}
