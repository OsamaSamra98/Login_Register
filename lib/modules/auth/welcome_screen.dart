import 'package:flutter/material.dart';
import '../../components/custom_material_button.dart';
import '../../components/custom_text.dart';
import '../../styles/colors.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String welcomeScreen = "/welcomeScreen";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          size.width * 0.045,
          size.height * 0.045,
          size.width * 0.045,
          size.height * 0.045,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CustomText(
                  text: "Welcome",
                  fontSize: 28,
                ),
                SizedBox(height: size.height * 0.015),
                CustomText(
                  text:
                      "Automatic identity verification which enables\nyou to verify your identity",
                  fontSize: 16,
                  color: black.withOpacity(0.4),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Container(
              height: size.height * 0.35,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/welcome.png"),
                ),
              ),
            ),
            Column(
              children: [
                CustomMaterialButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, LoginScreen.loginScreen),
                  text: "Login",
                ),
                SizedBox(height: size.height * 0.025),
                CustomMaterialButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, SignUpScreen.signupScreen),
                  text: "Sign Up",
                  color: yellow,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
