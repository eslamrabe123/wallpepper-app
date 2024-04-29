import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpapper/core/themes/app_colors/app_colors_dark.dart';
import 'package:wallpapper/order_module/features/order_number_screen.dart';
import 'package:wallpapper/shared/button_item.dart';

import '../../core/general_cubit/cubit/general_cubit.dart';
import '../../core/themes/app_colors/app_colors_light.dart';
import '../../shared/textItem.dart';

class CompletedOrdersComponent extends StatelessWidget {
  const CompletedOrdersComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const BuldCompleteOrder();
      },
      itemCount: 4,
    );
  }
}

class BuldCompleteOrder extends StatelessWidget {
  const BuldCompleteOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 0,
        left: 16.0.w,
        right: 16.0.w,
        bottom: 20.h,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: context.read<GeneralCubit>().islight == true
              ? const Color(0xffEBEFF3)
              : AppColorDark.recommendedItemColor,
          borderRadius: BorderRadius.circular(15),
        ),
        width: double.infinity,
        // height: 200.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Row(
                children: [
                  TextItem(
                    text: "order_number".tr(),
                    textSize: 14.sp,
                    // fontWeight: FontWeight.w600,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const OrderNumberView(
                                  text: "Delivered",
                                  textColor: AppColorLight.textColorGereen,
                                )),
                      );
                    },
                    child: TextItem(
                      text: "details".tr(),
                      textSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: context.read<GeneralCubit>().islight == true
                          ? AppColorLight.textHintColor
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: TextItem(
                text: "date".tr(),
                textSize: 14.sp,
                // fontWeight: FontWeight.w400,
                color: context.read<GeneralCubit>().islight == true
                    ? AppColorLight.textHintColor
                    : Colors.white,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Row(
                children: [
                  TextItem(
                    text: "sar".tr(),
                    textSize: 14.sp,
                    color: context.read<GeneralCubit>().islight == true
                        ? AppColorLight.textHintColor
                        : Colors.white,
                    // fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  TextItem(
                    text: "220 ",
                    textSize: 14.sp,
                    color: AppColorLight.textRedColor,
                    // fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.0.w,
              ),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: TextItem(
                      text: "delivered".tr(),
                      color: AppColorLight.textColorGereen,
                      // fontWeight: FontWeight.w600,
                      textSize: 12.sp,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: ButtonItem(
                      borderRadius: 10,
                      height: 35.h,
                      buttonWidth: 150.w,
                      onPressed: () {},
                      text: "repeat_order_again".tr(),
                      textSize: 12.0.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
