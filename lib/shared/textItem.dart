import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextItem extends StatelessWidget {
  const TextItem({
    super.key,
    required this.text,
    this.color,
    this.textSize,
    this.fontWeight,
    this.textDecoration,
    this.textAlign,
    this.overflow,
    this.maxLine,
  });

  final String text;
  final Color? color;
  final double? textSize;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      softWrap: true,
      maxLines: maxLine,
      overflow: overflow,
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        decoration: textDecoration,
        color: color,
        fontSize: textSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w500,
        // height: 0.09,
      ),
    );
  }
}
