import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/auth/input_data_screen.dart';
import 'modules/auth/cubit/cubit.dart';
import 'modules/auth/signup_screen.dart';
import 'modules/auth/login_screen.dart';
import 'modules/auth/welcome_screen.dart';

Map<String, WidgetBuilder> routes = {
  WelcomeScreen.welcomeScreen: (context) => const WelcomeScreen(),
  LoginScreen.loginScreen: (context) => BlocProvider<TalentsAuthCubit>(
        create: (context) => TalentsAuthCubit(),
        child: const LoginScreen(),
      ),
  SignUpScreen.signupScreen: (context) => BlocProvider<TalentsAuthCubit>(
        create: (context) => TalentsAuthCubit(),
        child: const SignUpScreen(),
      ),
  InputDataScreen.inputData: (context) => BlocProvider<TalentsAuthCubit>(
        create: (context) => TalentsAuthCubit(),
        child: const InputDataScreen(),
      ),
};
