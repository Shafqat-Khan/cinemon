import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/colors.dart';
import '../../constants/text_strings.dart';

class FormHeaderWidget extends StatelessWidget {
  var text;

  FormHeaderWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: tPrimaryColor,
      title: Row(
        children: [
           // IconButton(
          //   onPressed: () {
          //     Get.back();
          //   },
          //   icon: Icon(
          //     Icons.arrow_back,
          //     color: Colors.white,
          //     size: 24,
          //   ),
          // ),
          SizedBox(width: 20),
          Text(
            text,
          ),
        ],
      ),
    );
  }
}
