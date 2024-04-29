import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpapper/core/general_cubit/cubit/general_cubit.dart';
import 'package:wallpapper/core/services/services_locator.dart';
import 'package:wallpapper/core/themes/app_colors/app_colors_light.dart';
import 'package:wallpapper/order_module/cubit/order_cubit.dart';
import 'package:wallpapper/shared/textItem.dart';
import '../../core/themes/app_colors/app_colors_dark.dart';
import '../../shared/custom_appbar.dart';
import '../component/order_item.dart';

class OrderNumberView extends StatelessWidget {
  const OrderNumberView(
      {super.key, required this.text, required this.textColor});

  static String id = "OrderNumberView";
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<OrderCubit>()..getOrderConfig(),
      child: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = OrderCubit.get(context);

          return Scaffold(
            backgroundColor: context.read<GeneralCubit>().islight == true
                ? AppColorLight.recommendedItemColor
                : AppColorDark.recommendedItemColor,
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
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0.r),
                          child: CustomAppBar(
                            title: "Order number",
                            textSize: 20,
                            leading: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back_ios)),
                            action: TextButton(
                              onPressed: () {},
                              child: SvgPicture.asset(
                                "assets/images/Option.svg",
                                color:
                                    context.read<GeneralCubit>().islight == true
                                        ? AppColorLight.recommendedItemColor
                                        : AppColorDark.recommendedItemColor,
                              ),
                            ),
                            padding: 0.0,
                          ),
                        ),
                        const TextItem(
                          text: "#1111111",
                          textSize: 16,
                          color: Color(0xffCB0006),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return OrderItem(
                          index: index,
                          model: cubit.itemModel[index],
                        );
                      },
                      childCount: cubit.itemModel.length,
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
                                textSize: 14,
                              ),
                              Spacer(),
                              TextItem(
                                text: "\$ 21.14",
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
                                textSize: 14,
                              ),
                              const Spacer(),
                              TextItem(
                                text: cubit.orderConfigModel?.data.tax ?? '',
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
                                textSize: 14,
                              ),
                              const Spacer(),
                              TextItem(
                                text:
                                    "\$ ${cubit.orderConfigModel?.data.deliveryFee ?? ''}",
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
                                textSize: 18,
                              ),
                              Spacer(),
                              TextItem(
                                text: "\$ 24.64",
                                color: AppColorLight.primaryColor,
                                textSize: 18,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          TextItem(
                            text: text,
                            textSize: 14.sp,
                            color: textColor,
                            fontWeight: FontWeight.w900,
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
