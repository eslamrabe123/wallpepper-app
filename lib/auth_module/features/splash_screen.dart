import 'package:animated_widgets/widgets/opacity_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallpapper/auth_module/features/login_screen.dart';
import 'package:wallpapper/core/services/services_locator.dart';
import 'package:wallpapper/lay_out_module/features/home_screen.dart';
import '../../../../core/utiles/utils.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import 'on_board_screen.dart';

class SplashView extends StatefulWidget {
  static String id = 'SplashView';

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool initial = true;
  var tokenData;
  SharedPreferences? shared;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => serviceLocator<AuthCubit>(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final cubit = AuthCubit.get(context);
            return Stack(
              children: [
                Container(
                  color: const Color(0xff000000),
                ),
                Center(
                  child: OpacityAnimatedWidget.tween(
                    opacityEnabled: 1,
                    opacityDisabled: 0,
                    duration: const Duration(milliseconds: 2000),
                    enabled: true,
                    curve: Curves.linear,
                    animationFinished: (finished) async {
                      if (Utils.token.isNotEmpty) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                          (route) => false,
                        );
                        print("TOKEN IS : ${Utils.token}");
                      } else {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnBoardView(),
                          ),
                          (route) => false,
                        );
                        Navigator.pushNamed(context, OnBoardView.id);
                        print("TOKEN IS : ${Utils.token}");
                      }
                      // if (tokenData == null) {
                      //   shared = await SharedPreferences.getInstance();
                      //   tokenData = shared?.setString("token", "Utils.token");
                      //   setState(() {
                      //   });
                      //   Navigator.pushNamed(context, OnBoardingView.id);
                      // } else {
                      //   Navigator.pushNamed(context, LayOut.id);
                      // }
                    },
                    child: SvgPicture.asset(
                      "assets/images/splash_icon.svg",
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
