

import 'package:cinemon/common_widgets/form/password_text_field.dart';
import 'package:cinemon/features/authentication/controllers/validators.dart';
import 'package:cinemon/features/authentication/screens/movies/movies.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/form/text_form_field.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/user_controller.dart';
import '../forget_password/forget_password_screen.dart';
import '../signup/signup_screen.dart';

class LoginForm extends StatefulWidget {

  LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final controller = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();
  Validators validator = Validators();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Column(
      children: [
        CommonTextField(
          text: tEmail,
          contro: controller.email,
          obscure: false,
          validate: validator.validateEmail,
        ),
        const SizedBox(height: 30),
        PasswordTextField(
          text: tPassword,
          contro: controller.password,
          obscure: true,
          validate: validator.validatePassword,
        ),
        const SizedBox(height: 40),
        TextButton(
          child: Text(tforgetPassword,
              style: TextStyle(color: tPrimaryColor)),
          onPressed: () {
            Get.to(() => ForgetPasswordScreen());
          },
        ),
        Text.rich(TextSpan(
            text: "Don\'n have an account? ",
            style: TextStyle(color: Colors.grey),
            children: <TextSpan>[
              TextSpan(
                  text: "Sing up here",
                  style: TextStyle(color: tPrimaryColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.to(() => SignupScreen());
                    })
            ])),
        const SizedBox(height: 30),
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(),
                    backgroundColor: tPrimaryColor,
                    padding: const EdgeInsets.symmetric(
                        vertical: tButtonHeight + 5)),
                onPressed: () async {
                  signUserIn();
                },
                child: Text(
                  tSignin.toUpperCase(),
                )))
      ],
    ));
  }

  void signUserIn() async {
      if(_formKey.currentState!.validate()){
        // showDialog(
        //     context: context,
        //     builder: (context) {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     });
        try{
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: controller.email.text,
            password: controller.password.text,
          );
          controller.email.clear();
          controller.password.clear();
          Get.to(()=>Movies());
        } on FirebaseAuthException catch (e){
        }
        // Navigator.pop(context)
      }
  }
}
