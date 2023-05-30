import 'package:cinemon/constants/colors.dart';
import 'package:cinemon/constants/text_strings.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        backgroundColor: tPrimaryColor,
        title: const Text("Privacy Policy"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "FAQ",
                style: TextStyle(
                    fontSize: 20,
                    color: tPrimaryColor,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                tQues1,
                style: TextStyle(color: tPrimaryColor, fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                tAns1,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                tQues2,
                style: TextStyle(color: tPrimaryColor, fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 18),
                  children: [
                    TextSpan(text: tAns2),
                    TextSpan(
                      text: " cinemoncinemas@gmail.com",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                tQues3,
                style: TextStyle(color: tPrimaryColor, fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                tAns3,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                tQues4,
                style: TextStyle(color: tPrimaryColor, fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                tAns4,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "ONLINE TICKETING FAQ",
                style: TextStyle(
                    fontSize: 20,
                    color: tPrimaryColor,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                tQues5,
                style: TextStyle(color: tPrimaryColor, fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                tAns5,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                tQues6,
                style: TextStyle(color: tPrimaryColor, fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                tAns6,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                tQues7,
                style: TextStyle(color: tPrimaryColor, fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                tAns7,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                tQues8,
                style: TextStyle(color: tPrimaryColor, fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                tAns8,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
