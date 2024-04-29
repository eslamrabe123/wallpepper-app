import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpapper/auth_module/cubit/auth_cubit.dart';
import 'package:wallpapper/auth_module/cubit/auth_state.dart';
import '../../../core/helper/app_regex.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/themes/app_colors/app_colors_light.dart';
import '../../../shared/button_item.dart';
import '../../../shared/custom_appbar.dart';
import '../../../shared/drawer.dart';
import '../../../shared/text_field_item.dart';

// ignore: must_be_immutable
class SetNewPasswordView extends StatelessWidget {
  SetNewPasswordView({super.key, required this.phone});
  TextEditingController repeatPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  static String id = 'SetNewPasswordView';
  final String phone;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 25.h),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomAppBar(
                        title: "Change Password",
                        textSize: 20.sp,
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
                      ),
                      SizedBox(
                        height: 65.h,
                      ),
                      TextFieldItem(
                        keyBordType: TextInputType.visiblePassword,
                        onChange: (newValue) {},
                        controller: newPasswordController,
                        hintText: "New password",
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
                        isPassword: cubit.isPassWordVisible,
                        validate: (data) {
                          if (data == null || data.isEmpty) {
                            return "password is required";
                          } else if (!AppRegex.hasMinLength(data)) {
                            return "password is very week";
                          } else if (!AppRegex.hasLowerCase(data)) {
                            return "password must contain small Letters";
                          } else if (!AppRegex.hasUpperCase(data)) {
                            return "password must contain big Letters";
                          } else if (!AppRegex.hasSpecialCharacter(data)) {
                            return "password must contain special Letters";
                          } else if (!AppRegex.hasNumber(data)) {
                            return "password must contain numbers";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFieldItem(
                        keyBordType: TextInputType.number,
                        onChange: (newValue) {},
                        controller: repeatPasswordController,
                        hintText: "Repeat new Password",
                        suffixIcon: IconButton(
                          color: cubit.isRepeatPassWordVisible == true
                              ? AppColorLight.primaryColor
                              : const Color(0xff959FA8),
                          onPressed: () {
                            cubit.changeRepeatPasswordVisibility();
                          },
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: cubit.isRepeatPassWordVisible == false
                                ? AppColorLight.primaryColor
                                : const Color(0xff959FA8),
                          ),
                        ),
                        isPassword: cubit.isRepeatPassWordVisible,
                        validate: (data) {
                          if (data == null || data.isEmpty) {
                            return "password is required";
                          } else if (data != newPasswordController.text) {
                            return "password not match";
                          }
                        },
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      ButtonItem(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {}
                        },
                        text: 'Change Password',
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
      ),
    );
  }
}
