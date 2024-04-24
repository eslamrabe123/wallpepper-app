import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpapper/account_module/cubit/account_cubit.dart';
import 'package:wallpapper/core/services/services_locator.dart';
import 'package:wallpapper/shared/button_item.dart';
import 'package:wallpapper/shared/custom_appbar.dart';
import 'package:wallpapper/shared/textItem.dart';
import 'package:wallpapper/shared/text_field_item.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  static String id = "HelpView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<AccountCubit>(),
      child: BlocConsumer<AccountCubit, AccountState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = AccountCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(10.0.r),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppBar(
                        title: 'Privacy Policy',
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
                      SizedBox(
                        height: 70.h,
                      ),
                      const TextItem(
                        text: "How can we help you?",
                        fontWeight: FontWeight.w600,
                        textSize: 20,
                        color: Color(0xff40484E),
                      ),
                      TextFieldItem(
                        validate: (validate) {},
                        hintText: "Subject",
                      ),
                      TextFieldItem(
                        validate: (validate) {},
                        hintText: "Details",
                        maxLine: 6,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      ButtonItem(
                        onPressed: () {},
                        text: "Contact us for more",
                        height: 55,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset("assets/images/instgram.svg"),
                          ),
                          SizedBox(width: 15.w,),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset("assets/images/whatsapp_icon.svg"),
                          ),
                        ],
                      )
                    ],
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
