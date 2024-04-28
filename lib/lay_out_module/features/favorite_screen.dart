import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpapper/core/services/services_locator.dart';
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
      create: (context) => serviceLocator<LayOutCubit>()..getFavorite()..getRecommended(),
      child: BlocConsumer<LayOutCubit, LayOutState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = LayOutCubit.get(context);

          return Scaffold(
            drawer: DrawerWidget(),
            body:state is GetFavoriteStateLoading ||
                state is RecommendedStateLoading
                ? const Center(child: CircularProgressIndicator())
                : SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomAppBar(
                          title: "Favorites",
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
                            child: SvgPicture.asset("assets/images/Cart.svg"),
                          ),
                          padding: 0.0,
                        ),

                      ],
                    ),
                  ),

                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
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
