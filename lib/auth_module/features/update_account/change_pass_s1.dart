// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:wallpapper/auth_module/cubit/auth_cubit.dart';
import 'package:wallpapper/auth_module/features/update_account/set_new_password.dart';

import 'package:wallpapper/shared/textItem.dart';
import '../../../core/services/services_locator.dart';
import '../../../shared/button_item.dart';
import '../../../shared/custom_appbar.dart';
import '../../../shared/drawer.dart';
import '../../cubit/auth_state.dart';

class ChangePasswordStepOneScreen extends StatelessWidget {
  ChangePasswordStepOneScreen({super.key, required this.phone});

  TextEditingController otpController = TextEditingController();
  static var formKey = GlobalKey<FormState>();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  final String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      body: BlocProvider(
        create: (context) => serviceLocator<AuthCubit>(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = AuthCubit.get(context);
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomAppBar(
                        title: "change_password".tr(),
                        textSize: 20.sp,
                        textColor: const Color(0xff40484E),
                        leading: Builder(
                          builder: (BuildContext context) {
                            return IconButton(
                              icon: SvgPicture.asset(
                                "assets/images/Button Menu.svg",
                              ),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                            );
                          },
                        ),
                        action: SizedBox(
                          width: 50.w,
                        ),
                      ),
                      SizedBox(
                        height: 166.h,
                      ),
                      Center(
                        child: Pinput(
                          onChanged: (data) {
                            // cubit.otp = int.tryParse(cubit.otpController.text);
                          },
                          onSubmitted: (data) {
                            // cubit.otp = int.tryParse(cubit.otpController.text);
                          },
                          pinAnimationType: PinAnimationType.rotation,
                          closeKeyboardWhenCompleted: true,
                          animationCurve: Curves.easeInOut,
                          animationDuration: const Duration(seconds: 2),
                          validator: (e) {
                            if (e == null || e.isEmpty) {
                              return "enter_otp".tr();
                            } else {
                              null;
                            }
                            return null;
                          },
                          defaultPinTheme: defaultPinTheme,
                          controller: cubit.otpController,
                        ),
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      TextItem(
                        fontWeight: FontWeight.w700,
                        textSize: 16,
                        color: const Color(0xffCCCCCC),
                        text: "please_enter_otp".tr(),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 55.h,
                      ),
                      ButtonItem(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            final data = await cubit.checkPinCode(
                              phone: phone,
                              otp: cubit.otpController.text,
                            );
                            if (data) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SetNewPasswordView(
                                    phone: phone,
                                  ),
                                ),
                              );
                            }
                          }
                        },
                        text: 'verify'.tr(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
