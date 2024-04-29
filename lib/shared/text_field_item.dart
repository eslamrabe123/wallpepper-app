import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpapper/core/general_cubit/cubit/general_cubit.dart';
import 'package:wallpapper/shared/textItem.dart';

import '../core/themes/app_colors/app_colors_light.dart';

// ignore: must_be_immutable
class TextFieldItem extends StatelessWidget {
  TextFieldItem({
    super.key,
    this.upFieldText,
    this.isPassword,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyBordType,
    this.height,
    this.maxLine,
    this.onSubmitted,
    this.controller,
    this.onChange,
    required this.validate,
    this.hintColor,
    this.lableColor,
    this.enableBorderSide,
    this.fillColor,
  });
  TextEditingController? controller;
  final String? hintText;
  final String? upFieldText;
  final IconButton? prefixIcon;
  final IconButton? suffixIcon;
  bool? isPassword;
  final TextInputType? keyBordType;
  Function(String)? onChange;
  final Function(String?) validate;
  final Function(String)? onSubmitted;
  final double? height;
  final int? maxLine;
  final BorderSide? enableBorderSide;
  // = BorderSide.none;
  double radius = 13;
  Color borderColor = const Color(0xff707070);
  Color? hintColor = AppColorLight.textHintColor;
  Color? lableColor = AppColorLight.textHintColor;
  Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 0, top: 0),
          child: TextItem(
            text: upFieldText ?? "",
            textAlign: TextAlign.start,
          ),
        ),
        TextFormField(
          keyboardType: keyBordType,
          cursorColor: context.read<GeneralCubit>().islight == true
              ? const Color(0xff000000)
              : Colors.white,
          style: GoogleFonts.nunito(
            color: lableColor ?? AppColorLight.textMainColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
          onFieldSubmitted: (onSubmitted) {},
          obscureText: isPassword ?? false,
          validator: (data) {
            return validate(data);
          },
          onChanged: (data) {},
          maxLines: maxLine ?? 1,
          controller: controller,
          decoration: InputDecoration(
            fillColor: fillColor,
            filled: true,

            contentPadding: EdgeInsets.all(22.r),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: enableBorderSide ?? BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: enableBorderSide ?? BorderSide.none,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: enableBorderSide ?? BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: enableBorderSide ?? BorderSide.none,
            ),

            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,

            hintText: hintText,

            hintStyle: GoogleFonts.nunito(
              color: hintColor ?? AppColorLight.textHintColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 0.09.h,
            ),

            // hintTextDirection: TextDirection.rtl,

            //prefixIcon: icon,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                13,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
