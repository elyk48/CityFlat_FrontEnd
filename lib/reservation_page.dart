import 'dart:convert';

import 'package:cityflat/controllers/user_controller.dart';
import 'package:cityflat/entities/order_e.dart';
import 'package:cityflat/reservation_card.dart';
import 'package:cityflat/session.dart';
import 'package:flutter/material.dart';

import 'controllers/reservation_controller.dart';
import 'entities/apartment_e.dart';
import 'entities/card_e.dart';
import 'entities/reservation_e.dart';
import 'entities/service_e.dart';
import 'entities/user_e.dart';
import 'order_card.dart';
class ReservationPage extends StatefulWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}



class _ReservationPageState extends State<ReservationPage> {


  List<Order> _ordersFromServer = [];
  List<Reservation> _reservationsFromServer = [];
  @override
  void initState()   {
    setState(() {
      fetchOrders().then((value) => {
        setState(() {
          _ordersFromServer=value;
        }),

      });
      fetchReservations().then((result) => {
        setState(() {
          _reservationsFromServer=result;
        }),

      });

    });

    super.initState();
  }
  UserE user = new UserE.noarg();


  void refreshReservationPage() {
    setState(() {
      fetchOrders().then((value) => {
        setState(() {
          _ordersFromServer=value;
        }),

      });
      fetchReservations().then((result) => {
        setState(() {
          _reservationsFromServer=result;
        }),

      });

    });

  }
  Future<List<Order>> fetchOrders() async {
    await Session.getUser_from_prefs(user).then((value) => user = value);

    List<dynamic> orders = [];
    await UserController.getMyOrders(user).then((value) async {
      print(value.body);
      orders = jsonDecode(value.body);
    });
    //print(orders.toString());

    List<Order> _Orders = [];

    for (int i = 0; i < orders.length; i++) {

        Map<String, dynamic> ordersData = orders[i];

        UserE user = UserE.fromJson(ordersData['User']);

        double totalPrice = ordersData["totalPrice"].toDouble();
        double servicesFee = ordersData["servicesFee"].toDouble(); // Convert int to double
        double nightsFee = ordersData["nightsFee"].toDouble(); // Convert int to double

        _Orders.add(
          Order(
            ordersData["id"],
            user,
            Apartment.fromJson(ordersData["appartment"]),
            ordersData["description"],
            totalPrice,
            ordersData["checkIn"],
            ordersData["checkOut"],
            servicesFee, // Use the converted value
            nightsFee, // Use the converted value
            ordersData["isPaied"],
            List<service>.from(
              (ordersData["services"] as List<dynamic>)
                  .map((serviceJson) => service.fromJson(serviceJson))
                  .toList(),
            ),
            ordersData["state"],
          ),
        );

    }

    return _Orders;
  }



  Future<List<Reservation>> fetchReservations() async {
    await Session.getUser_from_prefs(user).then((value) => user = value);

    List<dynamic> reservations = [];
    await ReservationController.getMyReservations(user.token).then((value) async {
      print(value.body);
      reservations = jsonDecode(value.body);
    });

    List<Reservation> fetchedReservations = [];

    for (int i = 0; i < reservations.length; i++) {
      Map<String, dynamic> reservationData = reservations[i];


      Reservation reservation = Reservation(
        reservationData['Order'] != null ? Order.fromJson(reservationData['Order']) : null,
        reservationData['code'] != null ? int.parse(reservationData['code']) : 0,
        reservationData['paied'] != null ? reservationData['paied'] : false,
        reservationData['Card'] != null ? UserCard.fromJson(reservationData['Card']) : null,
      );

      fetchedReservations.add(reservation);
    }

    return fetchedReservations;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(

        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0, bottom: 8.0),
            child: Center(
              child: Text(
                'Reservation History',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4, // Adjust the height as needed
            child: ListView.builder(
              itemCount: _ordersFromServer.length,
              itemBuilder: (BuildContext context, int index) {
                return OrderCard(
                  title: _ordersFromServer[index].apartment.name.toString(),
                  state: _ordersFromServer[index].state,
                  orderId: _ordersFromServer[index].id,
                  isPaid: _ordersFromServer[index].isPaied,
                 refreshCallback: refreshReservationPage
                );
              },
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top:2),
            child: Center(
              child: Text(
                'Reservations',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5, // Adjust the height as needed
            child: ListView.builder(
              itemCount: _reservationsFromServer.length,
              itemBuilder: (BuildContext context, int index) {
                return ReservationCard(reservation: _reservationsFromServer[index],);
              },
            ),
          ),
        ],
      ),
    );
  }
}

