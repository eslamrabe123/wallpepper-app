import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:wallpapper/core/helper/snack-bar_ui.dart';


enum SnackState { success, failed }

class Alerts {


  static Future dialog(
    BuildContext context, {
    required Widget child,
    RouteSettings? routeSettings,
    bool? barrierDismissible,
    EdgeInsets? insetPadding,
    AlignmentGeometry? alignment,
    Color? backgroundColor,
  }) {
    return showDialog(
        context: context,
        barrierDismissible: barrierDismissible ?? true,
        routeSettings: routeSettings,
        builder: (context) => Dialog(
              backgroundColor: backgroundColor,
              insetPadding: insetPadding,
              alignment: alignment,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              child: child,
            ));
  }

  static Future bottomSheet(BuildContext context,
      {required Widget child,
      RouteSettings? routeSettings,
      EdgeInsets? insetPadding,
      double? height,
      AlignmentGeometry? alignment,
      Color? backgroundColor}) {
    return showModalBottomSheet(
        useRootNavigator: true,
        routeSettings: routeSettings,
        enableDrag: true,
        isScrollControlled: true,
        clipBehavior: Clip.hardEdge,
        elevation: 0,
        backgroundColor: const Color(0xffF3F3F7),
        context: context,
        builder: (context) =>
            // Navigator(
            //   initialRoute: FilterRoutes.filterWidget,
            //   onGenerateRoute: RouteGenerator.getNestedRoute,
            //   key: Utils.filterNavigationKey,
            //
            // ));
            SafeArea(
              // minimum: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Container(
                  //   height: 5,
                  //   width: 50,
                  //   decoration: BoxDecoration(
                  //       color: Color(0xffCCCFD4),
                  //       borderRadius: BorderRadius.circular(10)),
                  // ),
                  child,
                ],
              ),
            ));
  }

  static Future logOutBottomSheet(BuildContext context,
      {required Widget child,
      RouteSettings? routeSettings,
      EdgeInsets? insetPadding,
      double? height,
      AlignmentGeometry? alignment,
      Color? backgroundColor}) {
    return showModalBottomSheet(
        useRootNavigator: true,
        routeSettings: routeSettings,
        enableDrag: true,
        isScrollControlled: true,
        clipBehavior: Clip.hardEdge,
        elevation: 0,
        backgroundColor: const Color(0xffF3F3F7),
        context: context,
        builder: (context) =>
            // Navigator(
            //   initialRoute: FilterRoutes.filterWidget,
            //   onGenerateRoute: RouteGenerator.getNestedRoute,
            //   key: Utils.filterNavigationKey,
            //
            // ));
            SafeArea(
              // minimum: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Container(
                  //   height: 5,
                  //   width: 50,
                  //   decoration: BoxDecoration(
                  //       color: Color(0xffCCCFD4),
                  //       borderRadius: BorderRadius.circular(10)),
                  // ),
                  child,
                ],
              ),
            ));
  }

  static Future<bool> confirmDialog(
    BuildContext context, {
    required String text,
  }) async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) => AlertDialog(
              actionsAlignment: MainAxisAlignment.center,
              title: Text(text),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text("لا")),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text("نعم"))
              ],
            )));
  }

  static snack({required String text, required SnackState state}) {
    BotToast.showCustomText(
        align: Alignment.center,
        onlyOne: true,
        toastBuilder: (s) => SnackDesgin(
              state: state,
              text: text,
            ));
  }
}
