import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/colors.dart';
import '../../features/authentication/screens/settings/account_settings.dart';
class NavbarSettings extends StatelessWidget {
  const NavbarSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const AccountSettings());
      },
      child: Card(
        color: tSecondaryColor,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: tSecondaryColor,
                  offset: Offset(0, 2),
                  blurRadius: 6),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Account & Settings",
                      style: TextStyle(
                          fontSize: 20, color: tPrimaryColor),
                    ),
                    Text("View notifications and \n settings")
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
