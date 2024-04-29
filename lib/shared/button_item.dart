import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpapper/shared/textItem.dart';

import '../core/themes/app_colors/app_colors_light.dart';

class ButtonItem extends StatelessWidget {
  ButtonItem({
    super.key,
    required this.onPressed,
    this.text,
    this.height,
    this.buttonColor,
    this.textColor,
    this.borderColor,
    this.buttonWidth,
    this.textSize,
    this.borderRadius,
    this.child,
  });

  VoidCallback? onPressed;
  final String? text;
  final double? height;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;
  final double? buttonWidth;
  final double? textSize;
  final double? borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: buttonWidth ?? MediaQuery.of(context).size.width.w,
        height: height ?? MediaQuery.of(context).size.height / 12.h,
        decoration: ShapeDecoration(
          color: buttonColor ?? AppColorLight.buttomColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.w,
              color: buttonColor ?? AppColorLight.buttomColor,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextItem(
              text: text ?? '',
              color: const Color(0xffFFFFFF),
              textSize: textSize ?? 16.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
