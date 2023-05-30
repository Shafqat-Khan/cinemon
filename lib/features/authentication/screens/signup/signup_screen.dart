import 'package:cinemon/common_widgets/form/password_text_field.dart';
import 'package:cinemon/constants/sizes.dart';
import 'package:cinemon/constants/text_strings.dart';
import 'package:cinemon/features/authentication/controllers/validators.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../common_widgets/form/form_header_widget.dart';
import '../../../../common_widgets/form/text_form_field.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../controllers/user_controller.dart';
import '../movies/movies.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final controller = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();
  Validators validator = Validators();
  bool value = false;
  Color check = Colors.white;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        // adjust height as needed
        child: FormHeaderWidget(
          text: tSignup,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
                height: size.height * 0.3,
                child: Image(image: AssetImage(tLogo))),
            Padding(
              padding: EdgeInsets.all(tDefaultSize - 15),
              child: Container(
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CommonTextField(
                          text: tSignupEmail,
                          contro: controller.email,
                          obscure: false,
                          validate: validator.validateEmail,
                        ),
                        PasswordTextField(
                          text: tSignupPassword,
                          contro: controller.password,
                          obscure: true,
                          validate: validator.validatePassword,
                        ),
                        CommonTextField(
                            text: tFirstName,
                            contro: controller.fName,
                            obscure: false,
                            validate: validator.validateName),
                        CommonTextField(
                            text: tLastName,
                            contro: controller.sName,
                            obscure: false,
                            validate: validator.validateName),
                        CommonTextField(
                            text: tPhoneNumber,
                            contro: controller.phoneNo,
                            obscure: false,
                            validate: validator.validatePhone),
                        CommonTextField(
                            text: tAddress,
                            contro: controller.address,
                            obscure: false,
                            validate: validator.validateAddress),
                        CommonTextField(
                            text: tGender,
                            contro: controller.gender,
                            obscure: false,
                            validate: validator.validateGender)
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 120,
        color: Colors.white10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      value = !value;
                    });
                  },
                  child: Checkbox(
                    value: value,
                    onChanged: (newValue) {
                      setState(() {
                        value = newValue ?? false;
                      });
                    },
                    side: BorderSide(color: check),
                    activeColor: tPrimaryColor,
                    checkColor: check,
                  ),
                ),
                Text(
                  tTermnConditions,
                  style: TextStyle(color: check),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    backgroundColor: tPrimaryColor,
                    padding: const EdgeInsets.symmetric(
                        vertical: tButtonHeight + 5),
                  ),
                  onPressed: () {
                    _signUserUp();
                  },
                  child: Text(
                    tSignup.toUpperCase(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _signUserUp() async {
    if (_formKey.currentState!.validate()) {
      if (value == true) {
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: controller.email.text,
            password: controller.password.text,
          );
          FirebaseFirestore.instance.collection('users').add({
            "email": controller.email.text,
            "pass": controller.password.text,
            "fName": controller.fName.text,
            "sName": controller.sName.text,
            "phone": controller.phoneNo.text,
            "address": controller.address.text,
            "gender": controller.gender.text,
          }).then((value) {
            print(value);
          }).catchError((error) {
            print(error);
          });
          Get.to(() => const Movies());
        } catch (err) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(
                  'Error',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: const Text(
                  'User already exists.',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: tPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                backgroundColor: Colors.blueGrey,
              );
            },
          );
        }
      } else {
        setState(() {
          check = Colors.red;
        });
      }
    }
  }

}
