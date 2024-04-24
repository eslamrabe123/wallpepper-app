import 'package:wallpapper/core/helper/alerts.dart';
import 'package:wallpapper/core/local/api/api.dart';
import 'package:wallpapper/order_module/domain/model/completed_orders_model.dart';
import 'package:wallpapper/shared/textItem.dart';

import '../model/order_config_model.dart';
import '../model/pendingOrders-model.dart';

class OrderRepository {
  DioService dioService;

  OrderRepository(this.dioService);

  PendingOrdersModel? pendingOrdersModel;

  pendingOrders() async {
    final response =
    await dioService.getData(url: "pending-order", loading: true);
    if (response.isError == false) {
      pendingOrdersModel =
          PendingOrdersModel.fromJson(response.response?.data);
      return pendingOrders;
    } else {
      // Fluttertoast.showToast(msg: response.response?.data["message"]);

    }
  }

  CompletedOrdersModel? completedOrdersModel;

  completedOrders() async {
    final response =
        await dioService.getData(url: "completed-order", loading: true);
    if (response.isError == false) {
      completedOrdersModel =
          CompletedOrdersModel.fromJson(response.response?.data);
      return completedOrdersModel;
    } else {
      // Fluttertoast.showToast(msg: response.response?.data["message"]);

    }
  }

  OrderConfigModel? orderConfigModel;

  getOrderConfig() async {
    final response =
        await dioService.getData(url: "order-config", loading: true);
    if (response.isError == false) {
      orderConfigModel = OrderConfigModel.fromjson(response.response?.data);
      return orderConfigModel;
    } else {
      // Fluttertoast.showToast(msg: response.response?.data["message"]);
    }
  }
}
