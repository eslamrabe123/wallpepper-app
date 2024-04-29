import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpapper/auth_module/cubit/auth_state.dart';

import '../domain/models/user_data_model.dart';
import '../domain/repository/aut_repository.dart';
import '../../../core/utiles/shared.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  AuthRepository authRepository;
  TextEditingController phoneController = TextEditingController(
    text: CacheHelper.loadData(key: 'phone') ?? '',
  );
  TextEditingController passwordController = TextEditingController();
  TextEditingController setNameController = TextEditingController(
    text: CacheHelper.loadData(key: 'name') ?? '',
  );
  TextEditingController setEmailController = TextEditingController();
  TextEditingController setPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  bool loading = false;

  sendOtp({required BuildContext context, String phone = ''}) async {
    emit(SendOTPLoadingState());
    final data = await authRepository.sendOtp(phone: phone);
    if (data != null) {
      emit(SendOTPSuccessState());

      return true;
    } else {
      emit(SendOTPErrorState());
      return false;
    }
  }

  register({required BuildContext context, required String phoneNumber}) async {
    emit(RegisterLoadingState());
    final result = await authRepository.register(phoneNumber: phoneNumber);
    if (result != null) {
      emit(RegisterSuccessState());

      return result;
    } else {
      emit(RegisterErrorState());
    }
  }

  completeRegister({
    required String phone,
    required String name,
    required String password,
  }) async {
    emit(CompleteRegisterLoadingState());
    final result = await authRepository.completeRegister(
      password: password,
      name: name,
      phoneNumber2: phone,
    );
    if (result != null) {
      log(phoneController.text);
      emit(CompleteRegisterSuccessState());
      return result;
    } else {
      emit(CompleteRegisterErrorState());
    }
  }

  GetUserDataModel? getUserDataModel;

  login({required String phone, required String password}) async {
    emit(LoginLoadingState());
    final result = await authRepository.login(
      phoneNumber: phone,
      password: password,
    );
    if (result != null) {
      emit(LoginSuccessState());

      return true;
    } else {
      emit(LoginErrorState());
      return false;
    }
  }

  checkPinCode({
    required String phone,
    required String otp,
  }) async {
    emit(PinCodeLoadingState());
    final result = await authRepository.checkPinCode(
      phoneNumber: phone,
      otp: otp,
    );
    if (result ==null) {
      emit(PinCodeSuccessState());

      return true;
    } else {
      emit(PinCodeErrorState());
      return false;
    }
  }

  forgotPassword({required String phone, required String password}) async {
    emit(ForgotPAsswordLoadingState());
    final data = await authRepository.forgotPassword(
      phone: phone,
      password: password,
    );
    if (data != null) {
      emit(ForgotPAsswordSuccessState());

      return data;
    } else {
      emit(ForgotPAsswordErrorState());
    }
  }

  updatePassword(
      {required String password, required String newPassword}) async {
    emit(UpdatePasswordLoadingState());
    final data = await authRepository.updatePassword(
      password: password,
      newPassword: newPassword,
    );
    if (data != null) {
      emit(UpdatePasswordSuccessState());
      return data;
    } else {
      emit(UpdatePasswordErrorState());
    }
  }

  bool isRepeatPassWordVisible = true;

  void changeRepeatPasswordVisibility() {
    isRepeatPassWordVisible = !isRepeatPassWordVisible;
    emit(ShowRepeatPasswordState());
  }

  bool isPassWordVisible = true;

  void changePasswordVisibility() {
    isPassWordVisible = !isPassWordVisible;
    emit(ShowPasswordState());
  }
}
