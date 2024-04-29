import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpapper/core/utiles/shared.dart';

class Utils {
  static bool? isLight = CacheHelper.loadData(key: "theme") ?? true;
  static bool? intro;
  static String token = CacheHelper.loadData(key: "token") ?? '';
  static bool isLogin = true;
  static bool dataCompleted = false;
  static bool onBoard = true;
  static bool start = true;
  static bool FirstOpen = true;
  static String name = CacheHelper.loadData(key: "name") ?? '';
  static String UserId = '';
  static String email = '';
  static String phone = CacheHelper.loadData(key: "phone") ?? '';
  static String FCMToken = '';
  static String UserImage = '';
  static String complaint_phone = '';
  static String privacy = '';
  // static LoginUser userModel = LoginUser();
  //
  // static DioHelper get dio => serviceLocator<DioHelper>();
  // static DataManager get dataManager => serviceLocator<DataManager>();
  // static Validation get valid => serviceLocator<Validation>();
  static void showDialogScreen({
    required BuildContext context,
    required String title,
    required String buttonText,
    required String buttonTextTwo,
    VoidCallback? onTap,
    VoidCallback? onCancel,
  }) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(Icons.clear))),
                    SizedBox(height: 16.h),
                    SvgPicture.asset("assets/images/mark.svg"),
                    SizedBox(height: 16.h),
                    // TextWidget(
                    //     title,
                    //     fontSize: 16.sp,
                    //     fontWeight: FontWeight.bold),
                    // SizedBox(
                    //   height: 50.h,
                    // ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: ButtonWidget(
                    //         title: buttonText,
                    //         height: 0.13.sw,
                    //         onTap: onTap,
                    //         textColor: Colors.white,
                    //         withBorder: true,
                    //         borderColor: AppColors.primiry,
                    //         buttonColor: AppColors.primiry,
                    //       ),
                    //     ),
                    //     20.pw,
                    //     Expanded(
                    //       child: ButtonWidget(
                    //         title: buttonTextTwo,
                    //         height: 0.13.sw,
                    //
                    //         onTap: onCancel,
                    //         textColor: mainColor,
                    //         withBorder: true,
                    //         borderColor: mainColor,
                    //         buttonColor: Colors.white,
                    //       ),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            ));
  }

  static const ThemeMode appMode = ThemeMode.light;
  static void openScreen(BuildContext? context, Widget screen,
      {bool replacment = false, bool remove = false}) {
    if (context == null) {
      return;
    }

    /// test
    if (remove) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => screen),
        (route) => false,
      );
    } else if (replacment) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => screen));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
    }
  }

  static void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }

  static Widget backWidget(BuildContext context,
      {VoidCallback? onBack, bool arabicLang = true}) {
    return GestureDetector(
      onTap: () {
        if (onBack != null) {
          onBack.call();
        }
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.red,
      ),
    );
  }

  static void showMsg(String msg, {bool error = false}) {
    // Fluttertoast.showToast(
    //     msg: msg,
    //     toastLength: Toast.LENGTH_LONG,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: error ? Colors.red : Colors.green,
    //     textColor: Colors.white,
    //     fontSize: 16.0);
  }
}

class BackWidget extends StatelessWidget {
  BackWidget({super.key, this.onBack, this.color, this.icon, this.size});
  VoidCallback? onBack;
  Color? color;
  IconData? icon;
  double? size;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (onBack != null) {
            onBack?.call();
          } else {
            Navigator.pop(context);
          }
        },
        child: Icon(
          icon ?? Icons.arrow_back_outlined,
          color: color ?? Colors.white,
          size: size,
        ));
  }
}

extension Photo on String {
  String png([String? path = "icons"]) => 'assets/$path/$this.png';
  String svg([String path = "icons"]) => 'assets/$path/$this.svg';
  String jpeg([String path = "icons"]) => 'assets/$path/$this.jpeg';
}

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(
        height: toDouble().h,
      );
  SizedBox get pw => SizedBox(
        width: toDouble().w,
      );
}

// Widget notificationIcon(BuildContext context) {
//   return GestureDetector(
//     onTap: ()
//     {
//       Utils.openScreen(context, const NotificationsScreen());
//     },
//     child: Image.asset(
//       "assets/icons/notifications.png",
//     ),
//   );
// }
