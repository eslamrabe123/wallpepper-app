import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../domain/model/privacy_and_policyView_model.dart';
import '../domain/repository/repository.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountRepository accountRepository;

  AccountCubit(this.accountRepository) : super(AccountInitial());

  static AccountCubit get(context) => BlocProvider.of(context);

  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  int? otp;


  PrivacyAndPolicyModel? policyModel;

  privacyAndPolicy() async {
    emit(PrivacyAndPolicyStateLoading());
    final data = await accountRepository.privacyAndPolicy();
    if (data != null) {
      emit(PrivacyAndPolicyStateSuccess());

      policyModel = data;
      return policyModel;
    } else {
      emit(PrivacyAndPolicyStateError());
    }
  }
}
