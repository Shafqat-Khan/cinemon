import 'package:cinemon/constants/colors.dart';
import 'package:cinemon/constants/image_strings.dart';
import 'package:cinemon/constants/text_strings.dart';
import 'package:cinemon/features/authentication/controllers/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.amber.shade500, Colors.amber.shade700])),
      child: Stack(children: [
        Obx(
          () => AnimatedPositioned(
              duration: Duration(milliseconds: 1600),
              top: 100,
              left: splashController.animate.value ? 30 : -200,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 1600),
                opacity: splashController.animate.value ? 1 : 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        tAppSlogan,
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black45,
                            height: 1,
                            fontWeight: FontWeight.bold),
                        // style: Theme.of(context)
                        //     .textTheme
                        //     .displaySmall
                        //     ?.copyWith(color: Colors.black54)
                        //     ?.copyWith(height: 1)
                      )
                    ]),
              )),
        ),
        Obx(
          () => AnimatedPositioned(
              duration: Duration(milliseconds: 2400),
              left: 50,
              bottom: splashController.animate.value ? 300 : 0,
              child: AnimatedOpacity(
                  duration: Duration(milliseconds: 2400),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: Image(image: AssetImage(tSplashLogo), width: 300))),
        ),
      ]),
    ));
  }
}
