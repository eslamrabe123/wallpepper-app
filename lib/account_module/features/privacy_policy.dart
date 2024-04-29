import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpapper/account_module/cubit/account_cubit.dart';
import 'package:wallpapper/core/services/services_locator.dart';
import 'package:wallpapper/shared/button_item.dart';
import 'package:wallpapper/shared/custom_appbar.dart';
import 'package:wallpapper/shared/textItem.dart';

import '../../core/general_cubit/cubit/general_cubit.dart';
import '../../core/themes/app_colors/app_colors_light.dart';
import 'help.dart';

class PrivacyAndPolicyView extends StatelessWidget {
  const PrivacyAndPolicyView({super.key});

  static String id = "PrivacyAndPolicyView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<AccountCubit>()..privacyAndPolicy(),
      child: BlocConsumer<AccountCubit, AccountState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = AccountCubit.get(context);
          return Scaffold(
            body: state is PrivacyAndPolicyStateLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColorLight.primaryColor,
                    ),
                  )
                : SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.all(10.0.r),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20.0,
                              left: 5.0,
                              right: 5.0,
                              bottom: 10.0,
                            ),
                            child: CustomAppBar(
                              title: cubit.policyModel?.data?.title ?? '',
                              textSize: 20,
                              leading: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: SvgPicture.asset(
                                    "assets/images/Back.svg",
                                    color:
                                        context.read<GeneralCubit>().islight ==
                                                true
                                            ? AppColorLight.textMainColor
                                            : Colors.white,
                                  )),
                              action: SizedBox(
                                width: 35.w,
                              ),
                            ),
                          ),
                          TextItem(
                            textSize: 14,
                            color: context.read<GeneralCubit>().islight == true
                                ? AppColorLight.textHintColor
                                : Colors.white,
                            fontWeight: FontWeight.normal,
                            textAlign: TextAlign.center,
                            text: cubit.policyModel?.data?.content ?? '',
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0.r),
                            child: ButtonItem(
                              onPressed: () {
                                Navigator.pushNamed(context, HelpView.id);
                              },
                              text: "contact_us_for_more".tr(),
                              height: 55,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
