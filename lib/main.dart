import 'package:cinemon/features/authentication/screens/settings/account_settings.dart';
import 'package:cinemon/features/authentication/screens/signup/signup_screen.dart';
import 'package:cinemon/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:cinemon/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'features/authentication/screens/food.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "pk_test_51N6UYrKtYHKgnHltqkROYX9ifMPgeYNMBRvUm8lwM1ZES8UDA6fE8ztCh40owhyWj687XMwl4NqibSbOuD7m03yU005WDJZieR";
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}
