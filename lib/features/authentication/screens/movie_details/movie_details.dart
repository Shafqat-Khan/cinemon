import 'package:cinemon/constants/colors.dart';
import 'package:cinemon/common_widgets/expandable_text.dart';
import 'package:cinemon/features/authentication/screens/book_ticket/book_ticket.dart';
import 'package:cinemon/features/authentication/screens/movie_details/rate_movie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({
    super.key,
    required this.title,
    required this.image,
    required this.duration,
    required this.type,
    required this.cast,
    required this.description,
    required this.date,
    required this.day,
    required this.month,
    required this.rating,
    required this.time,
  });

  final rating;
  final title;
  final image;
  final duration;
  final type;
  final cast;
  final description;
  final day;
  final date;
  final month;
  final time;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late String _text = "READ MORE";
  var maxLine = 1;
  var maxLine1 = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                widget.title.replaceRange(1, widget.title.length,
                    widget.title.substring(1).toLowerCase()),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),
            ),
            Container(
              height: 0.2,
              width: double.infinity,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.duration}, ${widget.type}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.people,
                        size: 20,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ExpandableText(
                          text: widget.cast,
                          maxLines: maxLine,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ExpandableText(
                    text: widget.description,
                    maxLines: maxLine1,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _text =
                            _text == "READ MORE" ? "READ LESS" : "READ MORE";
                        maxLine = (maxLine == 1 ? 10 : 1);
                        maxLine1 = (maxLine1 == 2 ? 100 : 2);
                      });
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        _text,
                        style: TextStyle(color: tPrimaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 0.2,
              width: double.infinity,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 30,
                        color: Colors.white,
                      ),
                      Text(
                        " ${widget.rating}",
                        style: const TextStyle(fontSize: 24),
                      ),
                      const Text(
                        "/10",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(()=>RateMovie());
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 30,
                          color: tPrimaryColor,
                        ),
                        Text(
                          "Rate Movie",
                          style: TextStyle(color: tPrimaryColor, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.day,
                  style: TextStyle(color: tPrimaryColor, fontSize: 18),
                ),
                Text(
                  widget.date,
                  style: TextStyle(
                      fontSize: 26, color: tPrimaryColor, height: 0.8),
                ),
                Text(
                  widget.month,
                  style: TextStyle(
                      fontSize: 18, color: tPrimaryColor, height: 0.8),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 3,
              width: 80,
              color: tPrimaryColor,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 55,
                  width: 150,
                  decoration: const BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      widget.time,
                      style: TextStyle(fontSize: 20, color: Colors.grey.shade50),
                    ),
                  ),
                ),
                StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: SizedBox(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: tPrimaryColor),
                            onPressed: () {
                              Get.to(()=>BookTicket(title: widget.title, image: widget.image, month: widget.month, time: widget.time, date: widget.date, day: widget.day, cinema: "CUE",));
                            },
                            child: Text("Book Now"),
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
          ],
        ),
      ),
    );
  }
}
