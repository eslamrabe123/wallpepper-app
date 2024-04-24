import 'package:wallpapper/core/local/api/api.dart';
import '../../../core/helper/alerts.dart';
import '../../../core/utiles/shared.dart';
import '../../../core/utiles/utils.dart';
import '../models/user_data_model.dart';

class AuthRepository {
  DioService dioService;

  AuthRepository(this.dioService);

  bool isLoading = true;

  String phoneNumber = "";

  register({phoneNumber}) async {
    final data = await dioService.postData(
      url: 'register',
      loading: true,
      isForm: true,
      body: {"phone": phoneNumber},
    );
    if (data.isError == false) {
      print("phone number from register method is : $phoneNumber");
      return data.response?.data;
    } else {
      // Fluttertoast.showToast(msg: data.response?.data["message"]);
      Alerts.snack(text: data.response?.data["error"], state: SnackState.failed);

    }
  }

  String name = '';
  String phoneNumber2 = '';
  String password = '';

  completeRegister({name, phoneNumber2, password}) async {
    final response = await DioService().postData(
        url: "complete-register",
        loading: isLoading,
        body: {"name": name, "phone": phoneNumber2, "password": password});
    if (response.isError == false) {
      print(
          "the phone number from complete register method is  : $phoneNumber2");
      return response;
    } else {
      // Fluttertoast.showToast(msg: response.response?.data["message"]);
      Alerts.snack(text: response.response?.data["error"], state: SnackState.failed);

    }
  }

  GetUserDataModel? getUserDataModel;

  login({String phoneNumber = '', String password = ''}) async {
    final data = await dioService.postData(url: 'login', loading: false, body: {
      "phone": phoneNumber,
      "password": password,
    });
    if (data.isError == false) {
      // getUserDataModel = GetUserDataModel.fromJson(data.response?.data['data']);
      CacheHelper.saveData(
          key: "token", value: data?.response?.data['access_token']);
      Utils.token = CacheHelper.loadData(key: "token");
      return data.response?.data;
    } else {
      // Fluttertoast.showToast(msg: data.response?.data["message"]);
       Alerts.snack(text: data.response?.data["error"], state: SnackState.failed);
    }
  }

  int? otp;

  pinCode({phoneNumber, otp}) async {
    final data = await dioService.postData(
        url: 'check-otp?phone=$phoneNumber&otp=$otp',
        loading: isLoading,
        isForm: true,
        body: {
          "phone": phoneNumber,
          "otp": otp,
        });
    if (data.isError == false) {
      return data.response?.data;
    } else {
      // Fluttertoast.showToast(msg: data.response?.data["message"]);
    }
  }

  sendOtp({String phone = ''}) async {
    final response = await dioService.postData(
        url: "send-otp", loading: true, isForm: true, body: {"phone": phone});
    if (response.isError == false) {
      return response.response?.data;
    } else {
      // Fluttertoast.showToast(msg: response.response?.data["message"]);
    }
  }
}
