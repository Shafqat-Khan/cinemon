// ignore_for_file: use_build_context_synchronously

import 'package:cinemon/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

import '../../../../constants/sizes.dart';

class Ticket extends StatefulWidget {
  const Ticket(
      {Key? key,
      required this.date,
      required this.cost,
      required this.mon,
      required this.time})
      : super(key: key);
  final date;
  final cost;
  final mon;
  final time;

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String day = DateFormat('dd').format(currentDate);
    String month = DateFormat('MMMM').format(currentDate);
    return Scaffold(
      backgroundColor: tPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 22,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 17,
                  )
                ],
              ),
            ),
            const Text(
              "YOUR TICKET",
              style: TextStyle(fontWeight: FontWeight.w200, fontSize: 26),
            ),
            const Text(
              "Thank you for Purchase! \nSave your ticket below",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 20,
            ),
            TicketWidget(
              width: 300,
              height: 450,
              isCornerRounded: true,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 20,
                    child: ClipPath(
                      clipper: CustomClipDesign(),
                      child: Container(
                        height: 60,
                        width: 35,
                        color: Colors.blueGrey,
                        alignment: Alignment.topCenter,
                        child: Text(
                          "$month\n  $day",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.blueGrey,
                            child: CircleAvatar(
                              radius: 55,
                              backgroundImage:
                                  AssetImage("assets/images/icon.png"),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ticketDetails("Name", "shafqat"),
                                  ticketDetails("Price", widget.cost),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ticketDetails("Date", "${widget.date} ${widget.mon}"),
                                  ticketDetails("Time", widget.time),
                                ],
                              )
                            ],
                          ),
                        ]),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.blueGrey,
                    padding:
                        const EdgeInsets.symmetric(vertical: tButtonHeight + 5),
                  ),
                  onPressed: () async {
                    await saveAsPdf();
                    await Future.delayed(Duration(seconds: 2));


                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            'Downloaded',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: const Text(
                            'Thank you for purchasing the ticket!',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: Text(
                                'OK',
                                style: TextStyle(
                                  color: tPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5,
                          backgroundColor: Colors.blueGrey,
                        );
                      },
                    );
                  },
                  child: const Text("SAVE"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> saveAsPdf() async {
    // Get the temporary directory
    final directory = await getTemporaryDirectory();

    // Create a PDF document
    final pdf = pw.Document();

    // Add the Container to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Container(
            height: 100,
            width: 100,
            color: PdfColors.yellow,
          ),
        ),
      ),
    );

    // Save the PDF to a file
    final output = File('${directory.path}/container.pdf');
    await output.writeAsBytes(await pdf.save());

    print('PDF saved at: ${output.path}');
  }

  Widget ticketDetails(String text, String details) => Column(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 40,
            width: 65,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5)),
            child: Text(
              details,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                  color: Colors.red,
                  fontWeight: FontWeight.w800),
            ),
          )
        ],
      );
}

class CustomClipDesign extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double h = size.height;
    double w = size.width;

    path.lineTo(0, h - 15);
    path.lineTo(w / 4, h);
    path.lineTo(w / 2, h - 15);
    path.lineTo(w / 1.5, h);
    path.lineTo(w, h - 15);
    path.lineTo(w, 3);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
