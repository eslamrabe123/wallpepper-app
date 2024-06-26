import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpapper/lay_out_module/cubit/lay_out_cubit.dart';
import 'package:wallpapper/lay_out_module/domain/model/recommended_model.dart';
import 'package:wallpapper/shared/textItem.dart';
import '../../core/general_cubit/cubit/general_cubit.dart';
import '../../core/services/services_locator.dart';
import '../../core/themes/app_colors/app_colors_dark.dart';
import '../../core/themes/app_colors/app_colors_light.dart';

// ignore: must_be_immutable
class OrderDetails extends StatelessWidget {
  OrderDetails({super.key, required this.item});

  DishesModelDatum? item;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<LayOutCubit>()..getRecommended(),
      child: Scaffold(
        body: OrderDetailContent(
          // index: index,
          item: item,
        ),
      ),
    );
  }
}

class OrderDetailContent extends StatelessWidget {
  const OrderDetailContent({
    super.key,
    // required this.index,
    required this.item,
  });

  // final int index;
  final DishesModelDatum? item;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayOutCubit, LayOutState>(
      builder: (context, state) {
        final cubit = LayOutCubit.get(context);
        return SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/images/Cart.svg",
                      height: 50,
                      width: 50,
                    ),
                  )
                ],
                pinned: true,
                expandedHeight: 350.0.h,
                flexibleSpace: FlexibleSpaceBar(
                  background: FadeIn(
                    duration: const Duration(milliseconds: 500),
                    child: Image.network(
                      item?.avatar ?? "",
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 5.h,
                ),
              ),
              SliverToBoxAdapter(
                child: FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8.0),
                        Container(
                          width: 70.w,
                          height: 40.h,
                          padding: EdgeInsets.symmetric(
                            vertical: 2.0.r,
                            horizontal: 8.0.r,
                          ),
                          decoration: BoxDecoration(
                            color: AppColorLight.primaryColor,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Center(
                            child: TextItem(
                              text: item?.category?.name ?? "",
                              textSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0.h),
                        Row(
                          children: [
                            SizedBox(
                              // color: Colors.amber,
                              width: 150.w,
                              child: TextItem(
                                text: item?.name ?? "",
                                textSize: 30,
                                maxLine: 2,
                              ),
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextItem(
                                      text: "SAR ",
                                      color: context
                                                  .read<GeneralCubit>()
                                                  .islight ==
                                              true
                                          ? AppColorLight.sarColor
                                          : AppColorDark.sarColor,
                                      textSize: 16,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    TextItem(
                                      text: item?.price ?? "",
                                      textSize: 30,
                                      color: AppColorLight.textRedColor,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/alarm_icon.svg",
                                      width: 16,
                                      height: 15,
                                      color: context
                                                  .read<GeneralCubit>()
                                                  .islight ==
                                              true
                                          ? null
                                          : Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    TextItem(
                                      text: item?.time.toString() ?? "",
                                      textSize: 16,
                                      color: context
                                                  .read<GeneralCubit>()
                                                  .islight ==
                                              true
                                          ? AppColorLight.textHintColor
                                          : Colors.white,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Divider(
                  endIndent: 25.w,
                  indent: 25.w,
                  // color: Colors.white,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(12.0.r),
                  child: TextItem(
                      textSize: 14,
                      textAlign: TextAlign.center,
                      color: context.read<GeneralCubit>().islight == true
                          ? AppColorLight.textHintColor
                          : Colors.white,
                      text: item?.description ?? ""),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 70.h,
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.all(12.0.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                        color: const Color(0xffEBEFF3),
                        borderRadius: BorderRadius.circular(15.w),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              if (cubit.x > 0) {
                                cubit.minas();
                              } else {
                                null;
                              }
                            },
                            child: const TextItem(
                              text: "-",
                              fontWeight: FontWeight.w700,
                              color: AppColorLight.textBackColor,
                              textSize: 30,
                            ),
                          ),
                          TextItem(
                            text: cubit.x.toString(),
                            fontWeight: FontWeight.w700,
                            textSize: 24,
                            color: AppColorLight.textBackColor,
                          ),
                          TextButton(
                            onPressed: () {
                              cubit.add();
                            },
                            child: const TextItem(
                              text: "+",
                              fontWeight: FontWeight.w700,
                              color: AppColorLight.textBackColor,
                              textSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: Container(
                        height: 56.h,
                        decoration: BoxDecoration(
                          color: AppColorLight.buttomColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                const Spacer(
                                  flex: 2,
                                ),
                                TextItem(
                                  textAlign: TextAlign.center,
                                  text: "Add to cart",
                                  color: Colors.white,
                                  textSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                                SvgPicture.asset(
                                    "assets/images/ionbag-handle-outline.svg"),
                                const Spacer(
                                  flex: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 15.h,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
