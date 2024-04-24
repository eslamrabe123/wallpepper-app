import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpapper/account_module/cubit/account_cubit.dart';
import 'package:wallpapper/auth_module/cubit/auth_cubit.dart';
import 'package:wallpapper/core/services/services_locator.dart';
import 'package:wallpapper/shared/button_item.dart';
import 'package:wallpapper/shared/custom_appbar.dart';
import 'package:wallpapper/shared/text_field_item.dart';

import '../../../shared/textItem.dart';
import '../../cubit/auth_state.dart';
import 'change_pass_s1.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  static String id = "PersonalInformationScreen";

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => serviceLocator<AuthCubit>()..login(context: context),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = AuthCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.r, vertical: 5.r),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomAppBar(
                          title: "Personal Information",
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
                                  print(cubit.getUserDataModel?.data?.name);
                                },
                              );
                            },
                          ),
                          action: SizedBox(
                            width: 50.w,
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Container(
                          width: 75.w,
                          height: 90.h,
                          decoration: BoxDecoration(
                              color: const Color(0xffCB0006),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const TextItem(
                          text: "Change ",
                          color: Color(0xff40484E),
                          fontWeight: FontWeight.w600,
                          textSize: 18,
                        ),
                        TextFieldItem(
                          controller: cubit.setNameController,
                          hintText: "Name",
                          validate: (data) {
                            if (data == null || data.isEmpty) {
                              return "user name is required";
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFieldItem(
                          controller: cubit.setEmailController,
                          hintText: 'Email',
                          validate: (data) {
                            if (data == null || data.isEmpty) {
                              return "email is required";
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFieldItem(
                          controller: cubit.phoneController,
                          hintText: 'Phone number',
                          validate: (data) {
                            if (data == null || data.isEmpty) {
                              return "enter your phone number";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 55.h,
                        ),
                        ButtonItem(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await cubit.sendOtp(
                                  phone: cubit.phoneController.text);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ChangePasswordStepOneScreen(
                                    phone: cubit.phoneController.text,
                                  ),
                                ),
                              );
                            }
                          },
                          text: "Change Password",
                          buttonColor: const Color(0xff00CB6D),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        ButtonItem(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {}
                          },
                          text: "Save",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
