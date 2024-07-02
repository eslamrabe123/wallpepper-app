import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallpapper/core/general_cubit/cubit/general_cubit.dart';
import 'package:wallpapper/core/general_cubit/cubit/general_state.dart';
import 'package:wallpapper/core/routs/route.dart';
import 'auth_module/features/splash_screen.dart';
import 'core/local/api/blocObserver.dart';
import 'core/services/services_locator.dart';
import 'core/themes/theme_data/theme_data_dark.dart';
import 'core/themes/theme_data/theme_data_light.dart';
import 'core/utiles/shared.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Bloc.observer = MyBlocObserver();
  ServiceLocator().init();
  await CacheHelper.init();

  runApp(EasyLocalization(
      startLocale: const Locale('en', "US"),
      supportedLocales: const [
        Locale('ar', "EG"),
        Locale('en', "US"),
      ],
      saveLocale: true,
      path: 'assets/translations',
      child: BlocProvider(
        create: (context) => serviceLocator<GeneralCubit>(),
        child: const MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeneralCubit, GeneralState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = GeneralCubit.get(context);
        return ScreenUtilInit(
            designSize: const Size(390, 844),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                theme: cubit.islight == true ? themeDataLight : themeDataDark,
                routes: routs,
                builder: (context, child) {
                  final flutterSmart = FlutterSmartDialog.init();
                  // final toast = FToastBuilder();
                  final botToast = BotToastInit();
                  child = botToast(context, child);
                  // child = toast(context, child);
                  child = flutterSmart(context, child);
                  return child;
                },

                debugShowCheckedModeBanner: false,
                initialRoute: SplashView.id,

                // home: MyRadioWidget(),
              );
            });
      },
    );
  }
}
