import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpapper/account_module/cubit/account_cubit.dart';
import 'package:wallpapper/auth_module/cubit/auth_cubit.dart';
import 'package:wallpapper/auth_module/features/login_screen.dart';
import '../../../core/helper/app_regex.dart';
import '../../../core/services/services_locator.dart';
import '../../../shared/button_item.dart';
import '../../../shared/custom_appbar.dart';
import '../../../shared/drawer.dart';
import '../../../shared/textItem.dart';
import '../../../shared/text_field_item.dart';

class SetNewPasswordView extends StatelessWidget {
  SetNewPasswordView({super.key, required this.phone});

  static String id = 'SetNewPasswordView';
  final String phone;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      drawer: const DrawerWidget(),
      body: BlocProvider(
        create: (context) => serviceLocator<AccountCubit>(),
        child: BlocConsumer<AccountCubit, AccountState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = AccountCubit.get(context);
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
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      TextFieldItem(
                        keyBordType: TextInputType.number,
                        onChange: (newValue) {},
                        // controller: cubit.setPasswordController,
                        hintText: "New password",
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
                        // controller: cubit.setNameController,
                        hintText: "Repeat new Password",
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
