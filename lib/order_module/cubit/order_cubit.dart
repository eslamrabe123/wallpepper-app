import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/themes/app_colors/app_colors_light.dart';
import '../domain/model/completed_orders_model.dart';
import '../domain/model/order_config_model.dart';
import '../domain/model/order_model.dart';
import '../domain/model/pendingOrders-model.dart';
import '../domain/repository/repository.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderRepository orderRepository;

  OrderCubit(this.orderRepository) : super(OrderInitial());

  static OrderCubit get(context) => BlocProvider.of(context);
  bool isDisc = false;

  void changeDisc() {
    isDisc = true;
    print(isDisc);
    emit(ChangeDiscState());
  }

  showToast() {
    emit(ShowToastState());

    if (isDisc) {
      Fluttertoast.showToast(
        msg: "Discount Applied",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColorLight.textColorGereen,
        textColor: Colors.white,
        fontSize: 12.0,
      );
    }
  }

  List<OrderModel> itemModel = [
    OrderModel(
      image:
          'https://www.shutterstock.com/image-photo/burger-tomateoes-lettuce-pickles-on-600nw-2309539129.jpg',
      name: 'Burder',
      price: '35',
      category: 'pizza',
    ),
    OrderModel(
      image:
          'https://www.shutterstock.com/image-photo/burger-tomateoes-lettuce-pickles-on-600nw-2309539129.jpg',
      name: 'Burder',
      price: '35',
      category: 'pizza',
    ),
    OrderModel(
      image:
          'https://www.shutterstock.com/image-photo/burger-tomateoes-lettuce-pickles-on-600nw-2309539129.jpg',
      name: 'Burder',
      price: '35',
      category: 'pizza',
    ),
    OrderModel(
      image:
          'https://www.shutterstock.com/image-photo/burger-tomateoes-lettuce-pickles-on-600nw-2309539129.jpg',
      name: 'Burder',
      price: '35',
      category: 'pizza',
    ),
  ];

  void removeRequest(int index) {
    itemModel.removeAt(index);
    emit(RemoveState());
  }

  OrderModel? model;

  add() {
    model?.quantity++;
    emit(AddState());
  }

  minse() {
    model?.quantity--;
    emit(MinasState());
  }

  remove(int index) {}

  PendingOrdersModel? pendingOrdersModel;

  pendingOrders() async {
    emit(PendingOrdersStateLoading());
    final data = await orderRepository.pendingOrders();
    if (data != null) {
      emit(PendingOrdersStateSuccess());

      pendingOrdersModel = data;
      return pendingOrdersModel;
    } else {
      emit(PendingOrdersStateError());
    }
  }

  CompletedOrdersModel? completedOrdersModel;

  completedOrders() async {
    emit(CompletedOrdersStateLoading());
    final data = await orderRepository.completedOrders();
    if (data != null) {
      emit(CompletedOrdersStateSuccess());

      completedOrdersModel = data;
      return completedOrdersModel;
    } else {
      emit(CompletedOrdersStateError());
    }
  }

  OrderConfigModel? orderConfigModel;

  getOrderConfig() async {
    emit(OrderConfigStateLoading());
    final data = await orderRepository.getOrderConfig();
    if (data != null) {
      emit(OrderConfigStateSuccess());

      orderConfigModel = data;
      return orderConfigModel;
    } else {
      emit(OrderConfigStateError());
    }
  }

  // int x = 0;

  // add() {
  //   x++;
  //   emit(AddState());
  // }

  // minas() {
  //   x--;
  //   emit(MinasState());
  // }

  bool pageOne = false;
  bool? pageTow = false;

  int type = 0;

  switchWidgets() {
    switch (type) {
      case 0:
        pageOne = true;
        break;
      case 1:
        pageTow = true;
        break;
    }

    emit(SwitchWidgets());
  }
}
