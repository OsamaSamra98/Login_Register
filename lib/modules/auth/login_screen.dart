import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/custom_loading.dart';
import '../../components/custom_text_field.dart';
import '../../components/custom_toast.dart';
import '../../components/custom_form_errors.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import '../../components/constants.dart';
import '../../components/custom_material_button.dart';
import '../../components/custom_text.dart';
import '../../components/custom_data_entry.dart';
import '../../styles/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String loginScreen = "/loginScreen";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TalentsAuthCubit, TalentsAuthStates>(
      listener: (context, state) {
        if (state is TalentsSignInSuccessStates) {
          customShowToast(context: context, text: doneLogin);
        }
      },
      builder: (context, state) {
        TalentsAuthCubit cubit = TalentsAuthCubit.get(context);
        return Scaffold(
          appBar: AppBar(leading: const BackButton()),
          body: SingleChildScrollView(
            child: Padding(
              padding: padding,
              child: Column(
                children: [
                  CustomText(text: "Login", fontSize: 28),
                  CustomText(
                    text: "Login to your account",
                    fontSize: 16,
                    color: black.withOpacity(0.4),
                  ),
                  const SizedBox(height: 40),
                  CustomDataEntry(
                    label: "Email",
                    child: CustomTextField(
                      hintText: "enter email",
                      controller: cubit.emailSignInController,
                      textInputType: TextInputType.emailAddress,
                      onChanged: (value) {
                        cubit.removeErrorFromList(error: emailError);
                        value = cubit.emailSignInController.text;
                      },
                    ),
                  ),
                  CustomDataEntry(
                    label: "Password",
                    child: CustomTextField(
                      hintText: "enter password",
                      controller: cubit.passwordSignInController,
                      textInputType: TextInputType.visiblePassword,
                      isPassword: cubit.isPassword,
                      icon: cubit.suffixIcon,
                      onPressed: () => cubit.hiddenPassword(context: context),
                      onChanged: (value) {
                        cubit.removeErrorFromList(error: noData);
                        cubit.removeErrorFromList(error: passwordError);
                        value = cubit.passwordSignInController.text;
                      },
                    ),
                  ),
                  CustomFormErrors(cubit: cubit),
                  const SizedBox(height: 20),
                  state is TalentsSignInLoadingStates
                      ? CustomLoading()
                      : CustomMaterialButton(
                          text: "Login",
                          color: green,
                          onPressed: () {
                            if (cubit.emailSignInController.text.isEmpty ||
                                cubit.passwordSignInController.text.isEmpty) {
                              cubit.addErrorInList(error: noData);
                            } else if (!cubit.emailSignInController.text
                                    .contains("@") ||
                                !cubit.emailSignInController.text
                                    .contains(".com")) {
                              cubit.addErrorInList(error: emailError);
                            } else if (cubit
                                    .passwordSignInController.text.length <
                                8) {
                              cubit.addErrorInList(error: passwordError);
                            } else {
                              cubit.signIn();
                            }
                          },
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
