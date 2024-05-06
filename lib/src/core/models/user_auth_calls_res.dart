class UserAuthCallsResponse {
  UserModel? user;
  String? token;
  bool? isSuccess;
  String? errorMsg;

  UserAuthCallsResponse({
    this.user,
    this.token,
    this.isSuccess,
    this.errorMsg,
  });

  UserAuthCallsResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    token = json['token'] ?? '';
  }

  @override
  String toString() => "user: $user -> token: $token";
}

//* User Model ----------------------------------------
class UserModel {
  String? uid;
  String? phoneNumber;
  List<ProviderData?>? providerData;
  String? email;

  UserModel({
    this.uid,
    this.phoneNumber,
    this.providerData,
    this.email,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'] ?? '';
    phoneNumber = json['phoneNumber'] ?? '';
    providerData = json['providerData'] != null
        ? (json['providerData'] as List).map((e) => ProviderData.fromJson(e)).toList()
        : [];
    email = json['email'] ?? '';
  }

  @override
  String toString() => "uid: $uid -> phoneNumber: $phoneNumber -> providerData: $providerData -> email: $email";
}

//* Provider Data Model ----------------------------------------
class ProviderData {
  String? uid;
  String? providerId;
  String? phoneNumber;

  ProviderData({
    this.uid,
    this.providerId,
    this.phoneNumber,
  });

  ProviderData.fromJson(Map<String, dynamic> json) {
    uid = json['uid'] ?? '';
    providerId = json['providerId'] ?? '';
    phoneNumber = json['phoneNumber'] ?? '';
  }

  @override
  String toString() => "uid: $uid -> providerId: $providerId -> phoneNumber: $phoneNumber";
}
