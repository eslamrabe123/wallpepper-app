import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpapper/account_module/cubit/account_cubit.dart';
import 'package:wallpapper/core/services/services_locator.dart';
import 'package:wallpapper/lay_out_module/features/home_screen.dart';
import 'package:wallpapper/shared/button_item.dart';
import 'package:wallpapper/shared/custom_appbar.dart';
import 'package:wallpapper/shared/textItem.dart';

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
            body: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(10.0.r),
                child: Column(
                  children: [
                    CustomAppBar(
                      title: cubit.policyModel?.data?.title ?? '',
                      textSize: 20,
                      textColor: const Color(0xff40484E),
                      leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset("assets/images/Back.svg")),
                      action: SizedBox(
                        width: 35.w,
                      ),
                    ),
                    TextItem(
                      textSize: 14,
                      color: const Color(0xff959FA8),
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
                        text: "Contact us for more",
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
