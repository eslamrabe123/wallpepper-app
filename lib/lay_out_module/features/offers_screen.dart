import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpapper/core/services/services_locator.dart';
import '../../shared/custom_appbar.dart';
import '../../shared/drawer.dart';
import '../cubit/lay_out_cubit.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  static String id = "OffersScreen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<LayOutCubit>()..getOffers(),
      child: BlocConsumer<LayOutCubit, LayOutState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = LayOutCubit.get(context);
          if (state is GetOffersStateLoading) {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          } else if (state is GetOffersStateSuccess) {
            return Scaffold(
              drawer: const DrawerWidget(),
              body: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: CustomAppBar(
                              title: "Offers",
                              textSize: 20.0.sp,
                              textColor: const Color(0xFF000000),
                              leading: Builder(
                                builder: (BuildContext context) {
                                  return IconButton(
                                    icon: SvgPicture.asset(
                                      "assets/images/Button Menu.svg",
                                    ),
                                    onPressed: () {
                                      Scaffold.of(context).openDrawer();
                                    },
                                  );
                                },
                              ),
                              action: TextButton(
                                onPressed: () {},
                                child:
                                    SvgPicture.asset("assets/images/Cart.svg"),
                              ),
                              padding: 0.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0.r, vertical: 16.0.r),
                            child: Container(
                              height: 300,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  // color: Colors.greenAccent,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      cubit.offersModel?.data[index].image ??
                                          '',
                                    ),
                                    fit: BoxFit.fill,
                                  )),
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        "assets/images/Group 15.svg",
                                        width: 50.w,
                                        height: 50.h,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: cubit.offersModel?.data.length,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is GetFavoriteStateError) {
            return Scaffold(
              body: Center(
                child: Text(cubit.offersModel?.status.toString() ?? "Error"),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
