import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class PasswordTextField extends StatefulWidget {
  var text, contro;

  final String? Function(String?)? validate;

  bool obscure;

  PasswordTextField(
      {super.key,
      required this.text,
      required this.contro,
      required this.validate,
      required this.obscure});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.contro,
      style: const TextStyle(color: Colors.white),
      cursorColor: tPrimaryColor,
      cursorHeight: 30,
      validator: widget.validate,
      obscureText: widget.obscure,
      decoration: InputDecoration(
        labelText: widget.text,
        suffixIcon: IconButton(
          icon: Icon(widget.obscure ? Icons.visibility_off : Icons.visibility,color: Colors.white,),
          onPressed: () {
            setState(() {
              widget.obscure = !widget.obscure;
            });
          },
        ),
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
