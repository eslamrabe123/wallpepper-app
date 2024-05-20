import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpapper/auth_module/cubit/auth_cubit.dart';
import 'package:wallpapper/auth_module/features/login_screen.dart';
import 'package:wallpapper/core/themes/color_themes.dart';
import '../../core/general_cubit/cubit/general_cubit.dart';
import '../../core/helper/app_regex.dart';
import '../../core/services/services_locator.dart';
import '../../core/themes/app_colors/app_colors_light.dart';
import '../../shared/button_item.dart';
import '../../shared/textItem.dart';
import '../../shared/text_field_item.dart';
import '../cubit/auth_state.dart';

class SetPasswordView extends StatelessWidget {
  SetPasswordView({super.key, required this.phone});

  GlobalKey<FormState> setPasswordFormKey = GlobalKey<FormState>();

  final String phone;

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

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
                key: setPasswordFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    SvgPicture.asset(
                      context.read<GeneralCubit>().islight == true
                          ? "assets/images/pin_code_icon.svg"
                          : "assets/images/Group 52.svg",

                    ),
                    SizedBox(
                      height: 45.h,
                    ),
                    TextItem(
                      fontWeight: FontWeight.w600,
                      textSize: 20.sp,
                      text: "finally".tr(),

                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    TextFieldItem(
                      lableColor:  context
                          .read<GeneralCubit>()
                          .islight == true
                          ?AppColorLight.textHintColor
                          : Colors.white,
                      suffixIcon: IconButton(
                        color: cubit.isPassWordVisible == true
                            ? AppColorLight.primaryColor
                            : const Color(0xff959FA8),
                        onPressed: () {
                          cubit.changePasswordVisibility();
                        },
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: cubit.isPassWordVisible == false
                              ? AppColorLight.primaryColor
                              : const Color(0xff959FA8),
                        ),
                      ),
                      keyBordType: TextInputType.visiblePassword,
                      onChange: (newValue) {},
                      controller: passwordController,
                      hintText: "password".tr(),
                      isPassword: cubit.isPassWordVisible,
                      validate: (data) {
                        if (data == null || data.isEmpty) {
                          return "password_is_required".tr();
                        } else if (!AppRegex.hasMinLength(data)) {
                          return "password_is_very_week".tr();
                        } else if (!AppRegex.hasLowerCase(data)) {
                          return "password_must_contain_small_letters".tr();
                        } else if (!AppRegex.hasUpperCase(data)) {
                          return "password_must_contain_big_letters".tr();
                        } else if (!AppRegex.hasSpecialCharacter(data)) {
                          return "password_must_contain_special_characters"
                              .tr();
                        } else if (!AppRegex.hasNumber(data)) {
                          return "password_must_contain_numbers".tr();

                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFieldItem(
                      lableColor:  context
                          .read<GeneralCubit>()
                          .islight == true
                          ?AppColorLight.textHintColor
                          : Colors.white,
                      keyBordType: TextInputType.number,
                      onChange: (newValue) {},
                      controller: userNameController,
                      hintText: "your_name".tr(),
                      isPassword: false,
                      validate: (data) {
                        if (data == null || data.isEmpty) {
                          return "user_name_is_required".tr();

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
                        if (setPasswordFormKey.currentState!.validate()) {
                          await cubit.completeRegister(
                            phone: phone,
                            name: userNameController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                          Navigator.pushNamed(context, LoginView.id);
                        }
                      },
                      text: 'save_and_login'.tr(),
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ));
  }
}
