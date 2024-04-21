enum LoginMethod {
  email,
  phone;

  bool get isEmail => this == LoginMethod.email;

  bool get isPhone => this == LoginMethod.phone;
}