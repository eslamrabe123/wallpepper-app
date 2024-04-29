import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpapper/shared/textItem.dart';

import '../auth_module/features/login_screen.dart';
import '../core/themes/app_colors/app_colors_light.dart';
import '../core/utiles/shared.dart';

Future<dynamic> showDialog(
    {required BuildContext context,
    required Container Function(dynamic context) builder}) {
  return showDialog(
    context: context,
    builder: (context) => Container(
      width: 300.w,
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white, // Set the background color of the dialog to white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 35.h,
          ),
          const TextItem(
            text: " Log Out ?",
            textSize: 20,
            color: AppColorLight.textMainColor,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 35.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0.r, vertical: 8.0.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const TextItem(
                    text: "cancel",
                    color: AppColorLight.textMainColor,
                    fontWeight: FontWeight.w600,
                    textSize: 18,
                  ),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      CacheHelper.removeData(key: "token");
                      Navigator.pushNamed(context, LoginView.id);
                    },
                    child: const TextItem(
                      text: "confirm",
                      color: AppColorLight.textColorGereen,
                      fontWeight: FontWeight.w600,
                      textSize: 18,
                    )),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
