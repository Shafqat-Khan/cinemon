import 'package:cinemon/features/authentication/screens/login/auth_login.dart';
import 'package:get/get.dart';

import '../screens/welcome/welcome.dart';

class SplashScreenController extends GetxController{
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async{
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(Duration(milliseconds: 2400));
    Get.to(()=>const AuthPage());
  }
}