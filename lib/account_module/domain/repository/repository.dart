import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallpapper/core/local/api/api.dart';

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
      Fluttertoast.showToast(msg: response.response?.data["message"]);
    }
  }
}
