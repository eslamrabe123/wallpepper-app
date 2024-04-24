part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class MinasState extends OrderState {}

class AddState extends OrderState {}

class OrderConfigStateLoading extends OrderState {}

class OrderConfigStateSuccess extends OrderState {}

class OrderConfigStateError extends OrderState {}

class SwitchWidgets extends OrderState {}

class CompletedOrdersStateLoading extends OrderState {}

class CompletedOrdersStateSuccess extends OrderState {}

class CompletedOrdersStateError extends OrderState {}

class PendingOrdersStateLoading extends OrderState {}

class PendingOrdersStateSuccess extends OrderState {}

class PendingOrdersStateError extends OrderState {}
