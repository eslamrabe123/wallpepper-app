import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpapper/auth_module/cubit/auth_state.dart';
import '../../core/utiles/shared.dart';
import '../../core/utiles/utils.dart';
import '../domain/models/user_data_model.dart';
import '../domain/repository/aut_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  AuthRepository authRepository;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController setNameController = TextEditingController();
  TextEditingController setEmailController = TextEditingController();
  TextEditingController setPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  sendOtp({String phone = ''}) async {
    emit(SendOTPLoadingState());
    final data = await authRepository.sendOtp(phone: phone);
    if (data != null) {
      emit(SendOTPSuccessState());

      return data;
    } else {
      emit(SendOTPErrorState());
    }
  }

  register() async {
    emit(RegisterLoadingState());
    final result =
        await authRepository.register(phoneNumber: phoneController.text.trim());
    if (result != null) {
      emit(RegisterSuccessState());

      return result;
    } else {
      emit(RegisterErrorState());
    }
  }

  completeRegister({required String phone}) async {
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

  login({required BuildContext context}) async {
    emit(LoginLoadingState());
    final result = await authRepository.login(
      phoneNumber: phoneController.text.trim(),
      password: passwordController.text.trim(),
    );
    if (result != null) {
      emit(LoginSuccessState());

      return result;
    } else {
      emit(LoginErrorState());
    }
  }

  int? otp;

  Future<void> pinCode({
    required String phone,
    required int otp,
  }) async {
    print('object');
    emit(PinCodeLoadingState());
    final result = await authRepository.pinCode(
      phoneNumber: phone,
      otp: otp,
    );
    if (result != null) {
      emit(PinCodeSuccessState());

      return result;
    } else {
      emit(PinCodeErrorState());
    }
  }
}
