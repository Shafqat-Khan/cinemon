import 'package:cinemon/constants/colors.dart';
import 'package:cinemon/constants/sizes.dart';
import 'package:cinemon/constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/form/form_header_widget.dart';
import '../../../../constants/image_strings.dart';
import 'login_form_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0), // adjust height as needed
        child: FormHeaderWidget(text: tSignin),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.4,
              child: const Image(
                image: AssetImage(tLogo),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(tDefaultSize - 15),
              child: LoginForm(),
            )
          ],
        ),
      ),
    );
  }
}
