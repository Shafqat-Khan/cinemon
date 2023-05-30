import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CommonTextField extends StatelessWidget {
  var text, contro;

  final String? Function(String?)? validate;

  bool obscure;

  CommonTextField(
      {super.key,
      required this.text,
      required this.contro,
      required this.validate,
      required this.obscure});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contro,
      style: const TextStyle(color: Colors.white),
      cursorColor: tPrimaryColor,
      cursorHeight: 30,
      validator: validate,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: text,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: tPrimaryColor,
            width: 2.0,
          ),
        ),
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 16.0),
      ),
    );
  }
}
