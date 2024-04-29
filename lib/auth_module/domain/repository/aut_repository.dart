import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallpapper/core/local/api/api.dart';
import '../../../core/themes/color_themes.dart';
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
      return data.response?.data;
    } else {
      Fluttertoast.showToast(
        msg: data.response?.data["message"],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.primiry,
        textColor: Colors.white,
        fontSize: 12.0,
      );
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
      CacheHelper.saveData(
          key: "token", value: data.response?.data['access_token']);
      Utils.token = CacheHelper.loadData(key: "token");

      CacheHelper.saveData(
          key: 'name', value: data.response?.data["data"]["name"]);
      Utils.name = CacheHelper.loadData(key: 'name');
      CacheHelper.saveData(
          key: 'phone', value: data.response?.data["data"]["phone"]);
      Utils.phone = CacheHelper.loadData(key: 'phone');
      return data.response?.data;
    } else {
      Fluttertoast.showToast(
        msg: data.response?.data["message"],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.primiry,
        textColor: Colors.white,
        fontSize: 12.0,
      );
    }
  }

  checkPinCode({required String phoneNumber, required String otp}) async {
    final data =
        await dioService.postData(url: 'check-otp', loading: false, body: {
      "phone": phoneNumber,
      "otp": otp,
    });
    if (data.isError == false) {
      return data.response?.data;
    } else {
      Fluttertoast.showToast(
        msg: data.response?.data["message"],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.primiry,
        textColor: Colors.white,
        fontSize: 12.0,
      );
    }
  }

  sendOtp({String phone = ''}) async {
    final response = await dioService
        .postData(url: "send-otp", loading: true, body: {"phone": phone});
    if (response.isError == false) {
      return response.response?.data;
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
