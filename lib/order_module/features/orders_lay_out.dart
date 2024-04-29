import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpapper/core/general_cubit/cubit/general_cubit.dart';
import 'package:wallpapper/core/services/services_locator.dart';
import '../../core/themes/app_colors/app_colors_light.dart';
import '../../shared/custom_appbar.dart';
import '../component/completed_orders-component.dart';
import '../component/pending_orders-component.dart';
import '../../shared/tap_bar_item.dart';
import '../cubit/order_cubit.dart';

class OrderLayOut extends StatefulWidget {
  static String id = 'OrderLayOut';

  const OrderLayOut({super.key});

  @override
  State<OrderLayOut> createState() => _SettingLayOut();
}

class _SettingLayOut extends State<OrderLayOut>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 2.4.w;
    double height = MediaQuery.of(context).size.height / 14.h;
    return BlocProvider(
      create: (context) => serviceLocator<OrderCubit>()
        ..completedOrders()
        ..pendingOrders(),
      child: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = OrderCubit.get(context);
          List<TabBarItem> tabs = [
            TabBarItem(
              bottomLeft: 10,
              topLeft: 10,
              bottomRight: cubit.type == 0 ? 10 : 0,
              topRight: cubit.type == 0 ? 10 : 0,
              backgroundColor: cubit.type == 0
                  ? const Color(0xffCB0006)
                  : const Color(0xffEBEFF3),
              width: width.w,
              height: height.h,
              title: 'completed'.tr(),
              titleColor:
                  cubit.type == 0 ? Colors.white : AppColorLight.textMainColor,
            ),
            TabBarItem(
              bottomLeft: cubit.type == 1 ? 10 : 0,
              topLeft: cubit.type == 1 ? 10 : 0,
              bottomRight: 10,
              topRight: 10,
              backgroundColor: cubit.type == 1
                  ? const Color(0xffCB0006)
                  : const Color(0xffEBEFF3),
              width: width.w,
              height: height.h,
              title: 'pending'.tr(),
              titleColor:
                  cubit.type == 1 ? Colors.white : AppColorLight.textMainColor,
            ),
          ];
          return CupertinoPageScaffold(
            child: state is CompletedOrdersStateLoading ||
                    state is PendingOrdersStateLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColorLight.primaryColor,
                    ),
                  )
                : DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomAppBar(
                          title: 'my_orders'.tr(),
                          textSize: 20.sp,
                          leading: IconButton(
                            color: context.read<GeneralCubit>().islight == true
                                ? AppColorLight.textMainColor
                                : Colors.white,
                            icon: const Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          action: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/images/Option.svg",
                              color:
                                  context.read<GeneralCubit>().islight == true
                                      ? AppColorLight.textMainColor
                                      : Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Stack(
                          children: [
                            Center(
                              child: Container(
                                height: height.h,
                                width: 50.w,
                                color: context.read<GeneralCubit>().islight
                                    ? const Color(0xffEBEFF3)
                                    : const Color(0xffEBEFF3),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: TabBar(
                                labelPadding: EdgeInsets.zero,
                                tabAlignment: TabAlignment.center,
                                onTap: (i) {
                                  cubit.type = i;
                                  cubit.switchWidgets();
                                },
                                controller: tabController,
                                dividerColor:
                                    context.read<GeneralCubit>().islight == true
                                        ? Colors.white
                                        : const Color.fromARGB(207, 24, 23, 23),
                                isScrollable: true,
                                indicator: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                tabs: tabs,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: tabController,
                            children: const [
                              CompletedOrdersComponent(),
                              PendingOrdersComponent(),
                            ],
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
