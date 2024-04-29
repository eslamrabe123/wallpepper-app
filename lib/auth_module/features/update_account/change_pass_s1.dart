import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:wallpapper/auth_module/cubit/auth_cubit.dart';
import 'package:wallpapper/auth_module/features/set_password_screen.dart';
import 'package:wallpapper/auth_module/features/update_account/set_new_password.dart';
import 'package:wallpapper/lay_out_module/features/home_screen.dart';
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

  static String id = 'RegisterView';
  final String phone;
  final List<int> items = const [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
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
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomAppBar(
                        title: "Change Password",
                        textSize: 20,
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
                        height: 30.h,
                      ),
                      Center(
                        child: Pinput(
                          onChanged: (data) {
                            // cubit.otp = int.tryParse(cubit.otpController.text);
                          },
                          onSubmitted: (data) {
                            // cubit.otp = int.tryParse(cubit.otpController.text);
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
                          if (formKey.currentState!.validate()) {}
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
