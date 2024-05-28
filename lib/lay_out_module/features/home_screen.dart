import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpapper/core/general_cubit/cubit/general_cubit.dart';
import 'package:wallpapper/core/services/services_locator.dart';
import 'package:wallpapper/core/themes/app_colors/app_colors_light.dart';
import '../../shared/custom_appbar.dart';
import '../../shared/textItem.dart';
import '../../shared/text_field_item.dart';
import '../component/category_item.dart';
import '../../shared/drawer.dart';
import '../component/recommended_item.dart';
import '../cubit/lay_out_cubit.dart';
import 'recommended_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String id = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<LayOutCubit>()
        ..getCategory()
        ..getRecommended(),
      child: BlocConsumer<LayOutCubit, LayOutState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = LayOutCubit.get(context);

          return Scaffold(
            drawer: DrawerWidget(),
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.r,
                            vertical: 8.0.r,
                          ),
                          child: CustomAppBar(
                            title: "Logo here",
                            textColor: AppColorLight.primaryColor,
                            leading: Builder(
                              builder: (BuildContext context) {
                                return IconButton(
                                  icon: SvgPicture.asset(
                                    "assets/images/Button Menu.svg",
                                    // ignore: deprecated_member_use
                                    color:
                                        context.read<GeneralCubit>().islight ==
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
                              onPressed: () {
                                // context.read<GeneralCubit>().changeTeme();
                              },
                              child: Text(
                                ''.tr(),
                              ),
                            ),
                            padding: 0.0,
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0.r),
                          child: TextItem(
                            text: 'hello_babe'.tr(),
                            textSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: context.read<GeneralCubit>().islight == true
                                ? AppColorLight.textHintColor
                                : Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0.r),
                          child: TextItem(
                            text: 'please_call_me_now'.tr(),
                            textSize: 24,
                            fontWeight: FontWeight.w900,
                            color: AppColorLight.primaryColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0.r),
                          child: TextFieldItem(
                            hintText: "search".tr(),
                            hintColor:
                                context.read<GeneralCubit>().islight == true
                                    ? AppColorLight.textHintColor
                                    : Colors.white,
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/images/ionoptions.svg',
                                color:
                                    context.read<GeneralCubit>().islight == true
                                        ? null
                                        : Colors.white,
                              ),
                            ),
                            prefixIcon: IconButton(
                              icon: SvgPicture.asset(
                                "assets/images/ionsearch-outline.svg",
                                color:
                                    context.read<GeneralCubit>().islight == true
                                        ? null
                                        : Colors.white,
                              ),
                              onPressed: () {},
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
                    padding: EdgeInsets.only(
                      left: 14.0.w,
                      right: 10.0.w,
                      top: 16.0.h,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: SizedBox(
                        height: 95.h,
                        child: state is CategoryStateLoading ||
                                state is RecommendedStateLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppColorLight.primaryColor,
                                ),
                              )
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    cubit.categoryModel?.data.length ?? 5,
                                itemBuilder: (context, index) {
                                  return CategoryItem(
                                    index: index,
                                  );
                                },
                              ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(
                      left: 25.0.r,
                      right: 10.0.r,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextItem(
                            text: "recommended".tr(),
                            textSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(
                              15.0,
                            ),
                            color: Colors
                                .transparent, // Set the background color of the button
                            child: InkWell(
                              focusColor: Colors.transparent,
                              highlightColor: Colors.red,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RecommendedListView()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    TextItem(
                                      text: "see_all".tr(),
                                      color: AppColorLight.allColor,
                                      textSize: 14,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16.0,
                                      color: AppColorLight.allColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  state is CategoryStateLoading ||
                          state is RecommendedStateLoading
                      ? const SliverToBoxAdapter(
                          child: Center(
                            heightFactor: 10.0,
                            child: CircularProgressIndicator(
                              color: AppColorLight.primaryColor,
                            ),
                          ),
                        )
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              cubit.index = index;

                              return RecommendedItem(
                                model: cubit.recommendedModel?.data[index],
                              );
                            },
                            childCount: 5,
                          ),
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
