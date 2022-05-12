import 'package:flutter/material.dart';
import '../styles/colors.dart';

class CustomText extends StatelessWidget {
  CustomText({
    Key? key,
    required this.text,
    required this.fontSize,
    //  this.fontWeight,
    this.color,
    this.textAlign,
  }) : super(key: key);
  String text;
  double fontSize;
  // FontWeight? fontWeight;
  Color? color;
  TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        fontSize: fontSize,
        // fontWeight: fontWeight,
        color: color ?? black,
      ),
    );
  }
}
