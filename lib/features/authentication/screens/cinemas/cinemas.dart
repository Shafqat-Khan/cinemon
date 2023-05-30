import 'package:cinemon/common_widgets/form/form_header_widget.dart';
import 'package:cinemon/common_widgets/navbar/navbar.dart';
import 'package:cinemon/constants/image_strings.dart';
import 'package:cinemon/common_widgets/expandable_text.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import 'build_card.dart';

class Cinemas extends StatefulWidget {
  const Cinemas({Key? key}) : super(key: key);

  @override
  State<Cinemas> createState() => _CinemasState();
}

class _CinemasState extends State<Cinemas> {
  @override
  Widget build(BuildContext context) {
    List<String> img = [cue, universal, cinepax];
    List<String> names = [
      "CUE Cinemas",
      "Universal Cinemas",
      "Cinepax Cinemas"
    ];
    List<String> phoneNo = [
      "0321 8510546",
      "0321 8510546",
      "0321 8510546"
    ];
    List<String> location = [
      "57 Main Boulevard Gulberg, Main Gulberg, Lahore, Punjab 54660",
      "F788+RPJ, Abdul Haque Rd، adjacent to Lahore International Expo Centre, Trade Centre Commercial Area Phase 2 Johar Town, Lahore, Punjab 54000",
      "2nd Floor, Fortress Square Shopping Mall, Lahore, 54000"
    ];
    return Scaffold(
      backgroundColor: tSecondaryColor,
      appBar: AppBar(
        title: const Text(
          "Cinemas",
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: tPrimaryColor,
      ),
      drawer: const Navbar(),
      body: ListView.builder(
          itemCount: img.length,
          itemBuilder: (BuildContext context, int index) {
            return BuildCard(img: img, names: names, location: location, phoneNo: phoneNo, index: index);
          }),
    );
  }
}