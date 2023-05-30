import 'package:cinemon/common_widgets/navbar/navbar.dart';
import 'package:cinemon/constants/colors.dart';
import 'package:cinemon/constants/text_strings.dart';
import 'package:cinemon/features/authentication/screens/settings/options/change_password.dart';
import 'package:cinemon/features/authentication/screens/settings/options/feedback.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/image_strings.dart';
import '../welcome/welcome.dart';
import 'build_inkwell.dart';
import 'options/about_us.dart';
import 'options/privacy_policy.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var h = height * 0.46;
    return Scaffold(
      backgroundColor: Colors.black54,
      drawer: const Navbar(),
      appBar: AppBar(
        backgroundColor: tPrimaryColor,
        title: const Text("Account"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SizedBox(
                  height: height * 0.13,
                  child: const Image(image: AssetImage(tProfileLogo))),
            ),
            const Text(
              tProfile,
              style: TextStyle(
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const SizedBox(
                    height: 30,
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          backgroundColor: tPrimaryColor,
                        ),
                        onPressed: () {
                          Get.to(() => const Welcome());
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'Sign in or Sign up',
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: h,
                width: width * 0.93,
                color: Colors.white10,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // StreamBuilder<User?>(
                      //   stream: FirebaseAuth.instance.authStateChanges(),
                      //   builder: (context, snapshot) {
                      //     if (snapshot.hasData) {
                      //       return Padding(
                      //         padding:
                      //             const EdgeInsets.symmetric(vertical: 6.0),
                      //         child: Container(
                      //           width: double.infinity,
                      //           padding: const EdgeInsets.only(bottom: 15),
                      //           decoration: const BoxDecoration(
                      //             border: Border(
                      //               bottom: BorderSide(
                      //                   width: 0.9, color: Colors.grey),
                      //             ),
                      //           ),
                      //           child: InkWell(
                      //             onTap: () {
                      //               Get.to(() => MyProfile());
                      //             },
                      //             child: Row(
                      //               mainAxisSize: MainAxisSize.min,
                      //               children: const [
                      //                 Icon(
                      //                   Icons.update,
                      //                   size: 24,
                      //                   color: Colors.white,
                      //                 ),
                      //                 SizedBox(width: 15),
                      //                 Text(
                      //                   "Don't Click ME!",
                      //                   style: TextStyle(fontSize: 18),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       );
                      //     } else {
                      //       return Container();
                      //     }
                      //   },
                      // ),
                      StreamBuilder<User?>(
                        stream: FirebaseAuth.instance.authStateChanges(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 6.0),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.only(bottom: 15),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 0.9, color: Colors.grey),
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => ChangePassword());
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(
                                        Icons.lock,
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        "Change Password",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(bottom: 15),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 0.9, color: Colors.grey),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => PrivacyPolicy());
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(
                                  Icons.privacy_tip,
                                  size: 24,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 15),
                                Text(
                                  "Privacy Policy",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(bottom: 15),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 0.9, color: Colors.grey),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => AboutUs());
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(
                                  Icons.question_mark_rounded,
                                  size: 24,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 15),
                                Text(
                                  "About",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(bottom: 15),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                              BorderSide(width: 0.9, color: Colors.grey),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => FeedbackPage());
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(
                                  Icons.feedback,
                                  size: 24,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 15),
                                Text(
                                  "Feedback",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      StreamBuilder<User?>(
                        stream: FirebaseAuth.instance.authStateChanges(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6.0),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.only(bottom: 15),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 0.9, color: Colors.grey))),
                                child: InkWell(
                                  onTap: () {
                                    FirebaseAuth.instance.signOut();
                                    Get.to(const Welcome());
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(
                                        Icons.logout,
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        "Log Out",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
