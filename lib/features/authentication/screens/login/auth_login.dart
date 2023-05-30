import 'package:cinemon/features/authentication/screens/dash_board/dash_board.dart';
import 'package:cinemon/features/authentication/screens/login/login_form_widget.dart';
import 'package:cinemon/features/authentication/screens/login/login_screen.dart';
import 'package:cinemon/features/authentication/screens/welcome/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../movies/movies.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return const DashBoard();
          }
          else{
            return Welcome();
          }
        },
      ),
    );
  }
}
