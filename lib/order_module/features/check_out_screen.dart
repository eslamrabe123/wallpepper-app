import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpapper/core/general_cubit/cubit/general_cubit.dart';
import 'package:wallpapper/core/services/services_locator.dart';
import 'package:wallpapper/core/themes/app_colors/app_colors_dark.dart';
import 'package:wallpapper/core/themes/app_colors/app_colors_light.dart';
import 'package:wallpapper/order_module/cubit/order_cubit.dart';
import 'package:wallpapper/shared/button_item.dart';
import 'package:wallpapper/shared/textItem.dart';
import 'package:wallpapper/shared/text_field_item.dart';

import '../../shared/custom_appbar.dart';
import '../domain/model/payment_model.dart';

// ignore: must_be_immutable
class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  TextEditingController voucherController = TextEditingController();

  List<PaymentModel> paymentList = [
    PaymentModel(
      name: "Cash",
      url: "assets/images/ioncash.svg",
    ),
    PaymentModel(
      name: "Master",
      url: "assets/images/58482354cef1014c0b5e49c0 1.svg",
    ),
    PaymentModel(
      name: "Mada",
      url: "assets/images/mada.svg",
    ),
    PaymentModel(
      name: "Visa",
      url: "assets/images/Layer 1 copy.svg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<OrderCubit>(),
      child: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = OrderCubit.get(context);
          double total = 24.6;

          return Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  // SliverAppBar(
                  //   pinned: true,
                  //   backgroundColor: Colors.transparent,
                  //   centerTitle: true,
                  //   title: TextItem(
                  //     text: "Check Out",
                  //     textSize: 20.sp,
                  //   ),
                  //   leading: IconButton(
                  //     onPressed: () {
                  //       Navigator.pop(context);
                  //     },
                  //     icon: const Icon(
                  //       Icons.arrow_back_ios_new,
                  //     ),
                  //   ),
                  //   actions: [
                  //     IconButton(
                  //       onPressed: () {},
                  //       icon: SvgPicture.asset(
                  //         "assets/images/Option.svg",
                  //         // ignore: deprecated_member_use
                  //         color: context.read<GeneralCubit>().islight == true
                  //             ? null
                  //             : Colors.white,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 10.h,
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 8.h,
                    ),
                    sliver: SliverToBoxAdapter(
                        child: CustomAppBar(
                      title: "Check Out",
                      textSize: 20.sp,
                      leading: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                        ),
                      ),
                      action: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/images/Option.svg",
                          // ignore: deprecated_member_use
                          color: context.read<GeneralCubit>().islight == true
                              ? null
                              : Colors.white,
                        ),
                      ),
                    )),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 8.h,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.only(
                            right: 10.w, left: 16.w, top: 10.h, bottom: 10.h),
                        height: 150.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                          color: context.read<GeneralCubit>().islight == true
                              ? const Color(0xffEBEFF3)
                              : AppColorDark.recommendedItemColor,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                TextItem(
                                  text: "Dine in",
                                  textSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                const Spacer(),
                                TextButton(
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/images/ioncreate-outline.svg",
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        TextItem(
                                          text: "Edit",
                                          color: const Color(0xffFC4747),
                                          textSize: 14.sp,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/ionlocation.svg",
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                TextItem(
                                  text: " Dhaka, Bangladesh, Chittagon",
                                  textSize: 16.sp,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/iontime.svg",
                                  width: 15.w,
                                  height: 15.h,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                TextItem(
                                  text: " 30 min",
                                  textSize: 16.sp,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 8.h,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: TextFieldItem(
                        controller: voucherController,
                        lableColor: context.read<GeneralCubit>().islight == true
                            ? AppColorLight.textMainColor
                            : Colors.white,
                        fillColor: Colors.transparent,
                        suffixIcon: IconButton(
                          onPressed: () {
                            print(voucherController.text.trim());
                            voucherController.text.isNotEmpty
                                ? cubit.isDisc = true
                                : cubit.isDisc = false;
                            cubit.showToast();


                            setState(() {});
                            print(total);
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: context.read<GeneralCubit>().islight == true
                                ? AppColorLight.textMainColor
                                : Colors.white,
                          ),
                        ),
                        enableBorderSide: BorderSide(
                          color: context.read<GeneralCubit>().islight == true
                              ? const Color(0xffC0CDD7)
                              : Colors.white,
                        ),
                        keyBordType: TextInputType.number,
                        hintText: "Input Voucher",
                        hintColor: context.read<GeneralCubit>().islight == true
                            ? AppColorLight.textHintColor
                            : Colors.white,
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 6.h, horizontal: 6.w),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/Group 59.svg",
                                  width: 50.w,
                                  height: 50.h,
                                ),
                                SvgPicture.asset(
                                  "assets/images/ionticket.svg",
                                  width: 30.w,
                                  height: 30.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                        validate: (data) {},
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(
                        right: 20.w, left: 22.w, top: 35.h, bottom: 10.h),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextItem(
                            text: "Payment details",
                            textSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            children: [
                              TextItem(
                                text: "Sub Total",
                                textSize: 14.sp,
                              ),
                              const Spacer(),
                              TextItem(
                                text: 'SAR',
                                color: AppColorLight.textHintColor,
                                textSize: 14.sp,
                              ),
                              TextItem(
                                text: " 21.14",
                                textSize: 14.sp,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              TextItem(
                                text: "VAT",
                                textSize: 14.sp,
                              ),
                              const Spacer(),
                              TextItem(
                                text: 'SAR',
                                color: AppColorLight.textHintColor,
                                textSize: 14.sp,
                              ),
                              TextItem(
                                text: ' 2.00',
                                textSize: 14.sp,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          cubit.isDisc == false ? const SizedBox.shrink() : Row(
                            children: [
                              TextItem(
                                text: "Discount",
                                textSize: 14.sp,
                                color: AppColorLight.textColorGereen,
                              ),
                              const Spacer(),

                              TextItem(
                                text: '50',
                                textSize: 14.sp,
                                color: AppColorLight.textColorGereen,

                              ),
                              SizedBox(width: 3.w,),
                              TextItem(
                                text: '%',
                                color: AppColorLight.textColorGereen,
                                textSize: 14.sp,
                              ),
                            ],
                          ),
                          const Divider(),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              TextItem(
                                text: "Total Pay",
                                textSize: 18.sp,
                              ),
                              const Spacer(),
                              TextItem(
                                text: 'SAR',
                                color: AppColorLight.textHintColor,
                                textSize: 14.sp,
                              ),

                             cubit.isDisc == false ?  TextItem(
                                text:  ' $total',
                                textSize: 18.sp,
                              ): Column(
                               children: [
                                 TextItem(
                                   text:  ' $total',
                                   textSize: 18.sp,
                                   color: AppColorLight.allColor,
                                   textDecoration: TextDecoration.lineThrough,
                                 ),
                                 TextItem(
                                   text:  ' ${total /2}',
                                   textSize: 18.sp,
                                 ),

                               ],
                             )
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          TextItem(
                            text: "Payment method",
                            textSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(
                      left: 20.0.w,
                      right: 20.0.w,
                      top: 16.0.h,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: SizedBox(
                        height: 100.h,
                        // color: Colors.grey,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            width: 15.w,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: paymentList.length,
                          itemBuilder: (context, index) {
                            return PaymentMethodItem(
                              paymentModel: paymentList[index],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(
                        left: 20.0.w, right: 20.0.w, top: 50.0.h, bottom: 50.h),
                    sliver: SliverToBoxAdapter(
                      child: ButtonItem(
                        onPressed: () {},
                        text: "Place Order",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.paymentModel,
  });

  final PaymentModel paymentModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 88.w,
        height: 88.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffC0CDD7),
          ),
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              paymentModel.url ?? '',
              width: 40.w,
              height: 25.h,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 5.h,
            ),
            TextItem(
              text: paymentModel.name ?? '',
              color: AppColorLight.textMainColor,
              textSize: 14.sp,
            ),
          ],
        ),
      ),
    );
  }
}
