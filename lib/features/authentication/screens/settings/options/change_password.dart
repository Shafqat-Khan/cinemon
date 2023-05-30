import 'package:cinemon/common_widgets/form/password_text_field.dart';
import 'package:cinemon/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common_widgets/form/text_form_field.dart';
import '../../../../../constants/sizes.dart';
import '../../../controllers/user_controller.dart';
import '../../../controllers/validators.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool oldObscure = true;
  bool newObscure = true;

  @override
  Widget build(BuildContext context) {
    TextEditingController oldPassword = TextEditingController();
    TextEditingController newPassword = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    Validators validator = Validators();

    return Scaffold(
      backgroundColor: tSecondaryColor,
      appBar: AppBar(
        backgroundColor: tPrimaryColor,
        title: const Text('Change Password'),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 40.0,
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                const Text(
                  "CHANGE PASSWORD",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "We suggest choosing a unique password that you don't use anywhere else",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 30,
                ),
                PasswordTextField(
                  text: "Old Password",
                  contro: oldPassword,
                  obscure: oldObscure,
                  validate: validator.validatePassword,
                ),
                const SizedBox(height: 10),
                PasswordTextField(
                  text: "New Password",
                  contro: newPassword,
                  obscure: newObscure,
                  validate: validator.validatePassword,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(),
                            backgroundColor: tPrimaryColor,
                            padding: const EdgeInsets.symmetric(
                                vertical: tButtonHeight + 5)),
                        onPressed: () async {
                          if(_formKey.currentState!.validate()){
                            updatePassword(oldPassword.text,newPassword.text);
                          }
                        },
                        child: const Text("UPDATE PASSWORD"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          )),
    );
  }


  void updatePassword(String currentPassword, String newPassword) async {
    User? user = _auth.currentUser;

    if (user != null) {
      try {

        AuthCredential credential = EmailAuthProvider.credential(email: user.email!, password: currentPassword);

        await user.reauthenticateWithCredential(credential);

        await user.updatePassword(newPassword);

        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                'Success',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: const Text(
                'Password updated successfully.',
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
        Navigator.pop(context);
      } catch (e) {
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
                'Invalid Password.',
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
              backgroundColor: Colors.grey.shade900,
            );
          },
        );
      }
    } else {
      print('No user is currently logged in');
    }
  }
}
