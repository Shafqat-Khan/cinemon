import 'package:cinemon/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class SignupBottomBar extends StatefulWidget {
  var pEmail;

  var pPass;

  var pFullName;

  var pLastName;

  var pPhoneNo;

  var pAddress;

  var pGender;

  SignupBottomBar({Key? key, required this.pEmail, required this.pPass, required this.pFullName, required this.pLastName, required this.pPhoneNo, required this.pAddress, required this.pGender}) : super(key: key);

  @override
  _SignupBottomBarState createState() => _SignupBottomBarState();
}

class _SignupBottomBarState extends State<SignupBottomBar> {
  bool value = false;

  get pEmail => null;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 120,
      color: Colors.white10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(
                value: value,
                checkColor: Colors.white,
                activeColor: Colors.amber,
                onChanged: (bool? newValue) {
                  if (newValue != null) {
                    setState(() {
                      value = newValue;
                    });
                  }
                },
              ),
              Text(tTermnConditions),
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
                  padding:
                  const EdgeInsets.symmetric(vertical: tButtonHeight + 5),
                ),
                onPressed: () {

                  // final user = UserModel(email: pEmail, password: pPass, fName: fName, sName: sName, phoneNo: phoneNo, address: address, gender: gender);
                },
                child: Text(
                  tSignup.toUpperCase(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
