import 'package:flutter/material.dart';

extension StringExtension on Locale {
  bool get isArabic => this == const Locale('ar');
  bool get isEnglish => this == const Locale('en');
}

extension IntExt on int {
  //* Is success
  bool get isSuccess => this == 200;
}
