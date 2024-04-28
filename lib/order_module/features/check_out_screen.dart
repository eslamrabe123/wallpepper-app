import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpapper/core/themes/color_themes.dart';
import 'package:wallpapper/shared/button_item.dart';
import 'package:wallpapper/shared/custom_appbar.dart';
import 'package:wallpapper/shared/textItem.dart';

import '../domain/model/payment_model.dart';

class CheckOutView extends StatelessWidget {
  CheckOutView({super.key});

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
      url: "assets/images/Image 1.svg",
    ),
    PaymentModel(
      name: "Visa",
      url: "assets/images/Layer 1 copy.svg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.r,
                vertical: 8.r,
              ),
              sliver: SliverToBoxAdapter(
                  child: CustomAppBar(
                title: "Check Out",
                textSize: 20,
                textColor: const Color(0xff40484E),
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                  ),
                ),
                action: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/images/Option.svg"),
                ),
              )),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.r,
                vertical: 8.r,
              ),
              sliver: SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.only(
                      right: 10.r, left: 16.r, top: 10.r, bottom: 10.r),
                  height: 150.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    color: Color(0xffEBEFF3),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const TextItem(
                            text: "Dine in",
                            textSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff40484E),
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
                                  const TextItem(
                                    text: "Edit",
                                    color: Color(0xffFC4747),
                                    textSize: 14,
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
                          const TextItem(
                            text: " Dhaka, Bangladesh, Chittagon",
                            textSize: 16,
                            color: Color(0xff40484E),
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
                            "assets/images/alarm_icon.svg",
                            width: 15,
                            height: 15,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          const TextItem(
                            text: " 30 min",
                            textSize: 16,
                            color: Color(0xff40484E),
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
                horizontal: 20.r,
                vertical: 8.r,
              ),
              sliver: SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.only(
                      right: 10.r, left: 16.r, top: 10.r, bottom: 10.r),
                  height: 80.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffC0CDD7)),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Row(
                    children: [
                      Stack(
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
                      SizedBox(
                        width: 15.w,
                      ),
                      const TextItem(
                        text: " Input Voucher",
                        fontWeight: FontWeight.w600,
                        textSize: 14,
                        color: Color(0xff40484E),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                  right: 20.r, left: 22.r, top: 35.r, bottom: 10.r),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextItem(
                      text: "Payment details",
                      textSize: 18,
                      color: Color(0xff40484E),
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    const Row(
                      children: [
                        TextItem(
                          text: "Sub Total",
                          color: AppColors.textColor,
                          textSize: 14,
                        ),
                        Spacer(),
                        TextItem(
                          text: "SAR 21.14",
                          color: AppColors.textColor,
                          textSize: 14,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Row(
                      children: [
                        TextItem(
                          text: "VAT",
                          color: AppColors.textColor,
                          textSize: 14,
                        ),
                        Spacer(),
                        TextItem(
                          text: 'SAR 2.00' ?? '',
                          color: AppColors.textColor,
                          textSize: 14,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Row(
                      children: [
                        TextItem(
                          text: "Total Pay",
                          color: AppColors.textColor,
                          textSize: 18,
                        ),
                        Spacer(),
                        TextItem(
                          text: "SAR 24.64",
                          color: AppColors.textColor,
                          textSize: 18,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    const TextItem(
                      text: "Payment method",
                      textSize: 18,
                      color: Color(0xff40484E),
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                left: 20.0.r,
                right: 20.0.r,
                top: 16.0.r,
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
                  left: 20.0.r, right: 20.0.r, top: 50.0.r, bottom: 50.r),
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
        width: 100.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffC0CDD7),
          ),
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              paymentModel.url ?? '',
              width: 35.w,
              height: 35.h,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 5.h,
            ),
            TextItem(
              text: paymentModel.name ?? '',
              color: const Color(0xff40484E),
              textSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}
