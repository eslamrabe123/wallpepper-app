import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpapper/core/general_cubit/cubit/general_cubit.dart';
import 'package:wallpapper/core/themes/app_colors/app_colors_dark.dart';
import 'package:wallpapper/core/themes/app_colors/app_colors_light.dart';
import 'package:wallpapper/shared/textItem.dart';

import '../cubit/lay_out_cubit.dart';
import '../domain/model/recommended_model.dart';
import '../features/oder_details.dart';

// ignore: must_be_immutable
class RecommendedItem extends StatefulWidget {
  RecommendedItem({
    super.key,
    // required this.index,
    required this.model,
    // required this.nweIndex,
  });

  // final int index;
  // final int nweIndex;
  bool isLike = false;
  DishesModelDatum? model;

  @override
  State<RecommendedItem> createState() => _RecommendedItemState();
}

class _RecommendedItemState extends State<RecommendedItem> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayOutCubit, LayOutState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = LayOutCubit.get(context);

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderDetails(
                  // index: widget.index,
                  item: widget.model,
                  // cubit.recommendedModel?.data[widget.index],
                ),
              ),
            );
          },
          child: FadeIn(
            duration: const Duration(milliseconds: 100),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    context.read<GeneralCubit>().islight == true
                        ? const BoxShadow(
                            color: Color(0x15748694),
                            spreadRadius: 0,
                            blurRadius: 58,
                            offset: Offset(0, 3),
                          )
                        : const BoxShadow(
                            color: Color.fromARGB(20, 180, 186, 190),
                            spreadRadius: 0,
                            blurRadius: 15,
                            offset: Offset(0, 3),
                          ),
                  ],
                  color: context.read<GeneralCubit>().islight == true
                      ? Colors.white
                      : AppColorDark.recommendedItemColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 18.0.w),
                          child: Container(
                            width: 100.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                                // color: Colors.amber,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    widget.model?.avatar ?? "",
                                  ),
                                )),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150.w,
                              child: TextItem(
                                text: widget.model?.name ?? "",
                                textSize: 18.sp,
                                overflow: TextOverflow.ellipsis,
                                maxLine: 1,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/ionstar.svg",
                                  color: const Color(0xffFFD600),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                TextItem(
                                  text: widget.model?.rating.toString() ?? '',
                                  color: context.read<GeneralCubit>().islight ==
                                          false
                                      ? Colors.white
                                      : AppColorLight.textHintColor,
                                  fontWeight: FontWeight.w600,
                                  textSize: 14.sp,
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                SvgPicture.asset(
                                  "assets/images/alarm_icon.svg",
                                  color: context.read<GeneralCubit>().islight ==
                                          false
                                      ? Colors.white
                                      : null,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                TextItem(
                                  text: "${widget.model?.time.toString()} min",
                                  color: context.read<GeneralCubit>().islight ==
                                          false
                                      ? Colors.white
                                      : AppColorLight.textHintColor,
                                  fontWeight: FontWeight.w600,
                                  textSize: 14.sp,
                                )
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextItem(
                                  text: "SAR ",
                                  color: context.read<GeneralCubit>().islight ==
                                          true
                                      ? AppColorLight.sarColor
                                      : Colors.white,
                                  textSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                TextItem(
                                  text: "${widget.model?.price} ",
                                  color: AppColorLight.primaryColor,
                                  fontWeight: FontWeight.normal,
                                  textSize: 18.sp,
                                )
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 100.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              GestureDetector(
                                child: SvgPicture.asset(
                                  "assets/images/ionheart-circle.svg",
                                  color: widget.model?.isFav == true
                                      ? AppColorLight.favoriteIconColor
                                      : context.read<GeneralCubit>().islight ==
                                              true
                                          ? null
                                          : Colors.white,
                                ),
                                onTap: () async {
                                  await cubit.toggleFavorite(
                                    dishId: widget.model?.id,
                                  );
                                  // cubit.changeFavIconColor(index: widget.index);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
