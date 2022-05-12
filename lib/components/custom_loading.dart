import 'package:flutter/material.dart';
import '../styles/colors.dart';

class CustomLoading extends StatelessWidget {
  CustomLoading({Key? key, this.color}) : super(key: key);
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? black,
        strokeWidth: 3.0,
      ),
    );
  }
}
