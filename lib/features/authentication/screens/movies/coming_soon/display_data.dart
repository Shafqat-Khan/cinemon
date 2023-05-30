import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../classes/coming_soon_data.dart';

class CDisplayData extends StatelessWidget {
  const CDisplayData({
    super.key,
    required this.movieData, required this.index,
  });
  final index;
  final ComingSoonData movieData;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      color: tSecondaryColor,
      child: Container(
        height: 140,
        width: double.infinity,
        color: Colors.white10,
        child: Row(
          children: [
            SizedBox(
              height: 140,
              width: 120,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(movieData.images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      movieData.titles[index],
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      movieData.duration[index],
                      style: const TextStyle(color: Colors.white60),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: tPrimaryColor,
                        ),
                        Text(
                          ' ${movieData.rating[index]}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Text("\/10",style: TextStyle(fontSize: 12),),
                      ],
                    ),
                    Text(
                      movieData.cinema[index],
                      style: TextStyle(fontSize: 10,color: tPrimaryColor),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}