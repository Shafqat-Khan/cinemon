import 'package:flutter/material.dart';

class SeatSelectionPage extends StatefulWidget {
  @override
  _SeatSelectionPageState createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  late List<List<bool>> seatStatus;

  @override
  void initState() {
    super.initState();
    initializeSeatStatus();
  }

  void initializeSeatStatus() {
    seatStatus = List.generate(
      6,
          (_) => List.generate(10, (_) => true), // Number of seats in each row
    );
  }

  void toggleSeatStatus(int row, int seat) {
    setState(() {
      seatStatus[row][seat] = !seatStatus[row][seat];
    });
  }

  Widget buildSeat(int row, int seat) {
    final seatSize = 15.0;
    final seatColor = seatStatus[row][seat] ? Colors.green : Colors.red;

    return GestureDetector(
      onTap: () {
        toggleSeatStatus(row, seat);
      },
      child: Container(
        width: seatSize,
        height: seatSize,
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: seatColor,
        ),
      ),
    );
  }

  Widget buildRow(int row, int rowSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        rowSize,
            (seat) => buildSeat(row, seat),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seat Selection'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Screen',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.black),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Column(
              children: List.generate(
                2, // Number of rows
                    (row) => buildRow(row,10),
              ),
            ),
            Column(
              children: List.generate(
                2, // Number of rows
                    (row) => buildRow(row,5),
              ),
            ),
          ],),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: List.generate(
                  4, // Number of rows
                      (row) => buildRow(row,10),
                ),
              ),
              Column(
                children: List.generate(
                  4, // Number of rows
                      (row) => buildRow(row,5),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: List.generate(
                  2, // Number of rows
                      (row) => buildRow(row,10),
                ),
              ),
              Column(
                children: List.generate(
                  2, // Number of rows
                      (row) => buildRow(row,5),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: List.generate(
                  3, // Number of rows
                      (row) => buildRow(row,9),
                ),
              ),Column(
                children: List.generate(
                  3, // Number of rows
                      (row) => buildRow(row,5),
                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: List.generate(
                  1, // Number of rows
                      (row) => buildRow(row,9),
                ),
              ),
              Column(
                children: List.generate(
                  1, // Number of rows
                      (row) => buildRow(row,5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
