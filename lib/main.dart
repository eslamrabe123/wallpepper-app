
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpapper/core/routs/route.dart';
import 'auth_module/features/splash_screen.dart';
import 'auth_module/features/update_account/personal_information.dart';
import 'core/services/services_locator.dart';
import 'core/utiles/shared.dart';

import 'order_module/features/order_number_screen.dart';
import 'order_module/features/orders_lay_out.dart';
import 'order_module/features/my_order_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ServiceLocator().init();

  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,

        builder: (context, child) {


          return MaterialApp(
            theme: ThemeData(
              textTheme: GoogleFonts.nunitoTextTheme(),
            ),
            routes: routs,
            builder: FlutterSmartDialog.init(),
            // locale: context.locale,
            // supportedLocales: context.supportedLocales,
            // localizationsDelegates: context.localizationDelegates,
            debugShowCheckedModeBanner: false,
             initialRoute: SplashView.id,

            // home:  const PersonalInformationScreen(),
          );
        });
  }
}
