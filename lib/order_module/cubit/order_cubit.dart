import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/model/completed_orders_model.dart';
import '../domain/model/order_config_model.dart';
import '../domain/model/pendingOrders-model.dart';
import '../domain/repository/repository.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderRepository orderRepository;

  OrderCubit(this.orderRepository) : super(OrderInitial());

  static OrderCubit get(context) => BlocProvider.of(context);


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

  int x = 0;

  add() {
    x++;
    emit(AddState());
  }

  minas() {
    x--;
    emit(MinasState());
  }

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
