import 'package:flutter/material.dart';
import 'package:uni_auth/uni_auth.dart';

class CheckSignInState extends StatelessWidget {
  final Widget holder;
  final Function() onLoggedIn;
  final Function() onNotLoggedIn;
  const CheckSignInState({
    super.key,
    required this.holder,
    required this.onLoggedIn,
    required this.onNotLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        if (UniAuthService.checkUserLoggedIn) {
          onLoggedIn();
        } else {
          onNotLoggedIn();
        }
        return holder;
      },
    );
  }
}
