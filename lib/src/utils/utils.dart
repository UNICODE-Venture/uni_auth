import 'package:uni_auth/src/extention/ui_extentions.dart';
import 'package:uni_auth/uni_auth.dart';

class Utils {
  Utils._();

  static String getMessage({required String en, required String ar}) {
    return UniAuth.locale.isArabic ? ar : en;
  }
}

