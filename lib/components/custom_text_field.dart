import 'package:flutter/material.dart';
import '../styles/colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.hintText,
    required this.onChanged,
    this.isPassword,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  TextEditingController controller;
  TextInputType textInputType;
  String hintText;
  Function(String?) onChanged;
  bool? isPassword;
  IconData? icon;
  VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      autofocus: true,
      cursorColor: black,
      style: const TextStyle(fontSize: 20),
      obscureText: isPassword ?? isPassword == false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 16.5, color: grey.withOpacity(0.50)),
        contentPadding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.025),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: black.withOpacity(0.50),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: black.withOpacity(0.50),
          ),
        ),
        suffixIcon: IconButton(
          splashRadius: 25,
          icon: Icon(icon, color: blue),
          onPressed: onPressed,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
