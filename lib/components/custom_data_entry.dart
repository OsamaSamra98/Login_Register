import 'package:flutter/material.dart';
import '../styles/colors.dart';
import 'custom_text.dart';

class CustomDataEntry extends StatelessWidget {
  CustomDataEntry({
    Key? key,
    required this.label,
    required this.child,
  }) : super(key: key);
  String label;
  Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: label, fontSize: 16, color: grey),
        const SizedBox(height: 6),
        child,
        SizedBox(height: size.height * 0.025),
      ],
    );
  }
}
