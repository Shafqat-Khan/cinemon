import 'package:cinemon/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;

  const CustomCheckbox({required this.value});

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool value = false;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        activeColor: tPrimaryColor,
        checkColor: Colors.black,
      ),
    );
  }
}
