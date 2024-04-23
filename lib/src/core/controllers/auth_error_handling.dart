import '../../utils/utils.dart';

Map firebaseAuthExceptionErrors = {
  'argument-error': '',
  'captcha-check-failed': Utils.getMessage(
      en: 'The reCAPTCHA response token provided is either invalid, expired, already used or the domain associated with it does not match the list of whitelisted domains.',
      ar: 'رمز استجابة reCAPTCHA المقدم إما غير صالح أو منتهي الصلاحية أو مستخدم بالفعل أو أن النطاق المرتبط به لا يتطابق مع قائمة نطاقات القائمة البيضاء.'),
  'code-expired': Utils.getMessage(
      en: 'The SMS code has expired. Please re-send the verification code to try again.',
      ar: 'انتهت صلاحية رمز الرسالة النصية، الرجاء الضغط على إعادة إرسال الرمز والمحاولة مرة أخرى.'),
  'credential-already-in-use': Utils.getMessage(
      en: 'This credential is already associated with a different user account.',
      ar: 'هذة البيانات مرتبطة بالفعل بحساب مستخدم مختلف.'),
  'requires-recent-login': Utils.getMessage(
      en: 'This operation is sensitive and requires recent authentication. Log in again before retrying this request.',
      ar: 'هذه العملية حساسة وتتطلب مصادقة حديثة.  قم بتسجيل الدخول مرة أخرى قبل إعادة محاولة هذا الطلب.'),
  'dynamic-link-not-activated': Utils.getMessage(
      en: 'Please activate Dynamic Links in the Firebase Console and agree to the terms and conditions.',
      ar: 'يُرجى تنشيط الروابط الديناميكية في Firebase Console والموافقة على الشروط والأحكام.'),
  'email-change-needs-verification': Utils.getMessage(
      en: 'Multi-factor users must always have a verified email.',
      ar: 'يجب أن يكون لدى المستخدمين متعددي المهام بريد إلكتروني تم التحقق منه دائمًا.'),
  'email-already-in-use': Utils.getMessage(
      en: 'The email address is already in use by another account.',
      ar: 'عنوان البريد الإلكتروني قيد الاستخدام بالفعل من قبل حساب آخر.'),
  'expired-action-code': Utils.getMessage(
      en: 'The action code has expired. ', ar: 'انتهت صلاحية رمز العمل. '),
  'internal-error': Utils.getMessage(
      en: 'An internal error has occurred.', ar: 'حدث خطأ داخلي.'),
  'invalid-auth-event': Utils.getMessage(
      en: 'An internal error has occurred.', ar: 'حدث خطأ داخلي'),
  'invalid-verification-code': Utils.getMessage(
      en: 'The SMS verification code used to create the phone auth credential is invalid. Please resend the verification code sms and be sure use the verification code provided by the user.',
      ar: 'رمز التحقق عبر الرسائل القصيرة المستخدم لإنشاء بيانات اعتماد مصادقة الهاتف غير صالح.  يرجى إعادة إرسال رمز التحقق عبر الرسائل القصيرة وتأكد من استخدام رمز التحقق الذي قدمه المستخدم.'),
  'invalid-dynamic-link-domain': Utils.getMessage(
      en: 'The provided dynamic link domain is not configured or authorized for the current project.',
      ar: 'لم يتم تكوين نطاق الارتباط الديناميكي المقدم أو ترخيصه للمشروع الحالي.'),
  'invalid-email': Utils.getMessage(
      en: 'The email address is badly formatted.',
      ar: 'عنوان البريد الإلكتروني منسق بشكل سيء.'),
  'invalid-credential': Utils.getMessage(
    en: 'The supplied auth credential is malformed or has expired.',
    ar: 'بيانات اعتماد المصادقة المقدمة غير صحيحة أو منتهية الصلاحية.',
  ),
  'invalid-action-code': Utils.getMessage(
      en: 'The action code is invalid. This can happen if the code is malformed, expired, or has already been used.',
      ar: 'رمز العمل غير صالح.  يمكن أن يحدث هذا إذا كان الرمز غير صحيح أو منتهي الصلاحية أو تم استخدامه بالفعل.'),
  'wrong-password': Utils.getMessage(
      en: 'The password is invalid or the user does not have a password.',
      ar: 'كلمة المرور غير صالحة أو ليس لدى المستخدم كلمة مرور.'),
  'invalid-phone-number': Utils.getMessage(
      en: 'The format of the phone number provided is incorrect. Please enter the phone number in a format that can be parsed into E.164 format. E.164 phone numbers are written in the format [+][country code][subscriber number including area code].',
      ar: 'تنسيق رقم الهاتف المقدم غير صحيح.  الرجاء إدخال رقم الهاتف بتنسيق يمكن تحليله بتنسيق E.164.  تتم كتابة أرقام هواتف E.164 بالتنسيق [+] [رمز الدولة] [رقم المشترك بما في ذلك رمز المنطقة].'),
  'invalid-recipient-email': Utils.getMessage(
      en: 'The email corresponding to this action failed to send as the provided recipient email address is invalid.',
      ar: 'فشل إرسال البريد الإلكتروني المقابل لهذا الإجراء لأن عنوان البريد الإلكتروني للمستلم المقدم غير صالح.'),
  'invalid-sender': Utils.getMessage(
      en: 'The email template corresponding to this action contains an invalid sender email or name. Please fix by going to the Auth email templates section in the Firebase Console.',
      ar: 'يحتوي قالب البريد الإلكتروني المطابق لهذا الإجراء على بريد إلكتروني أو اسم مرسل غير صالح.  يرجى الإصلاح بالانتقال إلى قسم قوالب البريد الإلكتروني للمصادقة في Firebase Console.'),
  'invalid-verification-id': Utils.getMessage(
      en: 'The verification ID used to create the phone auth credential is invalid.',
      ar: 'معرف التحقق المستخدم لإنشاء بيانات اعتماد مصادقة الهاتف غير صالح.'),
  'missing-verification-code': Utils.getMessage(
      en: 'The phone auth credential was created with an empty SMS verification code.',
      ar: 'تم إنشاء بيانات اعتماد الهاتف باستخدام رمز تحقق فارغ عبر رسالة نصية.'),
  'missing-or-invalid-nonce': Utils.getMessage(
      en: 'The request does not contain a valid nonce. This can occur if the SHA-256 hash of the provided raw nonce does not match the hashed nonce in the ID token payload.',
      ar: 'لا يحتوي الطلب على رمز nonce صالح. يمكن أن يحدث هذا إذا كانت تجزئة SHA-256 الخاصة بـ nonce الخام المقدم لا تتطابق مع nonce المجزأ في حمولة الرمز المميز للمعرف.'),
  'missing-phone-number': Utils.getMessage(
      en: 'To send verification codes, provide a phone number for the recipient.',
      ar: 'لإرسال رمز التحقق، الرجاء ذكر رقم الجوال للمستلم'),
  'missing-verification-id': Utils.getMessage(
      en: 'The phone auth credential was created with an empty verification ID.',
      ar: 'تم إنشاء بيانات اعتماد الهاتف بمعرف تحقق فارغ.'),
  'network-request-failed': Utils.getMessage(
      en: 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.',
      ar: 'حدث خطأ في الشبكة (مثل انتهاء المهلة أو انقطاع الاتصال أو مضيف لا يمكن الوصول إليه).'),
  'no-auth-event': Utils.getMessage(
      en: 'An internal error has occurred.', ar: 'حدث خطأ داخلي.'),
  'quota-exceeded': Utils.getMessage(
      en: "The project's quota for this operation has been exceeded.",
      ar: 'تم تجاوز حصة المشروع لهذه العملية.'),
  'user-token-expired': Utils.getMessage(
      en: "The user's credential is no longer valid. The user must sign in again.",
      ar: 'لم تعد بيانات اعتماد المستخدم صالحة.  الرجاء تسجيل الدخول مرة أخرى.'),
  'too-many-requests': Utils.getMessage(
    en: 'We have blocked all requests from this device due to unusual activity. Try again later.',
    ar: 'تم حظر جميع الطلبات الواردة من هذا الجهاز بسبب نشاط غير عادي. حاول مرة أخرى في وقت لاحق.',
  ),
  'user-not-found': Utils.getMessage(
      en: 'There is no user record corresponding to this identifier. The user may have been deleted.',
      // ar: 'لا يوجد سجل مستخدم مطابق لهذا المعرف. ربما تم حذف المستخدم.'
      ar: '(لايوجد اسم مستخدم مطابق للمدخلات حاول مرة أخرى)'),
  'user-disabled': Utils.getMessage(
    en: 'The user account has been disabled by an administrator.',
    ar: 'تم تعطيل حساب المستخدم من قبل المسؤول.',
  ),
  'weak-password': Utils.getMessage(
      en: 'The password must be 6 characters long or more.',
      ar: 'كلمة المرور يجب أن لا تقل عن ٦حروف'),
  'INVALID_LOGIN_CREDENTIALS': Utils.getMessage(
    en: 'Invalid login credentials',
    // ar: 'بيانات الدخول غير صحيحة',
    ar: '(لايوجد اسم مستخدم مطابق للمدخلات حاول مرة أخرى)',
  ),
  'provider-already-linked': Utils.getMessage(
    en: 'This credential is already associated with a different user account.',
    ar: 'هذة البيانات مرتبطة بالفعل بحساب مستخدم مختلف.',
  ),
};
