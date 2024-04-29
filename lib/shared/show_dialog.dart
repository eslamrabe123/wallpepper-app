import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpapper/shared/textItem.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 40.h),
          SvgPicture.asset(
            'assets/images/done_icon.svg',
          ),
          SizedBox(height: 30.h),
          const TextItem(
            textAlign: TextAlign.center,
            text: 'تم إرسال طلبك',
            fontWeight: FontWeight.w600,
            textSize: 20,
          ),
          SizedBox(height: 20.h),
          const TextItem(
            textAlign: TextAlign.center,
            text: 'طلبك قيد المراجعة وسيتم الرد عليك في أقرب وقت ',
            fontWeight: FontWeight.w400,
            color: Color(0xff979797),
            textSize: 12,
          ),
          SizedBox(height: 30.h),
          Row(
            children: [
              TextButton(
                onPressed: onTap,
                child: const TextItem(
                  textAlign: TextAlign.start,
                  text: 'تم',
                  color: Color(0xff1E1E1E),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
