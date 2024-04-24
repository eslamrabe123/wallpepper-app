import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpapper/shared/textItem.dart';

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
  final BorderSide borderSide = BorderSide.none;
  double radius = 15;
  Color borderColor = const Color(0xff707070);

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
          cursorColor: const Color(0xff000000),
          onFieldSubmitted: (onSubmitted) {},
          obscureText: isPassword ?? false,
          validator: (data) {
            return validate(data);
          },
          onChanged: (data) {},
          maxLines: maxLine ?? 1,
          controller: controller,
          decoration: InputDecoration(
            fillColor: const Color(0xffEBEFF3),
            filled: true,

            contentPadding: const EdgeInsets.all(16),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: borderSide,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: borderSide,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: borderSide,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: borderSide),

            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,

            hintText: hintText,

            hintStyle: GoogleFonts.nunito(
              color: const Color(0xff959FA8),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 0.09,
            ),
            hintTextDirection: TextDirection.ltr,

            //prefixIcon: icon,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                33,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
