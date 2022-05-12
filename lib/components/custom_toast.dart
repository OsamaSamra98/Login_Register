import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import '../styles/colors.dart';

void customShowToast({
  required BuildContext context,
  required String text,
  Color? color,
}) {
  showToast(
    text,
    textStyle: const TextStyle(fontSize: 16.5, color: black),
    textPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    context: context,
    backgroundColor: color ?? green,
    animation: StyledToastAnimation.slideFromRightFade,
    reverseAnimation: StyledToastAnimation.slideFromRightFade,
    position: StyledToastPosition.top,
    animDuration: const Duration(seconds: 2),
    duration: const Duration(seconds: 5),
    curve: Curves.easeInOut,
    reverseCurve: Curves.easeInOut,
  );
}
