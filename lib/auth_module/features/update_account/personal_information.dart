import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpapper/auth_module/cubit/auth_cubit.dart';
import 'package:wallpapper/core/general_cubit/cubit/general_cubit.dart';
import 'package:wallpapper/core/services/services_locator.dart';
import 'package:wallpapper/core/themes/app_colors/app_colors_light.dart';
import 'package:wallpapper/shared/button_item.dart';
import 'package:wallpapper/shared/custom_appbar.dart';
import 'package:wallpapper/shared/text_field_item.dart';
import '../../../core/helper/app_regex.dart';
import '../../../core/utiles/shared.dart';
import '../../../shared/drawer.dart';
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
      create: (context) => serviceLocator<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = AuthCubit.get(context);
          return Scaffold(
            drawer: DrawerWidget(),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 5.h),
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
                          title: "personal_information".tr(),
                          textSize: 20,
                          leading: Builder(
                            builder: (BuildContext context) {
                              return IconButton(
                                icon: SvgPicture.asset(
                                  "assets/images/Button Menu.svg",
                                  color: context.read<GeneralCubit>().islight ==
                                          true
                                      ? AppColorLight.textMainColor
                                      : Colors.white,
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
                          height: 25.h,
                        ),
                        Container(
                          width: 75.w,
                          height: 75.h,
                          decoration: BoxDecoration(
                              color: const Color(0xffCB0006),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextItem(
                          text: "change".tr(),
                          fontWeight: FontWeight.w600,
                          textSize: 18,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: TextFieldItem(
                            lableColor:  context
                                .read<GeneralCubit>()
                                .islight == true
                                ?AppColorLight.textHintColor
                                : Colors.white,
                            controller: cubit.setNameController,
                            validate: (data) {
                              if (data == null || data.isEmpty) {
                                return "user_name_is_required".tr();
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: TextFieldItem(
                            lableColor:  context
                                .read<GeneralCubit>()
                                .islight == true
                                ?AppColorLight.textHintColor
                                : Colors.white,
                            controller: cubit.setEmailController,
                            hintText: 'Email',
                            validate: (data) {
                              if (data == null || data.isEmpty) {
                                return "email_is_required".tr();
                              } else if (!AppRegex.isEmailValid(data)) {
                                return "enter_a_valid_email".tr();
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: TextFieldItem(
                            lableColor:  context
                                .read<GeneralCubit>()
                                .islight == true
                                ?AppColorLight.textHintColor
                                : Colors.white,
                            controller: cubit.phoneController,
                            hintText: "${CacheHelper.loadData(key: "phoen")}",
                            validate: (data) {
                              if (data == null || data.isEmpty) {
                                return "enter_your_phone_number".tr();
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 55.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: ButtonItem(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await cubit.sendOtp(
                                    phone: cubit.phoneController.text,
                                    context: context);
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
                            text: "change_password".tr(),
                            buttonColor: const Color(0xff00CB6D),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: ButtonItem(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {}
                            },
                            text: "save".tr(),
                          ),
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
