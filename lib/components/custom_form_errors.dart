import 'package:flutter/material.dart';
import '../modules/auth/cubit/cubit.dart';
import '../styles/colors.dart';
import 'custom_text.dart';

class CustomFormErrors extends StatelessWidget {
  CustomFormErrors({Key? key, required this.cubit}) : super(key: key);
  TalentsAuthCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(cubit.errors.length, (index) {
          return customError(error: cubit.errors[index]);
        })
      ],
    );
  }

  Row customError({required String error}) {
    return Row(
      children: [
        if (error.isNotEmpty) const Icon(Icons.error, size: 18, color: red),
        const SizedBox(width: 4),
        CustomText(
          text: error,
          fontSize: 16.5,
          color: black.withOpacity(0.35),
        )
      ],
    );
  }
}
