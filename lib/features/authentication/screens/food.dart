import 'package:cinemon/constants/colors.dart';
import 'package:flutter/material.dart';

class Food extends StatelessWidget {
  const Food({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
            Navigator.pop(context);
          },),
          title: Text("Food and Drinks"),
          backgroundColor: tPrimaryColor,
        ),
        backgroundColor: tSecondaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildRow("Salty Junior Deal", "450","Salty Medium Deal","500"),
              buildRow("Salty Large Deal", "550","Mix Junior Deal","550"),
              buildRow("Mix Medium Deal", "650","Mix Large Deal","850"),
              buildRow("Salty Junior", "300","Salty Medium","350"),
            ],
          ),
        ));
  }

  Widget buildRow(deal1, price1, deal2, price2) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          foodDetails(deal1, price1),
          foodDetails(deal2, price2),
        ],
      );

  Widget foodDetails(deal, price) => Column(
        children: [
          Image.network(
              width: 200,
              height: 250,
              "https://media.istockphoto.com/id/1070208876/photo/popcorn-and-soda.jpg?s=612x612&w=0&k=20&c=RtSA7OT2vy2TcX0qHcIfTigwKIaVW2nWBuFf3yom4_g="),
          Text(deal),
          Text(
            "PKR $price",
            style: TextStyle(color: tPrimaryColor, fontWeight: FontWeight.bold),
          )
        ],
      );
}
