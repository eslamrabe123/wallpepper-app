import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpapper/core/themes/app_colors/app_colors_light.dart';

import '../../shared/textItem.dart';
import '../cubit/lay_out_cubit.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: BlocConsumer<LayOutCubit, LayOutState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = LayOutCubit.get(context);
          return Column(
            children: [
              Container(
                width: 56.w,
                height: 56.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // color: Colors.amber,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          cubit.categoryModel?.data[index].avatar ?? "")),
                ),
                margin: EdgeInsets.symmetric(horizontal: 8.0.r),
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 13.h,
              ),
              SizedBox(
                width: 56.w,
                child: Center(
                  child: TextItem(
                    text: cubit.categoryModel?.data[index].name ?? "",
                    textSize: 14,
                    overflow: TextOverflow.ellipsis,
                    maxLine: 1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
