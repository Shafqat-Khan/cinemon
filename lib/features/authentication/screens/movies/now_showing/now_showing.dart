import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constants/colors.dart';
import '../../../classes/now_showing_data.dart';
import '../../movie_details/movie_details.dart';
import '../now_showing/display_data.dart';

class NowShowing extends StatefulWidget {
  const NowShowing({Key? key}) : super(key: key);

  @override
  State<NowShowing> createState() => _NowShowingState();
}

class _NowShowingState extends State<NowShowing> {
  @override
  Widget build(BuildContext context) {
    NowShowingData _movieData = NowShowingData();
    return ListView.builder(
      itemCount: _movieData.titles.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
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
          child: NDisplayData(movieData: _movieData, index: index),
        );
      },
    );
  }
}
