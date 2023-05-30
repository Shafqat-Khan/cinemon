import 'package:cinemon/constants/colors.dart';
import 'package:cinemon/features/authentication/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user)  async {
    await _db.collection("Users").add(user.toJson()).whenComplete(() => Get.snackbar(
        "Signed Up!", "Signed Up Successful",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.grey.withOpacity(0.8),
        colorText: tPrimaryColor));
  }
  loginUser(String email, String password) async {
    var query = await _db.collection("Users")
        .where("Email", isEqualTo: email)
        .where("Password", isEqualTo: password)
        .get();

    return query.docs.isNotEmpty;
  }

  checkUser(String email) async {
    var query = await _db.collection("Users")
        .where("Email", isEqualTo: email)
        .get();
    print(query.docs);

    return query.docs.isNotEmpty;
  }

}
