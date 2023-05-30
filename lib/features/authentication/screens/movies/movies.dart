import 'package:cinemon/constants/colors.dart';
import 'package:cinemon/features/authentication/screens/movies/now_showing/now_showing.dart';
import 'package:flutter/material.dart';
import '../../../../common_widgets/navbar/navbar.dart';
import 'coming_soon/coming_soon.dart';

class Movies extends StatelessWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // number of tabs
      child: Scaffold(
        backgroundColor: Colors.black,
        drawer: const Navbar(),
        appBar: AppBar(
          title: const Text("MOVIES"),
          backgroundColor: tPrimaryColor,
          bottom: const TabBar(
            tabs: [
              Tab(text: "NOW SHOWING"),
              Tab(text: "COMING SOON"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            NowShowing(), // add a widget for the second tab here
            ComingSoon(),
          ],
        ),
      ),
    );
  }
}
