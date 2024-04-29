import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpapper/core/general_cubit/cubit/general_cubit.dart';
import 'package:wallpapper/core/themes/app_colors/app_colors_dark.dart';
import 'package:wallpapper/core/themes/app_colors/app_colors_light.dart';
import 'package:wallpapper/order_module/cubit/order_cubit.dart';
import 'package:wallpapper/order_module/domain/model/order_model.dart';
import 'package:wallpapper/shared/textItem.dart';

// ignore: must_be_immutable
class OrderItem extends StatefulWidget {
  OrderItem({
    super.key,
    required this.model,
    required this.index,
  });

  final OrderModel model;
  int index;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = OrderCubit.get(context);
        return AnimationConfiguration.staggeredList(
          position: widget.index,
          duration: const Duration(milliseconds: 375),
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(
              child: GestureDetector(
                onTap: () {},
                child: FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 14.0.w, vertical: 8.0.h),
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.read<GeneralCubit>().islight == true
                            ? AppColorLight.recommendedItemColor
                            : AppColorDark.recommendedItemColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            // width: 120.w,
                            height: 120.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0.w),
                              child: Container(
                                height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    // color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10.r),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        widget.model.image ?? "",
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 100.w,
                                child: TextItem(
                                  text: widget.model.name ?? "",
                                  fontWeight: FontWeight.normal,
                                  textSize: 18.sp,
                                  overflow: TextOverflow.ellipsis,
                                  maxLine: 1,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              TextItem(
                                text: widget.model.category ?? '',
                                color:
                                    context.read<GeneralCubit>().islight == true
                                        ? AppColorLight.textHintColor
                                        : Colors.white,
                                fontWeight: FontWeight.w600,
                                textSize: 14.sp,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextItem(
                                    text: "SAR ",
                                    color:
                                        context.read<GeneralCubit>().islight ==
                                                true
                                            ? AppColorLight.sarColor
                                            : Colors.white,
                                    textSize: 14.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  TextItem(
                                    text: widget.model.price ?? "",
                                    color: AppColorLight.allColor,
                                    fontWeight: FontWeight.normal,
                                    textSize: 14.sp,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 8.5.h,
                                  right: 8.5.w,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    cubit.removeRequest(widget.index);
                                  },
                                  icon: SvgPicture.asset(
                                    "assets/images/iontrash.svg",
                                    color:
                                        context.read<GeneralCubit>().islight ==
                                                true
                                            ? null
                                            : Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      if (widget.model.quantity > 0) {
                                        widget.model.quantity--;
                                        setState(() {});
                                      }
                                    },
                                    child: TextItem(
                                      text: "ــ",
                                      textSize: 14.sp,
                                      color: const Color(0xffFC4747),
                                    ),
                                  ),
                                  TextItem(
                                    text: widget.model.quantity.toString(),
                                    textSize: 14.sp,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      widget.model.quantity++;
                                      setState(() {});
                                    },
                                    child: TextItem(
                                      text: "+",
                                      textSize: 14.sp,
                                      color: const Color(0xffFC4747),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// //////////////////////// My Orders ////////////////
/// ////////////////////////////////////////////////
/// ///////////////////////////////////////////////
/// //////////////////////////////////////////////
/// ///////////////////////////////////////////////
/// //////////////////////////////////////////////////////////
/// ///////////////////////////////////////////////////
///  /////////////////////////////////////////////////

class BuildMyOrderItem extends StatefulWidget {
  BuildMyOrderItem({
    super.key,
    required this.cubit,
    required this.index,
    required this.model,
    // required this.remove,
  });
  final int index;
  final OrderCubit cubit;
  final OrderModel model;
  // Function remove;

  @override
  State<BuildMyOrderItem> createState() => _BuildMyOrderItemState();
}

class _BuildMyOrderItemState extends State<BuildMyOrderItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: FadeIn(
        duration: const Duration(milliseconds: 500),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.r, vertical: 8.0.r),
          child: Container(
            decoration: BoxDecoration(
              color: AppColorLight.recommendedItemColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  width: 120.w,
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          widget.model.image ?? "",
                        ),
                      )),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      child: TextItem(
                        text: widget.model.name ?? "",
                        fontWeight: FontWeight.normal,
                        color: AppColorLight.textMainColor,
                        textSize: 18,
                        overflow: TextOverflow.ellipsis,
                        maxLine: 1,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextItem(
                      text: widget.model.category ?? '',
                      color: const Color(0xff959FA8),
                      fontWeight: FontWeight.w600,
                      textSize: 14,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const TextItem(
                          text: "SAR ",
                          color: Color(0xff777777),
                          textSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        TextItem(
                          text: widget.model.price ?? "",
                          color: AppColorLight.allColor,
                          fontWeight: FontWeight.normal,
                          textSize: 14,
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8.5.r,
                        right: 8.5.r,
                      ),
                      child: IconButton(
                        onPressed: () {
                          widget.cubit.removeRequest(widget.index);
                        },
                        icon: SvgPicture.asset(
                          "assets/images/iontrash.svg",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            if (widget.model.quantity > 0) {
                              widget.model.quantity--;
                              setState(() {});
                            }
                          },
                          child: const TextItem(
                            text: "ــ",
                            textSize: 14,
                            color: Color(0xffFC4747),
                          ),
                        ),
                        TextItem(
                          text: widget.model.quantity.toString(),
                          textSize: 14,
                        ),
                        TextButton(
                          onPressed: () {
                            widget.model.quantity++;
                            setState(() {});
                          },
                          child: const TextItem(
                            text: "+",
                            textSize: 14,
                            color: Color(0xffFC4747),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
