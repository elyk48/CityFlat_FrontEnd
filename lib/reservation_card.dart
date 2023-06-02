import 'package:cityflat/entities/reservation_e.dart';
import 'package:flutter/material.dart';

class ReservationCard extends StatelessWidget {
  final Reservation reservation;

  ReservationCard({
    required this.reservation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      elevation: 2.0,
      child: ListTile(
        title: Text(
          reservation.order?.apartment?.name?.toString() ?? 'N/A',
          style: TextStyle(color: Colors.white),
        ),
        leading: Icon(
          Icons.event,
          color: reservation.paied ? Colors.green : Colors.red,
        ),
        onTap: () {
          // Handle tapping on the reservation card
          // Open a new page or dialog to display detailed reservation information
        },
        trailing: ElevatedButton(
          onPressed: () {
            // Handle "See More Details" button action
            // Open a new page or dialog to display detailed reservation information
          },
          style: ElevatedButton.styleFrom(primary: Colors.white),
          child: Text(
            'See More Details',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}