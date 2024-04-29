import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpapper/auth_module/cubit/auth_state.dart';

import '../domain/models/user_data_model.dart';
import '../domain/repository/aut_repository.dart';
import '../../../core/utiles/shared.dart';
import '../../../core/utiles/utils.dart';

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

  sendOtp({required BuildContext context, String phone = ''}) async {
    emit(SendOTPLoadingState());
    final data = await authRepository.sendOtp(phone: phone);
    if (data != null) {
      emit(SendOTPSuccessState());

      return data;
    } else {
      emit(SendOTPErrorState());
    }
  }

  register({required BuildContext context,required String phoneNumber}) async {
    emit(RegisterLoadingState());
    final result =
        await authRepository.register(phoneNumber: phoneNumber);
    if (result != null) {
      emit(RegisterSuccessState());

      return result;
    } else {
      emit(RegisterErrorState());
    }
  }

  completeRegister({required BuildContext context, String phone = ''}) async {
    emit(CompleteRegisterLoadingState());
    final result = await authRepository.completeRegister(
      password: setPasswordController.text.trim(),
      name: setNameController.text.trim(),
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

  login() async {
    emit(LoginLoadingState());
    final result = await authRepository.login(
      phoneNumber: phoneController.text.trim(),
      password: passwordController.text.trim(),
    );
    if (result != null) {
      emit(LoginSuccessState());
      CacheHelper.saveData(
          key: "token", value: result.response?.data['access_token']);
      Utils.token = CacheHelper.loadData(key: "token");

      CacheHelper.saveData(
          key: 'name', value: result.response?.data["data"]["name"]);
      Utils.name = CacheHelper.loadData(key: 'name');
      CacheHelper.saveData(
          key: 'phone', value: result.response?.data["data"]["phone"]);
      Utils.phone = CacheHelper.loadData(key: 'phone');
    } else {
      emit(LoginErrorState());
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
    if (result) {
      emit(PinCodeSuccessState());

      return result;
    } else {
      emit(PinCodeErrorState());
    }
  }
}
