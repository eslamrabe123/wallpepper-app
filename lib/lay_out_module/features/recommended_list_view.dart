import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpapper/core/services/services_locator.dart';
import 'package:wallpapper/core/themes/app_colors/app_colors_light.dart';
import 'package:wallpapper/shared/textItem.dart';
import '../../shared/custom_appbar.dart';
import '../../shared/text_field_item.dart';
import '../cubit/lay_out_cubit.dart';
import '../component/recommended_item.dart';
import 'list-view.dart';

class RecommendedListView extends StatelessWidget {
  const RecommendedListView({super.key});

  static String id = "RecommendedListView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<LayOutCubit>()..getRecommended(),
      child: BlocConsumer<LayOutCubit, LayOutState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = LayOutCubit.get(context);
          String items = "items".tr();

          return Scaffold(
            body: state is RecommendedStateLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColorLight.primaryColor,
                  ))
                : SafeArea(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.r,
                                  vertical: 8.0.r,
                                ),
                                child: CustomAppBar(
                                  title: "",
                                  leading: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.arrow_back_ios)),
                                  action: TextButton(
                                    onPressed: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             const RecListViewScreen()));
                                    },
                                    child: SvgPicture.asset(
                                        "assets/images/Cart.svg"),
                                  ),
                                  padding: 0.0,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 18.0.r),
                                child: TextFieldItem(
                                  hintText: "search".tr(),
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                        'assets/images/ionoptions.svg'),
                                  ),
                                  prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.search),
                                  ),
                                  onChange: (v) {},
                                  isPassword: false,
                                  validate: (v) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0.r, vertical: 8.0.r),
                          sliver: SliverToBoxAdapter(
                              child: Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              TextItem(
                                text: "all".tr(),
                                color: AppColorLight.allColor,
                                textSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              TextItem(
                                text:
                                    "( ${cubit.recommendedModel?.data.length} $items )",
                                color: AppColorLight.itemsColor,
                                textSize: 14,
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: SvgPicture.asset(
                                  'assets/images/ionswap-vertical-outline.svg',
                                ),
                              ),
                            ],
                          )),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return RecommendedItem(
                                nweIndex: index,
                                index: index,
                              );
                            },
                            childCount: cubit.recommendedModel?.data.length,
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
