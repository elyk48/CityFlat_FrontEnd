import 'package:cityflat/payment_page.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final String title;
  final String state;
  final String orderId;
  final bool isPaid;

  const OrderCard({
    required this.title,
    required this.state,
    required this.orderId,
    required this.isPaid,
  });

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    Color iconColor;

    switch (state) {
      case 'PENDING':
        iconData = Icons.schedule;
        iconColor = Colors.yellow;
        break;
      case 'ACCEPTED':
        iconData = Icons.check_circle;
        iconColor = Colors.green;
        break;
      case 'DECLINED':
        iconData = Icons.cancel;
        iconColor = Colors.red;
        break;
      default:
        iconData = Icons.error;
        iconColor = Colors.white;
        break;
    }

    return Card(
      color: Colors.black,
      elevation: 2.0,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        leading: Icon(
          iconData,
          color: iconColor,
        ),
        onTap: () {
          // Handle tapping on the reservation card
          // Open a new page or dialog to display detailed order information
        },
        trailing: isPaid
            ? Text(
          'Paid',
          style: TextStyle(color: Colors.green),
        )
            : state == 'ACCEPTED'
            ? ElevatedButton(
          onPressed: () {
            // Handle the "Pay Now" button action
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentPage(orderId: orderId),
              ),
            );
          },
          style: ElevatedButton.styleFrom(primary: Colors.white),
          child: Text(
            'Pay Now',
            style: TextStyle(color: Colors.black),
          ),
        )
            : SizedBox.shrink(),
      ),
    );
  }
}