import 'package:cinemon/common_widgets/navbar/navbar.dart';
import 'package:cinemon/features/authentication/screens/book_ticket/ticket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../../constants/text_strings.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';

class BookTicket extends StatefulWidget {
  const BookTicket(
      {super.key,
      required this.title,
      required this.image,
      required this.month,
      required this.time,
      required this.date,
      required this.day,
      required this.cinema});

  final title;
  final image;
  final month;
  final time;
  final date;
  final day;
  final cinema;

  @override
  State<BookTicket> createState() => _BookTicketState();
}

class _BookTicketState extends State<BookTicket> {
  Map<String, dynamic>? paymentIntent;

  int regularQuantity = 0;
  int goldQuantity = 0;
  int platinumQuantity = 0;
  int premiumAQuantity = 0;
  int premiumBQuantity = 0;

  void incrementQuantity(String category) {
    setState(() {
      switch (category) {
        case "Regular":
          regularQuantity++;
          break;
        case "Gold":
          goldQuantity++;
          break;
        case "Platinum":
          platinumQuantity++;
          break;
        case "Premium A":
          premiumAQuantity++;
          break;
        case "Premium B":
          premiumBQuantity++;
          break;
      }
    });
  }

  void decrementQuantity(String category) {
    setState(() {
      switch (category) {
        case "Regular":
          if (regularQuantity > 0) {
            regularQuantity--;
          }
          break;
        case "Gold":
          if (goldQuantity > 0) {
            goldQuantity--;
          }
          break;
        case "Platinum":
          if (platinumQuantity > 0) {
            platinumQuantity--;
          }
          break;
        case "Premium A":
          if (premiumAQuantity > 0) {
            premiumAQuantity--;
          }
          break;
        case "Premium B":
          if (premiumBQuantity > 0) {
            premiumBQuantity--;
          }
          break;
      }
    });
  }

  Widget ticketRow(String category) => Row(
        children: [
          IconButton(
            onPressed: () {
              decrementQuantity(category);
            },
            icon:
                const Icon(Icons.remove_circle, color: Colors.white, size: 16),
          ),
          Text(
            _getQuantity(category).toString(),
            style: const TextStyle(fontSize: 16),
          ),
          IconButton(
            onPressed: () {
              incrementQuantity(category);
            },
            icon: const Icon(Icons.add_circle, color: Colors.white, size: 16),
          ),
        ],
      );

  Widget costText(String category, String cost) =>
      Text((int.parse(cost) * _getQuantity(category)).toString());

  int _getQuantity(String category) {
    switch (category) {
      case "Regular":
        return regularQuantity;
      case "Gold":
        return goldQuantity;
      case "Platinum":
        return platinumQuantity;
      case "Premium A":
        return premiumAQuantity;
      case "Premium B":
        return premiumBQuantity;
      default:
        return 0;
    }
  }

  int _getTotalPrice() {
    return regularQuantity * 2 +
        goldQuantity * 3 +
        platinumQuantity * 3 +
        premiumAQuantity * 4 +
        premiumBQuantity * 4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: tPrimaryColor,
        title: const Text(
          "Book Ticket",
          style: TextStyle(fontSize: 18),
        ),
      ),
      drawer: const Navbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 140,
                  width: 120,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.image),
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
                          widget.title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Showing on ${widget.day} ${widget.date} ${widget.month}\n${widget.time}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          widget.cinema,
                          style: TextStyle(fontSize: 20, color: tPrimaryColor),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 0.2,
              color: Colors.grey,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "SELECT TICKET",
              style: TextStyle(
                  fontSize: 28,
                  color: tPrimaryColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    "Ticket",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Cost",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Qty",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Subtotal",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black54,
              height: 290,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text("Regular"),
                          Text("Gold"),
                          Text("platinum"),
                          Text("Premium A"),
                          Text("Premium B"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text("2 \$"),
                          Text("3 \$"),
                          Text("3 \$"),
                          Text("4 \$"),
                          Text("4 \$")
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ticketRow("Regular"),
                          ticketRow("Gold"),
                          ticketRow("Platinum"),
                          ticketRow("Premium A"),
                          ticketRow("Premium B"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          costText("Regular", "2"),
                          costText("Gold", "3"),
                          costText("Platinum", "3"),
                          costText("Premium A", "4"),
                          costText("Premium B", "4"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Total: ${_getTotalPrice().toString()} \$",
                  style:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tPrimaryColor,
                    padding:
                        const EdgeInsets.symmetric(vertical: tButtonHeight + 5),
                  ),
                  onPressed: () async {
                    if (_getTotalPrice().toInt() > 0) {
                      await makePayment();
                    }
                  },
                  child: const Text("Proceed"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent('2', 'USD');

      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent!['client_secret'],
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Shafqat'))
          .then((value) {});

      displayPaymentSheet();
    } catch (e, s) {}
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          Text("Payment Successfull"),
                        ],
                      ),
                    ],
                  ),
                ));
        Get.to(() => Ticket(
              time: widget.time,
              date: widget.date,
              cost: _getTotalPrice().toString(),
              mon: widget.month,
            ));
        paymentIntent = null;
      }).onError((error, stackTrace) {});
    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $SECRET_KEY',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return jsonDecode(response.body);
    } catch (err) {}
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100;
    return calculatedAmout.toString();
  }
}
