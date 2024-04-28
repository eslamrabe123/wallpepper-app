
import 'package:flutter/cupertino.dart';

import '../../account_module/features/help.dart';
import '../../auth_module/features/update_account/personal_information.dart';
import '../../account_module/features/privacy_policy.dart';
import '../../auth_module/features/login_screen.dart';
import '../../auth_module/features/on_board_screen.dart';
import '../../auth_module/features/register_screen.dart';
import '../../auth_module/features/splash_screen.dart';
import '../../lay_out_module/features/favorite_screen.dart';
import '../../lay_out_module/features/home_screen.dart';
import '../../lay_out_module/features/offers_screen.dart';

Map<String, Widget Function(BuildContext)> routs = {

  OnBoardView.id: (context) => const OnBoardView(),
  RegisterView.id: (context) => const RegisterView(),
  LoginView.id: (context) => LoginView(),

  SplashView.id: (context) => const SplashView(),
  HomeScreen.id: (context) => const HomeScreen(),
  PrivacyAndPolicyView.id: (context) => const PrivacyAndPolicyView(),
  HelpView.id: (context) => const HelpView(),
  FavoriteScreen.id: (context) => const FavoriteScreen(),
  PersonalInformationScreen.id: (context) => const PersonalInformationScreen(),
  OffersScreen.id: (context) => const OffersScreen(),

};
