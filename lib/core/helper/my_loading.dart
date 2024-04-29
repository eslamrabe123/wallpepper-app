import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lottie/lottie.dart';

class MyLoading {
  static bool shown = false;

  static show({
    bool fullScreen = true,
  }) {
    if (shown == false) {
      SmartDialog.show(
        clickMaskDismiss: false,
        animationType: SmartAnimationType.scale,
        animationTime: const Duration(milliseconds: 100),
        keepSingle: true,
        builder: (context) => fullScreen
            ? Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: loadingWidget())
            : Dialog(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: loadingWidget(),
                ),
              ),
      );

      shown = true;
    }
  }

  static LottieBuilder loadingWidget() => Lottie.asset(
        "assets/json/food_loading.json",
        height: 150.h,
        width: 150.w,
      );

  static Center loading() => const Center(child: CircularProgressIndicator());

  static dismis() {
    if (shown) {
      SmartDialog.dismiss();
      shown = false;
    } else {}
  }
}
