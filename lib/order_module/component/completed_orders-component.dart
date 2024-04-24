import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpapper/shared/button_item.dart';

import '../../core/themes/color_themes.dart';
import '../../shared/textItem.dart';
class CompletedOrdersComponent extends StatelessWidget {
  const CompletedOrdersComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 16.0.r, vertical: 12.r),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffEBEFF3),
              borderRadius: BorderRadius.circular(15),
            ),
            width: double.infinity,
            height: 240.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.0.r),
                  child: Row(
                    children: [
                      const TextItem(
                        text: "Order number #223355",
                        textSize: 14,
                        color: Color(0xff40484E),
                        fontWeight: FontWeight.w600,
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const TextItem(
                          text: "Details",
                          textSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff959FA8),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.0.r),
                  child: const TextItem(
                    text: "21 December 2021",
                    textSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff959FA8),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.0.r),
                  child: Row(
                    children: [
                      const TextItem(
                        text: "SAR ",
                        textSize: 14,
                        color: Color(0xff959FA8),
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      const TextItem(
                        text: "220 ",
                        textSize: 14,
                        color: AppColors.textColorRed,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.0.r,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,

                        child: TextButton(
                          onPressed: () {},
                          child: const TextItem(
                            text: "Delivered",
                            color: AppColors.textColorGreen,
                            fontWeight: FontWeight.w600,
                            textSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80.w,
                      ),
                      Expanded(
                        flex: 2,
                        child: ButtonItem(
                          borderRadius: 10,

                          height: 35,
                          onPressed: () {},
                          text: "Repeat order Again",
                          textSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: 4,
    );
  }
}
