import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpapper/auth_module/cubit/auth_cubit.dart';
import 'package:wallpapper/auth_module/features/forgot_password.dart';
import 'package:wallpapper/auth_module/features/register_screen.dart';
import 'package:wallpapper/core/themes/app_colors/app_colors_light.dart';
import 'package:wallpapper/lay_out_module/features/home_screen.dart';

import '../../core/general_cubit/cubit/general_cubit.dart';
import '../../core/services/services_locator.dart';
import '../../shared/button_item.dart';
import '../../shared/textItem.dart';
import '../../shared/text_field_item.dart';
import '../cubit/auth_state.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginView({super.key});

  static var loginFormKey = GlobalKey<FormState>();

  static String id = 'LoginView';

  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => serviceLocator<AuthCubit>(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = AuthCubit.get(context);
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0.w),
                  child: Form(
                    key: loginFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 25.h,
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
                          text: "finally_you_back".tr(),
                          textAlign: TextAlign.center,
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
                          keyBordType: TextInputType.phone,
                          onSubmitted: (vale) {},
                          onChange: (newValue) {},
                          controller: phoneController,
                          hintText: "phone_number".tr(),
                          isPassword: false,
                          validate: (data) {
                            if (data == null || data.isEmpty) {
                              return "phone_number_is_required".tr();
                            } else {
                              return null;
                            }
                          },
                        ),
                        const ForgotPasswordButtonItem(),
                        ButtonItem(
                          onPressed: () async {
                            if (loginFormKey.currentState!.validate()) {
                              final data = await cubit.login(
                                password: passwordController.text.trim(),
                                phone: phoneController.text.trim(),
                              );
                              if (data) {
                                Navigator.pushAndRemoveUntil(
                                    // ignore: use_build_context_synchronously
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const HomeScreen())),
                                    (route) => false);
                              }
                            }
                          },
                          text: 'login'.tr(),
                        ),
                        const CreateNewAccountButtonItem(),
                      ],
                    ),
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

/// Token is = 84|W6d556HXHTrTAV1b3DgzUOnGSEyCzB6LOh6HSIaG

class CreateNewAccountButtonItem extends StatelessWidget {
  const CreateNewAccountButtonItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: 12.w,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextItem(
              text: 'dont_have_account'.tr(),
              color: context.read<GeneralCubit>().islight == true
                  ? Colors.black
                  : Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RegisterView.id);
                },
                child: TextItem(
                  text: 'sign_up'.tr(),
                  color: context.read<GeneralCubit>().islight == true
                      ? AppColorLight.primaryColor
                      : const Color.fromARGB(255, 235, 163, 158),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordButtonItem extends StatelessWidget {
  const ForgotPasswordButtonItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed(ForgotPasswordView.id);
        },
        child: TextItem(
          color: context.read<GeneralCubit>().islight == true
              ? AppColorLight.favoriteIconColor
              : const Color.fromARGB(255, 235, 163, 158),
          text: 'forget_password'.tr(),
        ),
      ),
    );
  }
}
