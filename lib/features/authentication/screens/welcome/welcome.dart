import 'package:cinemon/constants/image_strings.dart';
import 'package:cinemon/constants/sizes.dart';
import 'package:cinemon/constants/text_strings.dart';
import 'package:cinemon/features/authentication/screens/movies/movies.dart';
import 'package:cinemon/features/authentication/screens/login/auth_login.dart';
import 'package:cinemon/features/authentication/screens/login/login_screen.dart';
import 'package:cinemon/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/colors.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(tDefaultSize - 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                      height: height * 0.73,
                      child: const Image(image: AssetImage(tLogo))),
                  Text(tAppName,
                      style: Theme.of(context).textTheme.displaySmall),
                  Text(tWelcomeSlogan,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  TextButton(
                      onPressed: () {
                        Get.to(() => const Movies());
                      },
                      child: const Text(
                        "Continue without login",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      )),
                  const Text("OR")
                ],
              ),
              const Divider(
                thickness: 2,
              ),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {
                            Get.to(() => const LoginScreen());
                          },
                          style: OutlinedButton.styleFrom(
                              shape: const RoundedRectangleBorder(),
                              foregroundColor: tSecondaryColor,
                              side: const BorderSide(
                                  color: tSecondaryColor, width: 1.5),
                              padding: const EdgeInsets.symmetric(
                                  vertical: tButtonHeight)),
                          child: Text(tLogin.toUpperCase()))),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to((() => const SignupScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          foregroundColor: Colors.white,
                          backgroundColor: tSecondaryColor,
                          side: const BorderSide(color: tSecondaryColor),
                          padding:
                              const EdgeInsets.symmetric(vertical: tButtonHeight)),
                      child: Text(
                        tSignup.toUpperCase(),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
