import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpapper/core/services/services_locator.dart';
import '../../core/general_cubit/cubit/general_cubit.dart';
import '../../core/themes/app_colors/app_colors_light.dart';
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
                body: Center(
                    child: CircularProgressIndicator(
              color: AppColorLight.primaryColor,
            )));
          } else if (state is GetOffersStateSuccess) {
            return Scaffold(
              drawer: DrawerWidget(),
              body: state is GetFavoriteStateLoading ||
                      state is RecommendedStateLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColorLight.primaryColor,
                      ),
                    )
                  : SafeArea(
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20.0,
                                    left: 10.0,
                                    right: 10.0,
                                    bottom: 10.0,
                                  ),
                                  child: CustomAppBar(
                                    title: "offers".tr(),
                                    textSize: 20.0.sp,
                                    textColor:
                                        context.read<GeneralCubit>().islight ==
                                                true
                                            ? AppColorLight.textMainColor
                                            : Colors.white,
                                    leading: Builder(
                                      builder: (BuildContext context) {
                                        return IconButton(
                                          icon: SvgPicture.asset(
                                            "assets/images/Button Menu.svg",
                                            color: context
                                                        .read<GeneralCubit>()
                                                        .islight ==
                                                    true
                                                ? AppColorLight.textMainColor
                                                : Colors.white,
                                          ),
                                          onPressed: () {
                                            Scaffold.of(context).openDrawer();
                                          },
                                        );
                                      },
                                    ),
                                    action: TextButton(
                                      onPressed: () {},
                                      child: SvgPicture.asset(
                                          "assets/images/Cart.svg"),
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
                                  padding: EdgeInsets.only(
                                    top: 21.r,
                                    left: 19.r,
                                    right: 19.r,
                                    bottom: 21.r,
                                  ),
                                  child: Container(
                                    height: 397,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        // color: Colors.greenAccent,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            cubit.offersModel?.data[index]
                                                    .image ??
                                                '',
                                          ),
                                          fit: BoxFit.fill,
                                        )),
                                    child: Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            right: 16.r,
                                            bottom: 26.7.r,
                                          ),
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
