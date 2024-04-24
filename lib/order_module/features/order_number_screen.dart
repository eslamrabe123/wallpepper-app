import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpapper/core/services/services_locator.dart';
import 'package:wallpapper/order_module/cubit/order_cubit.dart';
import 'package:wallpapper/shared/textItem.dart';
import '../../core/themes/color_themes.dart';
import '../../shared/custom_appbar.dart';

class OrderNumberView extends StatelessWidget {
  const OrderNumberView({super.key});

  static String id = "OrderNumberView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<OrderCubit>()..getOrderConfig(),
      child: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = OrderCubit.get(context);

          return Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 10.h,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        CustomAppBar(
                          title: "Order number",
                          textSize: 20,
                          textColor: const Color(0xff40484E),
                          leading: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_ios)),
                          action: TextButton(
                            onPressed: () {},
                            child: SvgPicture.asset("assets/images/Option.svg"),
                          ),
                          padding: 0.0,
                        ),
                        const TextItem(
                          text: "#2323123",
                          textSize: 16,
                          color: Color(0xffCB0006),
                        ),
                        SizedBox(height: 25.h,),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print("index is ${index}");
                          },
                          child: FadeIn(
                            duration: const Duration(milliseconds: 500),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0.r, vertical: 8.0.r),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: const DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              "https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbGlmZW9mcGl4MDAwMDEtaW1hZ2VfMS1renhsdXd3ci5wbmc.png",
                                            ),
                                          )),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          width: 100,
                                          child: TextItem(
                                            text: "burger",
                                            color: Color(0xff40484E),
                                            textSize: 18,
                                            overflow: TextOverflow.ellipsis,
                                            maxLine: 1,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                                "assets/images/alarm_icon.svg"),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            const TextItem(
                                              text: " 65 min",
                                              color: Color(0xff959FA8),
                                              fontWeight: FontWeight.w600,
                                              textSize: 14,
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const TextItem(
                                              text: "SAR ",
                                              color: Color(0xff777777),
                                              textSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            const TextItem(
                                              text: "price ",
                                              color: Color(0xffCB0006),
                                              fontWeight: FontWeight.w700,
                                              textSize: 18,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.only(right: 25.0.r),
                                          child: GestureDetector(
                                            child: SvgPicture.asset(
                                              "assets/images/iontrash.svg",
                                            ),
                                            onTap: () {},
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                cubit.minas();
                                              },
                                              child: const TextItem(
                                                text: "ــ",
                                                textSize: 14,
                                                color: Color(0xffFC4747),
                                              ),
                                            ),
                                            TextItem(
                                              text: cubit.x.toString(),
                                              textSize: 14,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                cubit.add();
                                              },
                                              child: const TextItem(
                                                text: "+",
                                                textSize: 14,
                                                color: Color(0xffFC4747),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: 7,
                    ),
                  ),
                  SliverPadding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0.r, vertical: 12),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Row(
                            children: [
                              TextItem(
                                text: "Sub Total",
                                color: AppColors.textColor,
                                textSize: 14,
                              ),
                              Spacer(),
                              TextItem(
                                text: "\$ 21.14",
                                color: AppColors.textColor,
                                textSize: 14,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              const TextItem(
                                text: "Tax",
                                color: AppColors.textColor,
                                textSize: 14,
                              ),
                              const Spacer(),
                              TextItem(
                                text: cubit.orderConfigModel?.data.tax ?? '',
                                color: AppColors.textColor,
                                textSize: 14,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              const TextItem(
                                text: "Delivery Fee",
                                color: AppColors.textColor,
                                textSize: 14,
                              ),
                              const Spacer(),
                              TextItem(
                                text:
                                    "\$  ${cubit.orderConfigModel?.data.deliveryFee ?? ''}",
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
                                text: "Total",
                                color: AppColors.textColor,
                                textSize: 18,
                              ),
                              Spacer(),
                              TextItem(
                                text: "\$  24.64",
                                color: AppColors.textColor,
                                textSize: 18,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          const TextItem(
                            text: "Delivered",
                            textSize: 14,
                            color: AppColors.textColorGreen,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
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
