import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';
import '../../../shared/local/end_points.dart';
import '../../../shared/network/cache_helper.dart';

class TalentsAuthCubit extends Cubit<TalentsAuthStates> {
  TalentsAuthCubit() : super(TalentsAuthInitialStates());

  /// Create An Object
  static TalentsAuthCubit get(context) => BlocProvider.of(context);

  /// Inputs of signup
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// Sign Up
  Future<void> signUp() async {
    try {
      emit(TalentsSignUpLoadingStates());
      await CacheHelper.postData(
        url: REGISTER,
        data: {
          "full_name": nameController.text,
          "email": emailController.text,
          "password": passwordController.text,
          "phone": phoneController.text,
          "gender": gender,
          "talents": selectedTalents,
        },
      );
      emit(TalentsSignUpSuccessStates());
    } catch (error) {
      emit(TalentsSignUpErrorStates(error: error.toString()));
    }
  }

  /// Inputs of signin
  TextEditingController emailSignInController = TextEditingController();
  TextEditingController passwordSignInController = TextEditingController();

  /// Sign In
  Future<void> signIn() async {
    try {
      emit(TalentsSignInLoadingStates());
      await CacheHelper.postData(
        url: LOGIN,
        data: {
          "email": emailSignInController.text,
          "password": passwordSignInController.text,
        },
      );
      emit(TalentsSignInSuccessStates());
    } catch (error) {
      emit(TalentsSignInErrorStates(error: error.toString()));
    }
  }

  /// Form Errors
  // add error in list
  List<String> errors = [];
  void addErrorInList({required String error}) {
    if (!errors.contains(error)) {
      errors.add(error);
      emit(TalentsAddErrorInListStates());
    }
  }

// remove error from list
  void removeErrorFromList({required String error}) {
    if (errors.contains(error)) {
      errors.remove(error);
      emit(TalentsRemoveErrorFromListStates());
    }
  }

  /// Choose the gender
  List<String> genderPreson = ["Male", "Female"];
  String gender = "";
  void selectGender(String val) {
    gender = val;
    emit(TalentsSelectGenderStates());
  }

  /// Select the talents
  List<String> talents = [
    "talents.1",
    "talents.2",
    "talents.3",
    "talents.4",
    "talents.5",
    "talents.6",
  ];
  List<String> selectedTalents = [];
  void selectTalents({required int i}) {
    if (selectedTalents.length == 4) {
      selectedTalents.remove(talents[i]);
      emit(TalentsRemoveTalentsFromListStates());
    } else {
      if (selectedTalents.contains(talents[i])) {
        selectedTalents.remove(talents[i]);
      } else {
        selectedTalents.add(talents[i]);
      }
      emit(TalentsAddTalentsOnListStates());
    }
  }

  /// Hidden Password
  bool isPassword = true;
  IconData suffixIcon = Icons.visibility_outlined;
  void hiddenPassword({required BuildContext context}) {
    isPassword = !isPassword;
    suffixIcon =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(TalentsHiddenPasswordStates());
  }
}
