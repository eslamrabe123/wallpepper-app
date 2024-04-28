import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpapper/shared/textItem.dart';

import '../cubit/lay_out_cubit.dart';
import '../features/oder_details.dart';

class RecommendedItem extends StatefulWidget {
   RecommendedItem({
    super.key,
    required this.index,
    required this.nweIndex,
  });

  final int index;
  final int nweIndex;
  bool isLike = false;

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
                    builder: (context) => OrderDetails(index: widget.index)));
          },
          child: FadeIn(
            duration: const Duration(milliseconds: 500),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.r, vertical: 8.0.r),
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
                          padding: EdgeInsets.only(right: 8.0.r),
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                // color: Colors.amber,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    cubit.recommendedModel?.data[widget.index]
                                            .avatar ??
                                        "",
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
                                text: cubit.recommendedModel?.data[widget.index]
                                        .name ??
                                    "",
                                color: const Color(0xff40484E),
                                textSize: 18,
                                overflow: TextOverflow.ellipsis,
                                maxLine: 1,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/alarm_icon.svg",
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                TextItem(
                                  text:
                                      "${cubit.recommendedModel?.data[widget.index].time.toString()} min",
                                  color: const Color(0xff959FA8),
                                  fontWeight: FontWeight.w600,
                                  textSize: 14,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const TextItem(
                                  text: "SAR ",
                                  color: Color(0xff777777),
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
                                  "assets/images/ionheart-circle.svg",

                                  color:cubit.recommendedModel
                                              ?.data[widget.index].isFav ==
                                          true
                                      ? const Color(0xffFC4747)
                                      : null,
                                ),
                                onTap: () async {
                                  cubit.changeFavIconColor(index: widget.index);


                                  await cubit.toggleFavorite(
                                    dishId: cubit.recommendedModel
                                        ?.data[widget.index].id,
                                  );
                                  print(
                                      "Fav is : ${widget.isLike}");
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
