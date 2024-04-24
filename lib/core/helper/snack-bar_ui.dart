
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../core/helper/alerts.dart';
import '../../shared/textItem.dart';

class SnackDesgin extends StatelessWidget {
  const SnackDesgin({
    super.key,
    required this.state,
    required this.text,
  });
  final SnackState state;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Card(
          color: state == SnackState.success ? Colors.green : Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              state == SnackState.success
                  ? Lottie.asset(
                "assets/json/success.json",
                width: 150,
                height: 150,
              )
                  : Lottie.asset(
                "assets/json/error.json",
                width: 150,
                height: 90,
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: TextItem(
                  text:text,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  // textAlign: TextAlign.start,
                  textSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


SnackBar showSnackBar({
  required String text,
}) {
  return SnackBar(
    backgroundColor: const Color(0xffE7F9E7),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),

    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/true_chick.png'),
        SizedBox(
          width: 5.h,
        ),
        TextItem(text: text, color: Colors.black)
      ],
    ),

    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(
      bottom: 550,
      top: 10,
      left: 60,
      right: 60,
    ), // Custom margin to position the Snackbar at the top
  );
}