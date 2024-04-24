import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallpapper/auth_module/features/login_screen.dart';
import 'package:wallpapper/auth_module/features/register_screen.dart';
import 'package:wallpapper/core/services/services_locator.dart';
import 'package:wallpapper/lay_out_module/features/home_screen.dart';
import 'package:wallpapper/shared/textItem.dart';
import '../../core/themes/color_themes.dart';
import '../../shared/button_item.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class OnBoardView extends StatefulWidget {
  static String id = 'OnBoardView';

  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardView();
}

class _OnBoardView extends State<OnBoardView> {
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
                SvgPicture.asset(
                  "assets/images/on_board_background.svg",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Spacer(),

                      SvgPicture.asset(
                        "assets/images/splash_icon.svg",
                      ),
                      const Spacer(),
                      // SizedBox(height: 100.h,),
                      const TextItem(
                        textAlign: TextAlign.center,
                        text: "Welcome Dude!",
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        textSize: 30,
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      ButtonItem(
                        borderColor: AppColors.buttonColor,
                        buttonColor: AppColors.buttonColor,
                        onPressed: () {
                          Navigator.pushNamed(context, LoginView.id);
                        },
                        text: 'Order Now',
                      ),

                      const CreateNewAccountButtonItem(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CreateNewAccountButtonItem extends StatelessWidget {
  const CreateNewAccountButtonItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: 12,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextItem(
              text: 'Don’t have Account?',
              color: Color(0xFFffffff),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RegisterView.id);
                },
                child: const TextItem(
                  text: 'Register Now',
                  color: Color(0xffCB0006),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
