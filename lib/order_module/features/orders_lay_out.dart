import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpapper/core/services/services_locator.dart';
import '../../core/themes/color_themes.dart';
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
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 2.3.w;
    double height = MediaQuery.of(context).size.height / 15.h;
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
              width: width,
              height: height,
              title: 'Completed',
              titleColor: cubit.type == 0 ? Colors.white : AppColors.textColor,
            ),
            TabBarItem(
              bottomLeft: cubit.type == 1 ? 10 : 0,
              topLeft: cubit.type == 1 ? 10 : 0,
              bottomRight: 10,
              topRight: 10,
              backgroundColor: cubit.type == 1
                  ? const Color(0xffCB0006)
                  : const Color(0xffEBEFF3),
              width: width,
              height: height,
              title: 'Pending',
              titleColor: cubit.type == 1 ? Colors.white : AppColors.textColor,
            ),
          ];
          return Scaffold(
            body: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomAppBar(
                    textColor: AppColors.textColor,
                    title: 'My Order',
                    textSize: 20,
                    leading: IconButton(
                      color: AppColors.textColor,
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        // Navigator.pushNamed(context, NotificationScreen.id);
                      },
                    ),
                    action: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/images/Option.svg",
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TabBar(
                    labelPadding: EdgeInsets.zero,
                    tabAlignment: TabAlignment.center,
                    onTap: (i) {
                      cubit.type = i;
                      cubit.switchWidgets();
                    },
                    controller: tabController,
                    dividerColor: Colors.white,
                    isScrollable: true,
                    indicatorColor: Colors.white,
                    tabs: tabs,
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
