import 'package:flutter/material.dart';
import 'package:wallpapper/shared/textItem.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.action,
    this.textSize,
    this.padding,
    this.textColor,
  });

  final String title;
  final Widget? leading;
  final Widget? action;
  final double? textSize;
  final double? padding;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            child: leading,
          ),
          const Spacer(),
          TextItem(
            text: title,
            fontWeight: FontWeight.w600,
            textSize: textSize ?? 18,
            color: textColor ?? const Color(0xffCB0006),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          SizedBox(
            child: action,
          ),
        ],
      ),
    );
  }
}
