import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpapper/core/themes/app_colors/app_colors_dark.dart';
import 'package:wallpapper/shared/textItem.dart';

import '../../core/general_cubit/cubit/general_cubit.dart';
import '../../core/themes/app_colors/app_colors_light.dart';
import '../cubit/lay_out_cubit.dart';
import '../features/oder_details.dart';

class FavoritesComponent extends StatefulWidget {
  const FavoritesComponent({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<FavoritesComponent> createState() => _FavoritesComponentState();
}

class _FavoritesComponentState extends State<FavoritesComponent> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayOutCubit, LayOutState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = LayOutCubit.get(context);

        return state is GetFavoriteStateError
            ? TextItem(text: "somthing went wrong")
            : GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             OrderDetails(index: widget.index)));
                },
                child: FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 19.0.r, vertical: 8.0.r),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.1),
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
                                padding: EdgeInsets.only(right: 12.0.r),
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      // color: Colors.amber,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(cubit
                                                .recommendedModel
                                                ?.data[widget.index]
                                                .avatar ??
                                            'assets/images/alarm_icon.svg'),
                                      )),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 150.w,
                                    child: TextItem(
                                      text: cubit.recommendedModel
                                              ?.data[widget.index].name ??
                                          "",
                                      textSize: 18,
                                      overflow: TextOverflow.ellipsis,
                                      maxLine: 1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/alarm_icon.svg",
                                        color: context
                                                    .read<GeneralCubit>()
                                                    .islight ==
                                                true
                                            ? AppColorLight.textMainColor
                                            : Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      TextItem(
                                        text:
                                            "${cubit.recommendedModel?.data[widget.index].time.toString()} min",
                                        fontWeight: FontWeight.w600,
                                        textSize: 14,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
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
                                        textSize: 10,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      TextItem(
                                        text:
                                            "${cubit.recommendedModel?.data[widget.index].price} ",
                                        color: const Color(0xffCB0006),
                                        fontWeight: FontWeight.w700,
                                        textSize: 18,
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
                                        "assets/images/Group 15.svg",
                                      ),
                                      onTap: () {},
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
