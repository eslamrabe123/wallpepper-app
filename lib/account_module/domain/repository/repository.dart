import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallpapper/core/local/api/api.dart';

import '../../../core/themes/color_themes.dart';
import '../model/privacy_and_policyView_model.dart';

class AccountRepository {
  DioService dioService;

  AccountRepository(this.dioService);

  PrivacyAndPolicyModel? policyModel;

  privacyAndPolicy() async {
    final response =
        await dioService.getData(url: "privacy-policy", loading: true);
    if (response.isError == false) {
      policyModel = PrivacyAndPolicyModel.fromJson(response.response?.data);
      return policyModel;
    } else {
      Fluttertoast.showToast(
        msg: response.response?.data["message"],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.primiry,
        textColor: Colors.white,
        fontSize: 12.0,
      );
    }
  }
}
