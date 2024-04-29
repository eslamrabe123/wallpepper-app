import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpapper/core/general_cubit/cubit/general_cubit.dart';
import 'package:wallpapper/core/services/services_locator.dart';
import 'package:wallpapper/core/themes/app_colors/app_colors_light.dart';
import 'package:wallpapper/order_module/cubit/order_cubit.dart';
import 'package:wallpapper/order_module/features/check_out_screen.dart';
import 'package:wallpapper/shared/textItem.dart';
import '../../shared/custom_appbar.dart';
import '../component/order_item.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  static String id = "MyOrderView";

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<OrderCubit>()..getOrderConfig(),
      child: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = OrderCubit.get(context);
          String deliveryFee = cubit.orderConfigModel?.data.deliveryFee ?? "";
          String tax = cubit.orderConfigModel?.data.tax ?? "";

          // int inTax = int.parse(tax);
          // int intDeliveryFee = int.parse(deliveryFee);

          return CupertinoPageScaffold(
            child: state is OrderConfigStateLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColorLight.primaryColor,
                    ),
                  )
                : SafeArea(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 10.h,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 12,
                            ),
                            child: CustomAppBar(
                              title: "my_orders".tr(),
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
                                  // ignore: deprecated_member_use
                                  color: context.read<GeneralCubit>().islight ==
                                          true
                                      ? null
                                      : Colors.white,
                                ),
                              ),
                              padding: 0.0,
                            ),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0.r, vertical: 12),
                          sliver: SliverToBoxAdapter(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    TextItem(
                                      text: "tax".tr(),
                                      textSize: 14,
                                    ),
                                    const Spacer(),
                                    TextItem(
                                      text: "\$ $tax",
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
                                      text: "Delivery Free",
                                      textSize: 14,
                                    ),
                                    const Spacer(),
                                    TextItem(
                                      text: "\$ $deliveryFee",
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
                                Row(
                                  children: [
                                    TextItem(
                                      fontWeight: FontWeight.bold,
                                      text: "total".tr(),
                                      textSize: 18,
                                    ),
                                    const Spacer(),
                                    const TextItem(
                                      fontWeight: FontWeight.bold,
                                      text: "\$ 36",
                                      color: AppColorLight.primaryColor,
                                      textSize: 18,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => CheckOutView(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: AppColorLight.buttomColor,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      children: [
                                        const Spacer(
                                          flex: 10,
                                        ),
                                        const TextItem(
                                          textAlign: TextAlign.center,
                                          text: "Checkout",
                                          color: Colors.white,
                                          textSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        const Spacer(
                                          flex: 1,
                                        ),
                                        SvgPicture.asset(
                                          "assets/images/checkout_icon.svg",
                                        ),
                                        const Spacer(
                                          flex: 10,
                                        ),
                                      ],
                                    ),
                                  ),
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
