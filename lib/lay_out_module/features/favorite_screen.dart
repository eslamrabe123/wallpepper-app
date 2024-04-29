import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpapper/core/services/services_locator.dart';
import 'package:wallpapper/shared/textItem.dart';
import '../../core/general_cubit/cubit/general_cubit.dart';
import '../../core/themes/app_colors/app_colors_light.dart';
import '../../shared/custom_appbar.dart';
import '../../shared/drawer.dart';
import '../component/favorits_component.dart';
import '../cubit/lay_out_cubit.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  static String id = "FavoriteScreen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<LayOutCubit>()
        ..getFavorite()
        ..getRecommended(),
      child: BlocConsumer<LayOutCubit, LayOutState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = LayOutCubit.get(context);

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
                                  title: "favorites".tr(),
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
                                      "assets/images/Cart.svg",
                                    ),
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
                              // ignore: unnecessary_null_comparison
                              return FavoritesComponent(
                                index: index,
                              );
                            },
                            childCount: cubit.getFavoritesModel?.data.length,
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
