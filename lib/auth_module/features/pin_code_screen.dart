import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:wallpapper/auth_module/cubit/auth_cubit.dart';
import 'package:wallpapper/auth_module/features/set_password_screen.dart';
import 'package:wallpapper/shared/textItem.dart';
import '../../core/services/services_locator.dart';
import '../../shared/button_item.dart';
import '../cubit/auth_state.dart';

class PinCodeView extends StatelessWidget {
  PinCodeView({super.key, required this.phone});

  static var pinCodFormKey = GlobalKey<FormState>();
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

  static String id = 'RegisterView';
  final String phone;
  final List<int> items = const [1, 2, 3, 4];

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
                        "assets/images/pin_code_icon.svg",
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      // SizedBox(height: 100.h,),
                      const TextItem(
                        textAlign: TextAlign.center,
                        text: "ٌRegister as Boss",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        textSize: 30,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Center(
                        child: Pinput(
                          onChanged: (data) {
                            cubit.otp = int.tryParse(cubit.otpController.text);
                          },
                          onSubmitted: (data) {
                            cubit.otp = int.tryParse(cubit.otpController.text);
                          },
                          pinAnimationType: PinAnimationType.fade,
                          closeKeyboardWhenCompleted: true,
                          animationCurve: Curves.easeInOut,
                          animationDuration: const Duration(seconds: 2),
                          validator: (e) {
                            if (e == null || e.isEmpty) {
                              return "Enter OTP code";
                            } else {
                              null;
                            }
                            return null;
                          },
                          defaultPinTheme: defaultPinTheme,
                          controller: cubit.otpController,
                          preFilledWidget: const TextItem(
                            text: '__',
                            
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      const TextItem(
                        fontWeight: FontWeight.w700,
                        textSize: 16,
                        color: Color(0xffCCCCCC),
                        text: "Please enter OTP to your \n Register mobile",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 55.h,
                      ),

                      ButtonItem(
                        onPressed: () async {
                          if (pinCodFormKey.currentState!.validate()) {
                             cubit.pinCode(
                              phone: phone,
                              otp: cubit.otp ?? 0,
                            ).then((value) {
                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                     builder: (context) =>
                                         SetPasswordView(
                                           phone: phone,
                                         ),
                                   ),
                                 );
                             });


                          }
                        },
                        text: 'Verify',
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
