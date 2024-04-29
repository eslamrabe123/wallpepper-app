import 'package:flutter/cupertino.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoadingState extends AuthState {}

class ShowPasswordState extends AuthState {}

class ShowRepeatPasswordState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterErrorState extends AuthState {}

class CompleteRegisterLoadingState extends AuthState {}

class CompleteRegisterSuccessState extends AuthState {}

class CompleteRegisterErrorState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginErrorState extends AuthState {}

class PinCodeLoadingState extends AuthState {}

class PinCodeSuccessState extends AuthState {}

class PinCodeErrorState extends AuthState {}

class SendOTPLoadingState extends AuthState {}

class SendOTPSuccessState extends AuthState {}

class SendOTPErrorState extends AuthState {}

class ForgotPAsswordLoadingState extends AuthState {}

class ForgotPAsswordSuccessState extends AuthState {}

class ForgotPAsswordErrorState extends AuthState {}

class UpdatePasswordLoadingState extends AuthState {}

class UpdatePasswordSuccessState extends AuthState {}

class UpdatePasswordErrorState extends AuthState {}
