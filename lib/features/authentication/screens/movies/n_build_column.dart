import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' show parse;

import '../../../../constants/colors.dart';

class NBuildColumn extends StatefulWidget {
  const NBuildColumn({Key? key}) : super(key: key);

  @override
  State<NBuildColumn> createState() => _NBuildColumnState();
}

class _NBuildColumnState extends State<NBuildColumn> {
  late List<String> titles = [];
  late List<String> images = [];

  @override
  void initState() {
    super.initState();
    getWebsiteData();
  }

  Future<void> getWebsiteData() async {
    var response = await http
        .get(Uri.parse('https://cuecinemas.com/Browsing/Movies/NowShowing'));
    dom.Document document = parse(response.body);
    for (int i = 1; i <= 10; i++) {
      final titleElements = document.querySelectorAll(
          // '#movies-list > div:nth-child($i) > div.item-details > div > div > a > h3'
          '#movies-list > div:nth-child($i) > div.image-outer > a'
      );
      if (titleElements.isNotEmpty) {
        final title = titleElements.map((element) => element.text).toList();
        titles.addAll(title);
      }
  print(titles);
      final imageElements = document.querySelectorAll(
          '#movies-list > div:nth-child($i) > div.image-outer > img');
      if (imageElements.isNotEmpty) {
        final image = imageElements.map((element) => element.attributes['src']!).toList();
        images.addAll(image);
      }
      print(images);
    }
  }

  String? extractVideoIdFromUrl(String url) {
    RegExp regExp = RegExp(
      r'^https:\/\/www\.youtube\.com\/watch\?v=([\w-]+)',
      caseSensitive: false,
      multiLine: false,
    );
    RegExpMatch? match = regExp.firstMatch(url);
    if (match != null && match.groupCount >= 1) {
      return match.group(1);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    String url =
        ''; // replace with your own URL
    String? videoId = extractVideoIdFromUrl(url);
    print(images);
    return
      ListView.builder(
        itemCount: titles.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.only(top: 10),
            color: tSecondaryColor,
            child: Container(
              height: 140,
              // width: double.infinity,
              color: Colors.white10,
              child: Row(
      children: [
        const SizedBox(
          height: 140,
          width: 120,
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                      "https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg?auto=compress&cs=tinysrgb&w=1600"
                ),
                // image: NetworkImage(
                //   "https://img.youtube.com/vi/$videoId/maxresdefault.jpg",
                // ),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.play_arrow,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              if (titles.isNotEmpty)

                Text(
                  titles[index].trim(),
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              const Text(
                "1h 56m, Action, crime",
                style: TextStyle(color: Colors.white60),
              ),
              const Text("9.3/10"),
            ],
          ),
        ),
      ],
    )));});
  }
}
