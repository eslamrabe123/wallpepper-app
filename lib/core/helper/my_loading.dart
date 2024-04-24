import 'package:flutter/material.dart';
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
        animationTime: Duration(milliseconds: 100),
        keepSingle: true,
        builder: (context) => fullScreen
            ? loading()
            : Dialog(
          child: SizedBox(
            width: 200,
            height: 200,
            child: loading(),
          ),
        ),
      );

      shown = true;
    }
  }

  static LottieBuilder loadingWidget() => Lottie.asset(
    "assets/json/food_loading.json",
  );
  static Center loading() => const Center(child:  CircularProgressIndicator());


  static dismis() {
    if (shown) {
      SmartDialog.dismiss();
      shown = false;
    } else {}
  }
}
