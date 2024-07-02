import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpapper/auth_module/features/login_screen.dart';
import 'package:wallpapper/core/general_cubit/cubit/general_cubit.dart';
import 'package:wallpapper/core/general_cubit/cubit/general_state.dart';
import 'package:wallpapper/core/utiles/shared.dart';
import '../account_module/features/privacy_policy.dart';
import '../auth_module/features/splash_screen.dart';
import '../auth_module/features/update_account/personal_information.dart';
import '../core/themes/app_colors/app_colors_dark.dart';
import '../core/themes/app_colors/app_colors_light.dart';
import '../lay_out_module/features/favorite_screen.dart';
import '../lay_out_module/features/home_screen.dart';
import '../lay_out_module/features/offers_screen.dart';
import '../order_module/features/my_order_screen.dart';
import '../order_module/features/orders_lay_out.dart';
import 'textItem.dart';

// ignore: must_be_immutable
class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});

  final Color color = AppColorLight.primaryColor;

  // int? currentIndex = Utils.isLight == true ? 1 : 2;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: ShapeBorder.lerp(
        const ContinuousRectangleBorder(),
        const ContinuousRectangleBorder(),
        1.0,
      ),
      width: .75.sw,
      child: BlocProvider(
        create: (context) => GeneralCubit(),
        child: BlocConsumer<GeneralCubit, GeneralState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = GeneralCubit.get(context);
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  curve: Curves.easeInOutQuart,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "assets/images/drawer_backgroundjpeg.jpeg")),
                  ),
                  child: TextItem(text: ""),
                ),
                ListTile(
                  leading: Icon(Icons.home, color: color),
                  title: TextItem(
                    text: 'home'.tr(),
                    fontWeight: FontWeight.w600,
                    textSize: 18.sp,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart, color: color),
                  title: TextItem(
                    text: 'my_cart'.tr(),
                    fontWeight: FontWeight.w600,
                    textSize: 18.sp,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const MyCartScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.coffee_maker_rounded, color: color),
                  title: TextItem(
                    text: 'my_orders'.tr(),
                    fontWeight: FontWeight.w600,
                    textSize: 18.sp,
                  ),
                  onTap: () {
                    // Navigator.pushNamed(context, OrderLayOut.id);
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const OrderLayOut()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.account_circle, color: color),
                  title: TextItem(
                    text: 'account'.tr(),
                    fontWeight: FontWeight.w600,
                    textSize: 18.sp,
                  ),
                  onTap: () {
                    // Navigator.pushNamed(context, PersonalInformationScreen.id);
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              const PersonalInformationScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.local_offer, color: color),
                  title: TextItem(
                    text: 'offers'.tr(),
                    fontWeight: FontWeight.w600,
                    textSize: 18.sp,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const OffersScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.favorite, color: color),
                  title: TextItem(
                    text: 'favorites'.tr(),
                    fontWeight: FontWeight.w600,
                    textSize: 18.sp,
                  ),
                  onTap: () {
                    // Navigator.pushNamed(context, FavoriteScreen.id);
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const FavoriteScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.privacy_tip, color: color),
                  title: TextItem(
                    text: 'privacy_and_policy'.tr(),
                    fontWeight: FontWeight.w600,
                    textSize: 17.sp,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const PrivacyAndPolicyView()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.theater_comedy_sharp, color: color),
                  title: TextItem(
                    text: 'themes',
                    fontWeight: FontWeight.w600,
                    textSize: 18.sp,
                  ),
                  onTap: () {
                    buildCangeTheme(
                      context: context,
                      liftButton: () {
                        Navigator.pop(context);
                      },
                      rightButton: () {
                        cubit.changeTeme();
                      },
                      liftButtonText: 'cancel'.tr(),
                      rightButtonText: 'change'.tr(),
                      rightButtonColor:
                          context.read<GeneralCubit>().islight == true
                              ? AppColorLight.textMainColor
                              : Colors.white,
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.language, color: color),
                  title: TextItem(
                    text: 'language'.tr(),
                    fontWeight: FontWeight.w600,
                    textSize: 18.sp,
                  ),
                  onTap: () {
                    buildShowDialog(
                      context: context,
                      rightButton: () {
                        context.setLocale(const Locale('en', "US"));
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const SplashView())),
                            (route) => false);
                      },
                      liftButton: () {
                        context.setLocale(const Locale('ar', "EG"));
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const SplashView())),
                            (route) => false);
                      },
                      title: "chose_your_language".tr(),
                      liftButtonText: "arabic".tr(),
                      rightButtonText: "english".tr(),
                      liftButtonColor: AppColorLight.textMainColor,
                      rightButtonColor: AppColorLight.textMainColor,
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout_sharp, color: color),
                  title: TextItem(
                    text: 'logout'.tr(),
                    fontWeight: FontWeight.w600,
                    textSize: 18.sp,
                  ),
                  onTap: () {
                    buildShowDialog(
                      context: context,
                      rightButton: () {
                        CacheHelper.removeData(key: "token");

                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => LoginView())),
                            (route) => false);
                      },
                      liftButton: () {
                        Navigator.pop(context);
                      },
                      title: "want_to_logout".tr(),
                      liftButtonText: "cancel".tr(),
                      rightButtonText: "confirm".tr(),
                      rightButtonColor:
                          context.read<GeneralCubit>().islight == true
                              ? AppColorLight.textGreyColor
                              : AppColorDark.textBackColor,
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  buildCangeTheme({
    required BuildContext context,
    required VoidCallback rightButton,
    required VoidCallback liftButton,
    required String liftButtonText,
    required String rightButtonText,
    Color? liftButtonColor,
    Color? rightButtonColor,
  }) {
    return showDialog(
      context: context,
      builder: (context) => Center(
        child: BlocConsumer<GeneralCubit, GeneralState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = GeneralCubit.get(context);
            return Container(
              width: 300.w,
              height: 300.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: cubit.islight == true
                    ? Colors.white
                    : const Color.fromARGB(
                        255,
                        22,
                        21,
                        21,
                      ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  TextItem(
                    text: "Themes",
                    textSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: cubit.islight == true
                        ? AppColorLight.textMainColor
                        : Colors.white,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  ListTile(
                    title: TextItem(
                      text: 'Light Mode',
                      fontWeight: FontWeight.bold,
                      textSize: 18.sp,
                      color: cubit.islight == true
                          ? AppColorLight.textMainColor
                          : Colors.white,
                    ),
                    leading: Radio(
                      value: 2,
                      activeColor: AppColorLight.primaryColor,
                      groupValue: cubit.currentIndex,
                      onChanged: (value) {
                        cubit.radioTogel(value: value as int);
                        cubit.changeTeme();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const HomeScreen())),
                            (route) => false);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  ListTile(
                    title: TextItem(
                      text: 'Dark Mode',
                      fontWeight: FontWeight.bold,
                      textSize: 18.sp,
                      color: cubit.islight == true
                          ? AppColorLight.textMainColor
                          : Colors.white,
                    ),
                    leading: Radio(
                      activeColor: AppColorLight.primaryColor,
                      value: 1,
                      groupValue: cubit.currentIndex,
                      onChanged: (value) {
                        cubit.radioTogel(value: value as int);
                        cubit.changeTeme();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const HomeScreen())),
                            (route) => false);
                      },
                    ),
                  ),
                  //   Padding(
                  //     padding: EdgeInsets.symmetric(
                  //         horizontal: 25.0.r, vertical: 5.0.r),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       mainAxisSize: MainAxisSize.max,
                  //       children: [
                  //         TextButton(
                  //           onPressed: liftButton,
                  //           child: TextItem(
                  //             text: liftButtonText,
                  //             color:
                  //                 liftButtonColor ?? AppColorLight.textRedColor,
                  //             fontWeight: FontWeight.w600,
                  //             textSize: 18,
                  //           ),
                  //         ),
                  //         const Spacer(),
                  //         TextButton(
                  //             onPressed: rightButton,
                  //             child: TextItem(
                  //               text: rightButtonText,
                  //               color: rightButtonColor ??
                  //                   AppColorLight.textGreyColor,
                  //               fontWeight: FontWeight.w600,
                  //               textSize: 18,
                  //             )),
                  //         SizedBox(
                  //           height: 25.h,
                  //         )
                  //       ],
                  //     ),
                  //   )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  buildShowDialog({
    required BuildContext context,
    required VoidCallback rightButton,
    required VoidCallback liftButton,
    required String title,
    required String liftButtonText,
    required String rightButtonText,
    Color? liftButtonColor,
    Color? rightButtonColor,
  }) {
    return showDialog(
      context: context,
      builder: (context) => Center(
        child: Container(
          width: 300.w,
          height: 200.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                Colors.white, // Set the background color of the dialog to white
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 35.h,
              ),
              TextItem(
                text: title,
                textSize: 20.sp,
                color: context.read<GeneralCubit>().islight == true
                    ? AppColorLight.textMainColor
                    : AppColorDark.textBackColor,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 35.h,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 8.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextButton(
                      onPressed: liftButton,
                      child: TextItem(
                        text: liftButtonText,
                        color: liftButtonColor ?? AppColorLight.textRedColor,
                        fontWeight: FontWeight.w600,
                        textSize: 18.sp,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: rightButton,
                        child: TextItem(
                          text: rightButtonText,
                          color:
                              rightButtonColor ?? AppColorLight.textGreyColor,
                          fontWeight: FontWeight.w600,
                          textSize: 18.sp,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
