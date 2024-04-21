import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni_auth/src/network/apis.dart';

class UniAuth {
  UniAuth._();

  /// Firebase Auth instance ---
  static FirebaseAuth? _auth;

  /// Locale instance ---
  static Locale? _locale;

  /// Initialize UniAuth with [auth] and [locale] and [baseUrl]
  static void init({
    required FirebaseAuth auth,
    Locale locale = const Locale('ar'),
    String? baseUrl,
  }) {
    _auth = auth;
    _locale = locale;
    Apis.baseUrl = baseUrl;
  }

  /// Get Firebase Auth instance
  static FirebaseAuth get auth {
    if (_auth == null) {
      throw 'UniAuth is not initialized';
    }
    return _auth!;
  }

  /// Get Locale instance
  static Locale get locale {
    if (_locale == null) {
      return const Locale('ar');
    }
    return _locale!;
  }
}
