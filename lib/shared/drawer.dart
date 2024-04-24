import 'package:flutter/material.dart';
import 'package:wallpapper/auth_module/features/login_screen.dart';
import 'package:wallpapper/core/utiles/shared.dart';

import '../account_module/features/privacy_policy.dart';
import '../auth_module/features/update_account/personal_information.dart';
import '../core/themes/color_themes.dart';
import '../lay_out_module/features/favorite_screen.dart';
import '../lay_out_module/features/home_screen.dart';
import 'textItem.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  final Color color = AppColors.primiry;

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            leading: Icon(Icons.account_circle, color: color),
            title: const TextItem(
              text: 'account',
              fontWeight: FontWeight.w600,
              textSize: 18,
              color: AppColors.textColor,
            ),
            onTap: () {
              Navigator.pushNamed(context, PersonalInformationScreen.id);
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
            leading: Icon(Icons.login_outlined, color: color),
            title: const TextItem(
              text: 'Log Out',
              fontWeight: FontWeight.w600,
              textSize: 18,
              color: AppColors.textColor,
            ),
            onTap: () {
              CacheHelper.removeData(key: "token");
              Navigator.pushNamed(context, LoginView.id);
            },
          ),
        ],
      ),
    );
  }
}
