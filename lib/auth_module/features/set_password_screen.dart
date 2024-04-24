import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpapper/auth_module/cubit/auth_cubit.dart';
import 'package:wallpapper/auth_module/features/login_screen.dart';
import '../../core/helper/app_regex.dart';
import '../../core/services/services_locator.dart';
import '../../shared/button_item.dart';
import '../../shared/textItem.dart';
import '../../shared/text_field_item.dart';
import '../cubit/auth_state.dart';

class SetPasswordView extends StatelessWidget {
  SetPasswordView({super.key,required this.phone});

  static var SetPasswordFormKey = GlobalKey<FormState>();

  static String id = 'SetPasswordView';
  final String phone;


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
                  key: SetPasswordFormKey,
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
                        height: 45.h,
                      ),
                      const TextItem(
                        fontWeight: FontWeight.w600,
                        textSize: 20,
                        color: Color(0xff40484E),
                        text: "Finally! Your near me",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      TextFieldItem(
                        keyBordType: TextInputType.number,
                        onChange: (newValue) {},
                        controller: cubit.setPasswordController,
                        hintText: "password",
                        isPassword: false,
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
                        controller: cubit.setNameController,
                        hintText: "Your name",
                        isPassword: false,
                        validate: (data) {
                          if (data == null || data.isEmpty) {
                            return "user name is required";
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
                          if (SetPasswordFormKey.currentState!.validate()) {
                            await cubit.completeRegister(phone: phone);
                            Navigator.pushNamed(context, LoginView.id);
                          }
                        },
                        text: 'Save and login',
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
