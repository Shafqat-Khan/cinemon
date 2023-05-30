import 'package:cinemon/features/authentication/classes/coming_soon_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constants/colors.dart';
import '../../movie_details/movie_details.dart';
import 'display_data.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  @override
  Widget build(BuildContext context) {
    ComingSoonData _movieData = ComingSoonData();
    return ListView.builder(
      itemCount: _movieData.titles.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            index == 0
                ? const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 20, bottom: 15),
                      child: Text(
                        "Friday 12 May",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ))
                : Container(),
            index == 2
                ? const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 20, bottom: 15),
                      child: Text(
                        "Friday 15 May",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ))
                : Container(),
            index == 6
                ? const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 20, bottom: 15),
                      child: Text(
                        "Saturday 16 May",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ))
                : Container(),
            index == 9
                ? const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 20, bottom: 15),
                      child: Text(
                        "Sunday 17 May",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ))
                : Container(),
            GestureDetector(
              onTap: () {
                Get.to(() => MovieDetails(
                      title: _movieData.titles[index],
                      image: _movieData.images[index],
                      duration: _movieData.duration[index],
                      cast: _movieData.cast[index],
                      date: _movieData.date[index],
                      description: _movieData.description[index],
                      type: _movieData.type[index],
                      day: _movieData.day[index],
                      month: _movieData.month[index],
                      rating: _movieData.rating[index],
                      time: _movieData.time[index],
                    ));
              },
              child: CDisplayData(movieData: _movieData, index: index),
            ),
          ],
        );
      },
    );
  }
}
