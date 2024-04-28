import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpapper/core/routs/route.dart';
import 'auth_module/features/splash_screen.dart';
import 'core/services/services_locator.dart';
import 'core/utiles/shared.dart';
import 'order_module/features/check_out_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

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
            builder: (context, child) {
              final flutterSmart = FlutterSmartDialog.init();
              final toast = FToastBuilder();
              child = toast(context, child);
              child = flutterSmart(context, child);
              return child;
            },
            // locale: context.locale,
            // supportedLocales: context.supportedLocales,
            // localizationsDelegates: context.localizationDelegates,
            debugShowCheckedModeBanner: false,
            initialRoute: SplashView.id,

            // home: CheckOutView(),
          );
        });
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      print('onCreate -- ${bloc.runtimeType}');
    }
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      print('onEvent -- ${bloc.runtimeType} -- $event');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print('onChange -- ${bloc.runtimeType} -- $change');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print('onTransition -- ${bloc.runtimeType} -- $transition');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print('onError -- ${bloc.runtimeType} -- $error -- $stackTrace');
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    if (kDebugMode) {
      print('onClose -- ${bloc.runtimeType}');
    }
    super.onClose(bloc);
  }
}
