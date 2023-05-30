import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../common_widgets/expandable_text.dart';


class BuildCard extends StatelessWidget {

  const BuildCard({
    super.key,
    required this.img,
    required this.names,
    required this.location,
    required this.phoneNo,
    required this.index,
  });
  final int index;
  final List<String> img;
  final List<String> names;
  final List<String> location;
  final List<String> phoneNo;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      color: tSecondaryColor,
      child: Container(
        width: double.infinity,
        color: Colors.grey.shade900,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              img[index],
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 15,bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    names[index],
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  ExpandableText(text: "Address: ${location[index]}"),
                  Text("Phone: ${phoneNo[index]}")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
