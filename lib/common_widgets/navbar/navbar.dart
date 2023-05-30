import 'package:cinemon/features/authentication/screens/cinemas/cinemas.dart';
import 'package:cinemon/features/authentication/screens/dash_board/dash_board.dart';
import 'package:cinemon/features/authentication/screens/food.dart';
import 'package:cinemon/features/authentication/screens/settings/account_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/colors.dart';
import '../../features/authentication/screens/movies/movies.dart';
import '../../features/authentication/screens/welcome/welcome.dart';
import 'navbar_settings.dart';

class Navbar extends StatefulWidget {
  const Navbar({
    super.key,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedButtonIndex = 1;
  late SharedPreferences _prefs;


  @override
  void initState() {
    super.initState();
    loadSelectedButtonIndex();
  }

  Future<void> loadSelectedButtonIndex() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedButtonIndex = _prefs.getInt('selectedButtonIndex') ?? 0;
    });
  }

  Future<void> saveSelectedButtonIndex(int index) async {
    setState(() {
      selectedButtonIndex = index;
    });
    await _prefs.setInt('selectedButtonIndex', index);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.grey.shade900,
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 22, top: 15, bottom: 10),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              const NavbarSettings(),
              SizedBox(
                height: 10,
              ),
              StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 10,
                    );
                  } else {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          backgroundColor: tPrimaryColor,
                        ),
                        onPressed: () {
                          saveSelectedButtonIndex(-1);
                          Get.to(() => const Welcome());
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'Sign in or Sign up',
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
          SizedBox(
            height: 10,
          ),
              Container(height: 1,width: 260,color: Colors.grey,),
              SizedBox(
                height: 20,
              ),
              TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 24,
                      color: tPrimaryColor,
                      width: selectedButtonIndex == 0 ? 5 : 0,
                    ),
                    Text(
                      selectedButtonIndex == 0 ? "   Home" : "Home",
                      style: TextStyle(
                        fontSize: 20,
                        color: selectedButtonIndex == 0
                            ? tPrimaryColor
                            : Colors.white,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  saveSelectedButtonIndex(0);
                  Get.to(() => DashBoard());
                },
              ),
              TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 24,
                      color: tPrimaryColor,
                      width: selectedButtonIndex == 1 ? 5 : 0,
                    ),
                    Text(
                      selectedButtonIndex == 1 ? "   Movies" : "Movies",
                      style: TextStyle(
                        fontSize: 20,
                        color: selectedButtonIndex == 1
                            ? tPrimaryColor
                            : Colors.white,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  saveSelectedButtonIndex(1);
                  Get.to(() => Movies());
                },
              ),
              TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 24,
                      color: tPrimaryColor,
                      width: selectedButtonIndex == 2 ? 5 : 0,
                    ),
                    Text(
                      selectedButtonIndex == 2 ? "   Cinemas" : "Cinemas",
                      style: TextStyle(
                        fontSize: 20,
                        color: selectedButtonIndex == 2
                            ? tPrimaryColor
                            : Colors.white,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  saveSelectedButtonIndex(2);
                  Get.to(() => Cinemas());
                },
              ),
              TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 24,
                      color: tPrimaryColor,
                      width: selectedButtonIndex == 3 ? 5 : 0,
                    ),
                    Text(
                      selectedButtonIndex == 3
                          ? "   Food & Drinks"
                          : "Foods & Drinks",
                      style: TextStyle(
                        fontSize: 20,
                        color: selectedButtonIndex == 3
                            ? tPrimaryColor
                            : Colors.white,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  saveSelectedButtonIndex(3);
                  Get.to(() => Food());
                },
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 1,
                      width: 280,
                      color: Colors.grey,
                    ),
                    TextButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Get.to(Welcome());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          Text(
                            "  Log Out",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
