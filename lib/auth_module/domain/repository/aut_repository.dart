import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallpapper/core/local/api/api.dart';
import 'package:wallpapper/core/themes/app_colors/app_colors_light.dart';
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
      loading: isLoading,
      isForm: true,
      body: {"phone": phoneNumber},
    );
    if (data.isError == false) {
      Fluttertoast.showToast(
        msg: data.response?.data["data"].toString() ?? "",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColorLight.textColorGereen,
        textColor: Colors.white,
        fontSize: 12.0,
      );
      return data.response?.data;
    } else {
      Fluttertoast.showToast(
        msg: data.response?.data["message"] ?? data.response?.data["error"],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColorLight.primaryColor,
        textColor: Colors.white,
        fontSize: 12.0,
      );
    }
  }

  updatePassword(
      {required String password, required String newPassword}) async {
    final data = await dioService.postData(
      url: 'update-password',
      loading: isLoading,
      isForm: true,
      body: {
        "password": password,
        "new_password": newPassword,
      },
    );
    if (data.isError == false) {
      Fluttertoast.showToast(
        msg: data.response?.data["data"].toString() ?? "",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColorLight.textColorGereen,
        textColor: Colors.white,
        fontSize: 12.0,
      );
      return data.response?.data;
    } else {
      Fluttertoast.showToast(
        msg: data.response?.data["error"],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColorLight.primaryColor,
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
        msg: response.response?.data["message"] ??
            response.response?.data["error"],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColorLight.primaryColor,
        textColor: Colors.white,
        fontSize: 12.0,
      );
    }
  }

  GetUserDataModel? getUserDataModel;

  login({
    required String phoneNumber,
    required String password,
  }) async {
    final data =
        await dioService.postData(url: 'login', loading: isLoading, body: {
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
      Fluttertoast.showToast(
        msg: data.response?.data["message"] ?? data.response?.data["error"],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColorLight.primaryColor,
        textColor: Colors.white,
        fontSize: 12.0,
      );
      return data.response?.data;
    } else {
      Fluttertoast.showToast(
        msg: data.response?.data['error'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColorLight.primaryColor,
        textColor: Colors.white,
        fontSize: 12.0,
      );
    }
  }

  checkPinCode({required String phoneNumber, required String otp}) async {
    final data =
        await dioService.postData(url: 'check-otp', loading: isLoading, body: {
      "phone": phoneNumber,
      "otp": otp,
    });
    if (data.isError == false) {
      return data.response?.data;
    } else {
      Fluttertoast.showToast(
        msg: data.response?.data["error"] ?? data.response?.data["message"],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColorLight.primaryColor,
        textColor: Colors.white,
        fontSize: 12.0,
      );
    }
  }

  sendOtp({String phone = ''}) async {
    final response = await dioService
        .postData(url: "send-otp", loading: isLoading, body: {"phone": phone});
    if (response.isError == false) {
      Fluttertoast.showToast(
        msg: response.response?.data["data"].toString() ?? '',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColorLight.primaryColor,
        textColor: Colors.white,
        fontSize: 12.0,
      );
      return response.response?.data;
    } else {
      Fluttertoast.showToast(
        msg: response.response?.data["message"] ??
            response.response?.data["error"],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColorLight.primaryColor,
        textColor: Colors.white,
        fontSize: 12.0,
      );
    }
  }

  forgotPassword({required String phone, required String password}) async {
    final response = await dioService
        .postData(url: 'forget-password', loading: isLoading, body: {
      "phone": phone,
      "password": password,
    });
    if (response.isError == false) {
      return response.response?.data;
    } else {
      Fluttertoast.showToast(
        msg: response.response?.data["message"],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColorLight.primaryColor,
        textColor: Colors.white,
        fontSize: 12.0,
      );
    }
  }
}
