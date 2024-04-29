import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpapper/auth_module/features/login_screen.dart';
import 'package:wallpapper/core/utiles/shared.dart';
import '../account_module/features/privacy_policy.dart';
import '../auth_module/features/update_account/personal_information.dart';
import '../core/themes/color_themes.dart';
import '../lay_out_module/features/favorite_screen.dart';
import '../lay_out_module/features/home_screen.dart';
import '../lay_out_module/features/offers_screen.dart';
import '../order_module/features/my_order_screen.dart';
import '../order_module/features/orders_lay_out.dart';
import 'textItem.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  final Color color = AppColors.primiry;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: ShapeBorder.lerp(
        const ContinuousRectangleBorder(),
        const ContinuousRectangleBorder(),
        1.0,
      ),
      width: MediaQuery.of(context).size.width / 1.5.w,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              // color: Color(0xffCB0006),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image:
                      AssetImage("assets/images/drawer_backgroundjpeg.jpeg")),
            ),
            child: TextItem(text: ""),
          ),
          ListTile(
            leading: Icon(Icons.home, color: color),
            title: const TextItem(
              text: 'Home',
              fontWeight: FontWeight.w600,
              textSize: 18,
              color: AppColors.textColor,
            ),
            onTap: () {
              Navigator.pushNamed(context, HomeScreen.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart, color: color),
            title: const TextItem(
              text: 'My Cart',
              fontWeight: FontWeight.w600,
              textSize: 18,
              color: AppColors.textColor,
            ),
            onTap: () {
              // Navigator.pushNamed(context, MyOrderView.id);
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const MyOrderView()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.coffee_maker_rounded, color: color),
            title: const TextItem(
              text: 'Orders',
              fontWeight: FontWeight.w600,
              textSize: 18,
              color: AppColors.textColor,
            ),
            onTap: () {
              Navigator.pushNamed(context, OrderLayOut.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle, color: color),
            title: const TextItem(
              text: 'Account',
              fontWeight: FontWeight.w600,
              textSize: 18,
              color: AppColors.textColor,
            ),
            onTap: () {
              Navigator.pushNamed(context, PersonalInformationScreen.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.local_offer, color: color),
            title: const TextItem(
              text: 'Offers',
              fontWeight: FontWeight.w600,
              textSize: 18,
              color: AppColors.textColor,
            ),
            onTap: () {
              Navigator.pushNamed(context, OffersScreen.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite, color: color),
            title: const TextItem(
              text: 'Favorites',
              fontWeight: FontWeight.w600,
              textSize: 18,
              color: AppColors.textColor,
            ),
            onTap: () {
              Navigator.pushNamed(context, FavoriteScreen.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip, color: color),
            title: const TextItem(
              text: 'Privacy and Policy',
              fontWeight: FontWeight.w600,
              textSize: 18,
              color: AppColors.textColor,
            ),
            onTap: () {
              Navigator.pushNamed(context, PrivacyAndPolicyView.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout_sharp, color: color),
            title: const TextItem(
              text: 'Log Out',
              fontWeight: FontWeight.w600,
              textSize: 18,
              color: AppColors.textColor,
            ),
            onTap: () {
              buildShowDialog(context);
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
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
              const TextItem(
                text: " Log Out ?",
                textSize: 20,
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 35.h,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 25.0.r, vertical: 8.0.r),
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
                        color: AppColors.textColorRed,
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
                          color: AppColors.textColorGreen,
                          fontWeight: FontWeight.w600,
                          textSize: 18,
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
