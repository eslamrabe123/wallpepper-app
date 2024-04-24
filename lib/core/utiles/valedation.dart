import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';

class Validation {
  static RegExp emailReg = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static void validateInput(String? value, String exception) {
    if (value == null || value.isEmpty) {
      throw CustomException(exception);
    }
  }


  String? emailValidation(String? value, {bool isRequired = true}) {
    if (value!.trim().isEmpty) {
      if (isRequired) {
        return ('email_Validation'.tr());
      } else {
        return null;
      }
    } else if (!emailReg.hasMatch(value.trim())) {
      return ('wrong_Email_Validation'.tr());
    } else {
      return null;
    }
  }

  RegExp passwordReg = RegExp(
      r'^(?:(?=.*[a-z])(?:(?=.*[A-Z])(?=.*[\d\W])|(?=.*\W)(?=.*\d))|(?=.*\W)(?=.*[A-Z])(?=.*\d)).{8,}$');

  String? validatePassword(String? value) {
    if (value!.trim().isEmpty) {
      return 'password_Validation'.tr();
    } else {
      if (!passwordReg.hasMatch(value.trim())) {
        return "wrongPasswordValidation".tr();
      } else {
        return null;
      }
    }
  }

  static void validateFile(FilePickerResult? value, String exception) {
    if (value == null) {
      throw CustomException(exception);
    }
  }

  static void phoneValidation(String? value) {
    String p = r'^(009665|9665|[+]9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$';
    RegExp regExp = RegExp(p);
    if (value == null || value
        .trim()
        .isEmpty) {
      throw CustomException('phoneValidation'.tr());
    } else if (!regExp.hasMatch(value.trim())) {
      throw CustomException('wrongPhoneValidation'.tr());
    }
  }

  String? confirmPasswordValidation(value, String password) {
    if (value!.isEmpty) {
      return 'confirmPasswordValidation'.tr();
    } else if (password != value) {
      return ('wrongConfirmPasswordValidation'.tr());
    } else {
      return null;
    }
  }

  String? defaultValidation(value) {
    if (value!.isEmpty) {
      return ("requiredField".tr());
    } else {
      return null;
    }
  }

  String? taxNumberValidation(value, {bool isRequired = true}) {
    if (value!.isEmpty) {
      if (isRequired) {
        return ("requiredField".tr());
      } else {
        return null;
      }
    } else {
      if (value.length != 15) {
        return ("wrongTaxNumberValidation".tr());
      } else {
        return null;
      }
    }
  }
}

class CustomException implements Exception {
  String message;

  CustomException(this.message);

  @override
  String toString() {
    return message;
  }
}