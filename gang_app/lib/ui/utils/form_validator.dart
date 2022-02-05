import 'package:gang_app/lang/string_keys.dart';
import 'package:get/get.dart';

class FormValidator {
  String? isValidEmail(String? text) {
    return (text ?? "").isEmail ? null : SK.not_valid_email;
  }

  String? isValidName(String? text) {
    if (text == null || text.isEmpty) {
      return SK.name_cannto_be_empyt;
    }
    return null;
  }

  String? isValidPass(String? text) {
    if (text == null || text.length < 6) {
      return SK.pass_too_short;
    }
    return null;
  }

  String? isValidDescription(String? text) {
    if (text == null || text.isEmpty) {
      return SK.description_cannto_be_empyt;
    } else if (text.length < 15) {
      return SK.description_too_short;
    }
    return null;
  }

  String? isValidPrice(String? text) {
    return (text ?? "").isNum ? null : SK.not_valid_price;
  }
}