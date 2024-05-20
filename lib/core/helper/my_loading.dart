import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lottie/lottie.dart';

import '../general_cubit/cubit/general_cubit.dart';

class MyLoading {
  static bool shown = false;

  static show({
    bool fullScreen = false,
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
                  width: 50.w,
                  height: 50.h,
                  child: loadingWidget(),
                ),
              )
            : Dialog(
                child: Container(
                  decoration: BoxDecoration(
                    color: context.read<GeneralCubit>().islight == true
                        ? null
                        : Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
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
        fit: BoxFit.contain,
      );

  static Center loading() => const Center(child: CircularProgressIndicator());

  static dismis() {
    if (shown) {
      SmartDialog.dismiss();
      shown = false;
    } else {}
  }
}
