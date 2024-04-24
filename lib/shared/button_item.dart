import 'package:flutter/material.dart';
import 'package:wallpapper/shared/textItem.dart';

import '../core/themes/color_themes.dart';

class ButtonItem extends StatelessWidget {
  ButtonItem({
    super.key,
    required this.onPressed,
    required this.text,
    this.height,
    this.buttonColor,
    this.textColor,
    this.borderColor,
    this.buttonWidth,
    this.textSize,
    this.borderRadius,
  });

  VoidCallback? onPressed;
  final String text;
  final double? height;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;
  final double? buttonWidth;
  final double? textSize;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth ?? MediaQuery.of(context).size.width,
      height: height ?? MediaQuery.of(context).size.height / 10,
      decoration: ShapeDecoration(
        color: buttonColor ?? AppColors.buttonColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: buttonColor ?? AppColors.buttonColor,

          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 15),
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: TextItem(
          text: text,
          color: const Color(0xffFFFFFF),
          textSize: textSize ?? 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
