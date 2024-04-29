import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:wallpapper/auth_module/cubit/auth_cubit.dart';
import 'package:wallpapper/auth_module/features/set_password_screen.dart';
import 'package:wallpapper/core/general_cubit/cubit/general_cubit.dart';
import 'package:wallpapper/core/themes/app_colors/app_colors_dark.dart';
import 'package:wallpapper/core/themes/app_colors/app_colors_light.dart';
import 'package:wallpapper/shared/textItem.dart';
import '../../core/services/services_locator.dart';
import '../../shared/button_item.dart';
import '../cubit/auth_state.dart';

class PinCodeView extends StatelessWidget {
  const PinCodeView({super.key, required this.phone});

  final String phone;

  static var pinCodFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => serviceLocator<AuthCubit>(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = AuthCubit.get(context);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: pinCodFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 100.h,
                      ),

                      SvgPicture.asset(
                        context
                            .read<GeneralCubit>()
                            .islight == true
                            ? "assets/images/pin_code_icon.svg"
                            : "assets/images/Group 52.svg",
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      // SizedBox(height: 100.h,),
                      TextItem(
                        textAlign: TextAlign.center,
                        text: "otp_confirmation".tr(),
                        fontWeight: FontWeight.normal,
                        textSize: 20.sp,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Center(
                        child: Pinput(
                          pinAnimationType: PinAnimationType.fade,
                          closeKeyboardWhenCompleted: true,
                          onCompleted: (data) {
                            print(data);
                          },
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
                          defaultPinTheme: PinTheme(
                            width: 56,
                            height: 56,
                            textStyle: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                  const Color.fromRGBO(234, 239, 243, 1)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          controller: cubit.otpController,
                          preFilledWidget: const TextItem(
                            text: '__',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      TextItem(
                        fontWeight: FontWeight.w700,
                        textSize: 16.sp,
                        color: context
                            .read<GeneralCubit>()
                            .islight == true
                            ? AppColorLight.textGreyColor
                            : AppColorDark.textGreyColor,
                        text: "please_enter_otp".tr(),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 55.h,
                      ),

                      ButtonItem(
                        onPressed: () async {
                          if (pinCodFormKey.currentState!.validate()) {
                            final data = await cubit.checkPinCode(
                              phone: phone,
                              otp: cubit.otpController.text.toString(),
                            );
                            if (data == true) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SetPasswordView(
                                        phone: phone,
                                      ),
                                ),
                              );
                            }
                          }
                        },
                        text: "verify".tr(),
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
