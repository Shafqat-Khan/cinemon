import 'package:cinemon/common_widgets/navbar/navbar.dart';
import 'package:cinemon/constants/colors.dart';
import 'package:cinemon/features/authentication/classes/dash_board_data.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../constants/image_strings.dart';
import '../movie_details/movie_details.dart';
import 'bottom_bar.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late List<String> img = [cue, universal, cinepax];
    DashBoardData _movieData = DashBoardData();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 85),
          child: Text(
            "CINEMON",
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
        ),
        backgroundColor: tPrimaryColor,
      ),
      drawer: Navbar(),
      bottomNavigationBar: BottomBar(),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              index == 0
                  ? CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        viewportFraction: 1.0,
                      ),
                      items: img.map((item) {
                        return Container(
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        );
                      }).toList(),
                    )
                  : Container(),
              index == 0
                  ? const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "Recommended",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    )
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
                child: Card(
                  margin: EdgeInsets.only(bottom: 10),
                  color: tSecondaryColor,
                  child: Container(
                    width: double.infinity,
                    color: Colors.grey.shade900,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 250,
                          width: double.infinity,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(_movieData.images[index]),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 15),
                          child: Text(
                            _movieData.titles[index],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, bottom: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: tPrimaryColor,
                              ),
                              Text(
                                " ${_movieData.rating[index]}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "\/10",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
