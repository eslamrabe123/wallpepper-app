import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpapper/lay_out_module/cubit/lay_out_cubit.dart';
import 'package:wallpapper/shared/textItem.dart';
import '../../core/helper/my_loading.dart';
import '../../core/services/services_locator.dart';
import '../../core/themes/color_themes.dart';

class OrderDetails extends StatelessWidget {
  final int index;

  const OrderDetails({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<LayOutCubit>()..getRecommended(),
      child: Scaffold(
        body: OrderDetailContent(
          index: index,
        ),
      ),
    );
  }
}

class OrderDetailContent extends StatelessWidget {
  const OrderDetailContent({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayOutCubit, LayOutState>(
      builder: (context, state) {
        final cubit = LayOutCubit.get(context);
        return state is RecommendedStateLoading
            ? const Center(child: CircularProgressIndicator())
            : CustomScrollView(
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
                    cubit.recommendedModel?.data[index].avatar ?? "",
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 15.h,
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
                        width: 70,
                        height: 40,
                        padding: const EdgeInsets.symmetric(
                          vertical: 2.0,
                          horizontal: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primiry,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(
                          child: TextItem(
                            text: cubit.recommendedModel?.data[index].category
                                    ?.name ??
                                "",
                            textSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0.h),
                      Row(
                        children: [
                          SizedBox(
                            width: 250.w,
                            child: TextItem(
                              text: cubit.recommendedModel?.data[index].name ??
                                  "",
                              textSize: 30,
                              maxLine: 2,
                              color: const Color(0xff40484E),
                            ),
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const TextItem(
                                    text: "SAR ",
                                    color: Color(0xff777777),
                                    textSize: 16,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  TextItem(
                                    text: cubit.recommendedModel?.data[index]
                                            .price ??
                                        "",
                                    textSize: 30,
                                    color: const Color(0xffDD1117),
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
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  TextItem(
                                    text: cubit
                                            .recommendedModel?.data[index].time
                                            .toString() ??
                                        "",
                                    textSize: 16,
                                    color: const Color(0xff959FA8),
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
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(12.0.r),
                child: TextItem(
                    textSize: 14,
                    textAlign: TextAlign.center,
                    color: const Color(0xff959FA8),
                    text:
                        cubit.recommendedModel?.data[index].description ?? ""),
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
                  Expanded(
                    child: Container(
                      width: 190,
                      decoration: BoxDecoration(
                        color: const Color(0xffEBEFF3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              cubit.minas();
                            },
                            child: const TextItem(
                              text: "ــ",
                              fontWeight: FontWeight.w700,
                              textSize: 24,
                            ),
                          ),
                          TextItem(
                            text: cubit.x.toString(),
                            fontWeight: FontWeight.w700,
                            textSize: 24,
                          ),
                          TextButton(
                            onPressed: () {
                              cubit.add();
                            },
                            child: const TextItem(
                              text: "+",
                              fontWeight: FontWeight.w700,
                              textSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: Container(
                      width: 190,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.buttonColor,
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
                              const TextItem(
                                textAlign: TextAlign.center,
                                text: "Add to cart",
                                color: Colors.white,
                                textSize: 16,
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
        );
      },
    );
  }
}
