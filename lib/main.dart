import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'shared/network/cache_helper.dart';
import 'modules/auth/welcome_screen.dart';
import 'routes.dart';
import 'styles/colors.dart';

void main() async {
  await CacheHelper.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "SansPro",
        scaffoldBackgroundColor: white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: white,
          iconTheme: IconThemeData(color: black),
        ),
      ),
      initialRoute: WelcomeScreen.welcomeScreen,
      routes: routes,
    );
  }
}
