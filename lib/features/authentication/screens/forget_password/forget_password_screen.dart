import 'package:cinemon/common_widgets/form/form_header_widget.dart';
import 'package:cinemon/common_widgets/form/text_form_field.dart';
import 'package:cinemon/constants/colors.dart';
import 'package:cinemon/constants/text_strings.dart';
import 'package:cinemon/features/authentication/controllers/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../controllers/user_controller.dart';
import '../splash_screen/splash_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    var size = MediaQuery.of(context).size;
    Validators validator = Validators();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: FormHeaderWidget(
                text: "Forget Password")),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                    height: size.height * 0.4,
                    child: Image(image: AssetImage(tLogo))),
              ),
              Padding(
                padding: const EdgeInsets.all(tDefaultSize - 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Forgotten Password?",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: tPrimaryColor)),
                    Text(tfeedback, textAlign: TextAlign.justify),
                    SizedBox(height: tDefaultSize - 15),
                    Row(
                      children: [
                        const Text(tSignupEmail),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: tPrimaryColor,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: CommonTextField(
                              text: null,
                              contro: null,
                              obscure: true,
                              validate: validator.validatePassword,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(),
                                backgroundColor: tPrimaryColor,
                                padding: const EdgeInsets.symmetric(
                                    vertical: tButtonHeight + 5)),
                            onPressed: () async {
                              bool isLoggedIn = await SignUpController.instance
                                  .checkEmail(controller.email.text);
                              isLoggedIn
                                  ? Get.snackbar("Success",
                                      "Email has been sent to reset password",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor:
                                          tPrimaryColor.withOpacity(0.8),
                                      colorText: Colors.green)
                                  : Get.snackbar("Error",
                                  "Invalid Email!",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor:
                                  tPrimaryColor.withOpacity(0.8),
                                  colorText: Colors.red);
                            },
                            child: Text("NEXT")))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
