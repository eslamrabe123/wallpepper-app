import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpapper/auth_module/cubit/auth_cubit.dart';
import 'package:wallpapper/auth_module/features/register_screen.dart';
import 'package:wallpapper/auth_module/features/set_password_screen.dart';
import 'package:wallpapper/lay_out_module/features/home_screen.dart';
import '../../core/helper/app_regex.dart';
import '../../core/services/services_locator.dart';
import '../../shared/button_item.dart';
import '../../shared/textItem.dart';
import '../../shared/text_field_item.dart';
import '../cubit/auth_state.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  static var loginFormKey = GlobalKey<FormState>();

  static String id = 'LoginView';

  TextEditingController passwordController = TextEditingController();

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
                  padding: const EdgeInsets.all(16.0),
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
                          "assets/images/pin_code_icon.svg",
                        ),
                        SizedBox(
                          height: 45.h,
                        ),
                        const TextItem(
                          fontWeight: FontWeight.w600,
                          textSize: 20,
                          color: Color(0xff40484E),
                          text: "Finally you Back 😘",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        TextFieldItem(
                          keyBordType: TextInputType.number,
                          onChange: (newValue) {},
                          controller: cubit.passwordController,
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
                          onSubmitted: (vale) {
                            // cubit.phoneNumber =
                            //     int.tryParse(cubit.phoneController.text);
                          },
                          onChange: (newValue) {},
                          controller: cubit.phoneController,
                          hintText: "Phone number",
                          isPassword: false,
                          validate: (data) {
                            if (data == null || data.isEmpty) {
                              return "phone number is required";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const ForgotPasswordButtonItem(),
                        ButtonItem(
                          onPressed: () async {
                            if (loginFormKey.currentState!.validate()) {
                              await cubit.login();
                              Navigator.pushNamed(context, HomeScreen.id);
                            }
                          },
                          text: "Log in",
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
      widthFactor: 12,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextItem(
              text: 'Don’t have Account?',
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RegisterView.id);
                },
                child: const TextItem(
                  text: 'Sign up',
                  color: Color(0xffCB0006),
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
          Navigator.of(context).pushNamed(SetPasswordView.id);
        },
        child: const TextItem(
          color: Color(0xFF98121F),
          text: 'Forget password?',
        ),
      ),
    );
  }
}
