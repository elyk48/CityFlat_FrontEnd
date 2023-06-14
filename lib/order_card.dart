import 'package:cityflat/controllers/dialog_controller.dart';
import 'package:cityflat/controllers/reservation_controller.dart';
import 'package:cityflat/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderCard extends StatefulWidget {
  final String title;
  final String state;
  final String orderId;
  final bool isPaid;
  final Function() refreshCallback;

  const OrderCard({
    required this.title,
    required this.state,
    required this.orderId,
    required this.isPaid,
    required this.refreshCallback,
  });

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  Future<void> declineOrder(String orderId) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      String? userToken = prefs.getString('user_token');

      if (userToken == null) {
        throw Exception('User token not found');
      }

      var response = await ReservationController.UserDelcineOrder(userToken, orderId);

      if (response.statusCode == 200) {
        DialogController.showAlertDialog(
          context,
          'Order Declined',
          'The order has been declined successfully.',
        );

        // Refresh the widget after declining the order
        widget.refreshCallback();
      } else {
        throw Exception('Failed to decline order. body: ${response.body}');
      }
    } catch (error) {
      print('Error declining order: $error');
      throw Exception('Failed to decline order');
    }
  }

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    Color iconColor;
    bool isPending = widget.state == 'PENDING';

    switch (widget.state) {
      case 'PENDING':
        iconData = Icons.schedule;
        iconColor = Colors.black;
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
      color: Colors.white,
      elevation: 2.0,
      child: ListTile(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black), // Set title text color to black
        ),
        leading: Icon(
          iconData,
          color: iconColor,
        ),
        onTap: () {
          // Handle tapping on the reservation card
          // Open a new page or dialog to display detailed order information
        },
        trailing: widget.isPaid
            ? Text(
          'Paid',
          style: TextStyle(color: Colors.green),
        )
            : isPending
            ? ElevatedButton(
          onPressed: () {
            try {
              declineOrder(widget.orderId);
            } catch (error) {
              // Handle any error occurred during the decline process
              print('Error declining order: $error');
            }
          },
          style: ElevatedButton.styleFrom(primary: Colors.red),
          child: Text(
            'Decline',
            style: TextStyle(color: Colors.white),
          ),
        )
            : widget.state == 'ACCEPTED'
            ? ElevatedButton(
          onPressed: () {
            // Navigate to the payment page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaymentPage(orderId: widget.orderId)),
            );
          },
          style: ElevatedButton.styleFrom(primary: Colors.black),
          child: Text(
            'Pay Now',
            style: TextStyle(color: Colors.white),
          ),
        )
            : SizedBox.shrink(),
      ),
    );
  }
}