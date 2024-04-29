import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallpapper/core/local/api/api.dart';
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
      return data.response?.data;
    } else {
      Fluttertoast.showToast(msg: data.response?.data["message"]);
    }
  }

  completeRegister({
    String name = '',
    String phoneNumber2 = '',
    String password = '',
  }) async {
    final response = await DioService().postData(
        url: "complete-register",
        loading: isLoading,
        body: {"name": name, "phone": phoneNumber2, "password": password});
    if (response.isError == false) {
      return response.response?.data;
    } else {
      Fluttertoast.showToast(msg: response.response?.data["message"]);
    }
  }

  GetUserDataModel? getUserDataModel;

  login({
    String phoneNumber = '',
    String password = '',
  }) async {
    final data = await dioService.postData(url: 'login', loading: false, body: {
      "phone": phoneNumber,
      "password": password,
    });
    if (data.isError == false) {
      return data.response?.data;
    } else {
      Fluttertoast.showToast(msg: data.response?.data["message"]);
    }
  }

  checkPinCode({ required String phoneNumber, required String otp}) async {
    final data = await dioService.postData(url: 'check-otp', loading: false, body: {
      "phone": phoneNumber,
      "otp": otp,
    });
    if (data.isError == false) {
      return data.response?.data;
    } else {
      return Fluttertoast.showToast(msg: data.response?.data["message"]);
    }
  }

  sendOtp({String phone = ''}) async {
    final response = await dioService.postData(
        url: "send-otp", loading: true, body: {"phone": phone});
    if (response.isError == false) {
      return response.response?.data;
    } else {
      Fluttertoast.showToast(msg: response.response?.data["message"]);
    }
  }
}
