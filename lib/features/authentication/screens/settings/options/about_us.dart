import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back)),
          backgroundColor: tPrimaryColor,
          title: const Text("About Us"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 16.0,right: 16, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Cinemon App',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Welcome to the Cinemon app, your ultimate movie companion! We are dedicated to bringing you the best movie-watching experience right at your fingertips.',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Features:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  ' Browse a vast collection of movies, including popular releases and classics.',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  '- View detailed information about each movie, such as synopsis, cast, and ratings.',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  '- Find nearby cinemas and showtimes for your favorite movies.',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  '- Create and manage your watchlist to keep track of movies you want to see.',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Contact Us:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Email: info@cinemaapp.com',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  'Phone: 123-456-7890',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
