import 'package:flutter/material.dart';
import '../styles/colors.dart';
import 'custom_text.dart';

class CustomMaterialButton extends StatelessWidget {
  CustomMaterialButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.color,
    this.elevation,
    this.highlightElevation,
  }) : super(key: key);
  VoidCallback onPressed;
  double? width;
  double? height;
  String text;
  Color? color;
  double? elevation;
  double? highlightElevation;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      minWidth: width ?? MediaQuery.of(context).size.width,
      height: height ?? MediaQuery.of(context).size.height * 0.065,
      color: color ?? white,
      elevation: elevation ?? 0.6,
      highlightElevation: highlightElevation ?? 0.6,
      child: CustomText(
        text: text,
        fontSize: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
        side: const BorderSide(color: black),
      ),
    );
  }
}
