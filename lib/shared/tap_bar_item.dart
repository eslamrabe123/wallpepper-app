import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'textItem.dart';

class TabBarItem extends StatelessWidget {
  const TabBarItem({
    super.key,
    required this.title,
    required this.titleColor,
    this.width,
    this.height,
    this.backgroundColor,
    this.bottomLeft,
    this.bottomRight,
    this.topLeft,
    this.topRight,
  });

  final String title;
  final Color titleColor;
  final double? width;
  final double? height;
  final double? bottomLeft;
  final double? bottomRight;
  final double? topLeft;
  final double? topRight;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? MediaQuery.of(context).size.height / 12,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(bottomLeft ?? 10.r),
          bottomRight: Radius.circular(bottomRight ?? 10.r),
          topLeft: Radius.circular(topLeft ?? 10.r),
          topRight: Radius.circular(topRight ?? 10.r),
        ),
      ),
      child: Center(
        child: TextItem(
          text: title,
          color: titleColor,
          textSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
