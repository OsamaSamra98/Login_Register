import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/custom_text_field.dart';
import 'input_data_screen.dart';
import '../../components/constants.dart';
import '../../components/custom_form_errors.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import '../../components/custom_data_entry.dart';
import '../../components/custom_material_button.dart';
import '../../components/custom_text.dart';
import '../../styles/colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String signupScreen = "/signupScreen";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TalentsAuthCubit, TalentsAuthStates>(
      builder: (context, state) {
        TalentsAuthCubit cubit = TalentsAuthCubit.get(context);
        return Scaffold(
          appBar: AppBar(leading: const BackButton()),
          body: SingleChildScrollView(
            child: Padding(
              padding: padding,
              child: Column(
                children: [
                  CustomText(text: "Sign Up", fontSize: 28),
                  CustomText(
                    text: "Create an account , it's free",
                    fontSize: 16,
                    color: black.withOpacity(0.4),
                  ),
                  const SizedBox(height: 40),
                  CustomDataEntry(
                    label: "Name",
                    child: CustomTextField(
                      hintText: "enter name",
                      controller: cubit.nameController,
                      textInputType: TextInputType.text,
                      onChanged: (value) {
                        value = cubit.nameController.text;
                      },
                    ),
                  ),
                  CustomDataEntry(
                    label: "Email",
                    child: CustomTextField(
                      hintText: "enter email",
                      controller: cubit.emailController,
                      textInputType: TextInputType.emailAddress,
                      onChanged: (value) {
                        cubit.removeErrorFromList(error: emailError);
                        value = cubit.emailController.text;
                      },
                    ),
                  ),
                  CustomDataEntry(
                    label: "Password",
                    child: CustomTextField(
                      hintText: "enter password",
                      controller: cubit.passwordController,
                      textInputType: TextInputType.visiblePassword,
                      isPassword: cubit.isPassword,
                      icon: cubit.suffixIcon,
                      onPressed: () => cubit.hiddenPassword(context: context),
                      onChanged: (value) {
                        cubit.removeErrorFromList(error: passwordError);
                        value = cubit.passwordController.text;
                      },
                    ),
                  ),
                  CustomDataEntry(
                    label: "Phone",
                    child: CustomTextField(
                      hintText: "enter phone",
                      controller: cubit.phoneController,
                      textInputType: TextInputType.number,
                      onChanged: (value) {
                        cubit.removeErrorFromList(error: noData);
                        value = cubit.phoneController.text;
                      },
                    ),
                  ),
                  CustomFormErrors(cubit: cubit),
                  const SizedBox(height: 20),
                  CustomMaterialButton(
                    onPressed: () {
                      if (cubit.nameController.text.isEmpty ||
                          cubit.emailController.text.isEmpty ||
                          cubit.passwordController.text.isEmpty ||
                          cubit.phoneController.text.isEmpty) {
                        cubit.addErrorInList(error: noData);
                      } else if (!cubit.emailController.text.contains("@") ||
                          !cubit.emailController.text.contains(".com")) {
                        cubit.addErrorInList(error: emailError);
                      } else if (cubit.passwordController.text.length < 8) {
                        cubit.addErrorInList(error: passwordError);
                      } else {
                        Navigator.pushNamed(context, InputDataScreen.inputData);
                      }
                    },
                    text: "Next",
                    color: green,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
