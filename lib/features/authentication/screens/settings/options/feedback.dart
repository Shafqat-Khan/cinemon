import 'package:cinemon/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackPage extends StatefulWidget {
  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController _feedbackController = TextEditingController();
  User? _user = FirebaseAuth.instance.currentUser;
  double _rating = 0.0;
  String _feedback = "";
  Color rat = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tSecondaryColor,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        backgroundColor: tPrimaryColor,
        title: const Text("Feedback"),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'We would love to hear your feedback!',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Tell us what you think about the app:',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 30.0,
              itemBuilder: (context, index) {
                return Icon(
                  Icons.star,
                  color: tPrimaryColor,
                );
              },
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _feedbackController,
              maxLines: 5,
              cursorColor: tPrimaryColor,
              cursorHeight: 22,
              style: TextStyle(color: Colors.white, fontSize: 18),
              decoration: const InputDecoration(
                hintText: 'Additional comments',
                hintStyle: TextStyle(color: Colors.white30),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    submitFeedback();
                  },
                  child: const Text('Submit Feedback'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tPrimaryColor,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    fetchFeedback();
                  },
                  child: const Text('Previous Feedback'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tPrimaryColor,

                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void fetchFeedback() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('feedback').get();

      querySnapshot.docs.forEach((document) {
        Map<String, dynamic> feedbackData =
            document.data() as Map<String, dynamic>;
        if (feedbackData.containsKey('rating') &&
            feedbackData['rating'] is double) {
          double rating = feedbackData['rating'] as double;
          String? feedback = feedbackData['message'] as String?;
          String? user = feedbackData['user'] as String?;

          if (user == _user?.email) {
            print(feedback);
            setState(() {
              _feedbackController.text = feedback!;
              _rating = rating;
              print(feedback);
            });
          }
        }
      });
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Error',
            style: TextStyle(color: Colors.red),
          ),
          content: Text('Failed to fetch feedback. Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'OK',
                style: TextStyle(color: tPrimaryColor),
              ),
            ),
          ],
        ),
      );
    }
  }

  void submitFeedback() {
    _feedback = _feedbackController.text;
    final _user = this._user;
    if (_user != null) {
      print(_user);
      FirebaseFirestore.instance.collection('feedback').add({
        'message': _feedback,
        'rating': _rating,
        "user": _user.email
      }).then((value) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Thank you!'),
            content: const Text('Your feedback has been submitted.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }).catchError((error) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to submit feedback. Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Please sign in to submit feedback.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
