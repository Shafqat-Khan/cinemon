

import 'package:cinemon/features/authentication/auth/user_repo.dart';
import 'package:cinemon/features/authentication/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final fName = TextEditingController();
  final sName = TextEditingController();
  final phoneNo= TextEditingController();
  final address = TextEditingController();
  final gender = TextEditingController();
  bool isLoggedIn = false;
  final userRepo = Get.put(UserRepo());
  void registerUser(String email, String password){

  }
  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
  }
  Future<bool> login(String email, String password) async {
    bool success = await userRepo.loginUser(email, password);
    print(success);
    isLoggedIn = success;
    print(isLoggedIn);
    return isLoggedIn;
  }
  Future<bool> checkEmail(String email) async {
    bool success = await userRepo.checkUser(email);
    print(success);
    isLoggedIn = success;
    print(isLoggedIn);
    return isLoggedIn;
  }
}