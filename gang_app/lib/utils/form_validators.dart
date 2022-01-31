import 'package:gang_app/lang/string_keys.dart';
import 'package:get/get.dart';

class FormValidator {
  String? isValidEmail(String? text) {
    return (text ?? '').isEmail ? null : SK.not_valid_email.tr;
  }

  String? isValidName(String? text) {
    if (text == null || text.isEmpty) {
      return SK.name_cannot_be_empty.tr;
    }
    return null;
  }

  String? isValidPassword(String? text) {
    if (text == null || text.length < 6) {
      return SK.password_too_short;
    }
  }

  String? isCorrectPassword(String? password, String? confirmPassword) {
    if (password != confirmPassword) {
      return SK.password_does_not_match;
    }
  }
}
