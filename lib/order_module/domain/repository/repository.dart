import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallpapper/core/local/api/api.dart';
import 'package:wallpapper/order_module/domain/model/completed_orders_model.dart';
import '../../../core/themes/app_colors/app_colors_light.dart';
import '../../../core/themes/color_themes.dart';
import '../model/order_config_model.dart';
import '../model/pendingOrders-model.dart';

class OrderRepository {
  DioService dioService;

  OrderRepository(this.dioService);

  PendingOrdersModel? pendingOrdersModel;

  pendingOrders() async {
    final response =
        await dioService.getData(url: "pending-order", loading: false);
    if (response.isError == false) {
      pendingOrdersModel = PendingOrdersModel.fromJson(response.response?.data);
      return pendingOrdersModel;
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

  CompletedOrdersModel? completedOrdersModel;

  completedOrders() async {
    final response =
        await dioService.getData(url: "completed-order", loading: false);
    if (response.isError == false) {
      completedOrdersModel =
          CompletedOrdersModel.fromJson(response.response?.data);
      return completedOrdersModel;
    } else {
      Fluttertoast.showToast(
        msg: response.response?.data["message"] ?? " completedOrders error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColorLight.primaryColor,
        textColor: Colors.white,
        fontSize: 12.0,
      );
    }
  }

  OrderConfigModel? orderConfigModel;

  getOrderConfig() async {
    final response =
        await dioService.getData(url: "order-config", loading: false);
    if (response.isError == false) {
      orderConfigModel = OrderConfigModel.fromjson(response.response?.data);
      return orderConfigModel;
    } else {
      Fluttertoast.showToast(
        msg: response.response?.data["message"] ?? 'Something went wrong',
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
