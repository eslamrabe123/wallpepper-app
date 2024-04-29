import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpapper/auth_module/cubit/auth_cubit.dart';
import 'package:wallpapper/auth_module/features/pin_code_screen.dart';
import 'package:wallpapper/core/helper/snack-bar_ui.dart';
import 'package:wallpapper/core/themes/app_colors/app_colors_dark.dart';
import 'package:wallpapper/core/themes/app_colors/app_colors_light.dart';
import 'package:wallpapper/shared/textItem.dart';

import '../../core/general_cubit/cubit/general_cubit.dart';
import '../../core/services/services_locator.dart';
import '../../shared/button_item.dart';
import '../../shared/text_field_item.dart';
import '../cubit/auth_state.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  static String id = 'RegisterView';

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
    TextEditingController phoneController = TextEditingController();

    return Scaffold(
      body: BlocProvider(
        create: (context) => serviceLocator<AuthCubit>(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = AuthCubit.get(context);
            return Stack(
              children: [
                SvgPicture.asset(
                  "assets/images/register_background.svg",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: registerFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 100.h,
                          ),
                          SvgPicture.asset(
                            "assets/images/splash_icon.svg",
                          ),
                          SizedBox(
                            height: 70.h,
                          ),
                          // SizedBox(height: 100.h,),
                          TextItem(
                            textAlign: TextAlign.center,
                            text: "register_as_boss".tr(),
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            textSize: 30,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          TextFieldItem(
                            lableColor: context.read<GeneralCubit>().islight
                                ? AppColorLight.textHintColor
                                : Colors.white,
                            hintColor: context.read<GeneralCubit>().islight
                                ? AppColorLight.textHintColor
                                : AppColorDark.textHintColor,
                            keyBordType: TextInputType.number,
                            onSubmitted: (vale) {
                              // cubit.phoneNumber =
                              //     int.tryParse(cubit.phoneController.text);
                            },
                            onChange: (newValue) {
                              int value = int.parse(phoneController.text);
                            },
                            controller: phoneController,
                            hintText: "phone_number".tr(),
                            isPassword: false,
                            validate: (data) {
                              if (data == null || data.isEmpty) {
                                return "enter_your_phone_number".tr();
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 35.h,
                          ),
                          ButtonItem(
                            onPressed: () async {
                              if (registerFormKey.currentState!.validate()) {
                                final data = await cubit.register(
                                    context: context,
                                    phoneNumber: phoneController.text.trim());

                                if (data != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PinCodeView(
                                        phone: phoneController.text.trim(),
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                            text: 'sign_up'.tr(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
