import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/constants.dart';
import '../../components/custom_form_errors.dart';
import '../../components/custom_material_button.dart';
import '../../components/custom_text.dart';
import '../../components/custom_toast.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'login_screen.dart';
import '../../styles/colors.dart';
import '../../components/custom_loading.dart';

class InputDataScreen extends StatelessWidget {
  const InputDataScreen({Key? key}) : super(key: key);
  static const String inputData = "/inputData";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TalentsAuthCubit, TalentsAuthStates>(
      listener: (context, state) {
        if (state is TalentsSignUpSuccessStates) {
          customShowToast(context: context, text: doneRegister);
          Navigator.pushNamedAndRemoveUntil(
              context, LoginScreen.loginScreen, (route) => false);
        }
      },
      builder: ((context, state) {
        TalentsAuthCubit cubit = TalentsAuthCubit.get(context);
        return Scaffold(
          appBar: AppBar(leading: const BackButton()),
          body: SingleChildScrollView(
            child: Padding(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: awareness,
                    fontSize: 20,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  ...List.generate(cubit.talents.length, (i) {
                    return CustomListTile(
                      text: cubit.talents[i],
                      isSelected: cubit.selectedTalents.contains(
                        cubit.talents[i],
                      ),
                      onTap: () {
                        cubit.selectTalents(i: i);
                        cubit.removeErrorFromList(error: noSelectTalents);
                      },
                    );
                  }),
                  CustomText(text: "Gender", fontSize: 24),
                  const SizedBox(height: 10),
                  Row(
                    children: cubit.genderPreson.map((item) {
                      return CustomRadio(
                        text: item.toString(),
                        value: item.toString(),
                        groupValue: cubit.gender.toString(),
                        onChanged: (value) {
                          cubit.removeErrorFromList(error: noSelectGender);
                          cubit.selectGender(value!);
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 10),
                  CustomFormErrors(cubit: cubit),
                  const SizedBox(height: 20),
                  state is TalentsSignUpLoadingStates
                      ? CustomLoading()
                      : CustomMaterialButton(
                          text: "Sign Up",
                          color: green,
                          onPressed: () {
                            if (cubit.selectedTalents.isEmpty) {
                              cubit.addErrorInList(error: noSelectTalents);
                            } else if (cubit.gender.isEmpty) {
                              cubit.addErrorInList(error: noSelectGender);
                            } else {
                              cubit.signUp();
                            }
                          },
                        ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class CustomRadio extends StatelessWidget {
  CustomRadio({
    Key? key,
    required this.text,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);
  String text;
  String value;
  String groupValue;
  Function(String?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile<String>(
        title: CustomText(
          text: text,
          fontSize: 20,
          color: black.withOpacity(0.45),
        ),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: green,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  CustomListTile({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);
  String text;
  bool isSelected;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 4),
      child: ListTile(
        title: CustomText(
          text: text,
          fontSize: 20,
          color: black.withOpacity(0.45),
        ),
        trailing: Visibility(
          visible: isSelected,
          child: const Icon(
            Icons.check_circle,
            color: green,
          ),
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
      ),
    );
  }
}
