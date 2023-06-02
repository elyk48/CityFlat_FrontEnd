import 'package:cityflat/entities/user_e.dart';
import 'package:cityflat/paypal_payment.dart';
import 'package:cityflat/session.dart';
import 'package:flutter/material.dart';

import 'controllers/reservation_controller.dart';
import 'package:http/http.dart' as http;

class PaymentPage extends StatefulWidget {
  final String orderId;

  const PaymentPage({required this.orderId});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late UserE user = UserE.noarg();
  final _formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String expMonth = '';
  String expYear = '';
  String cvc = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the card number';
                  }
                  return null;
                },
                onChanged: (value) {
                  cardNumber = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Expiration Month',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the expiration month';
                  }
                  return null;
                },
                onChanged: (value) {
                  expMonth = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Expiration Year',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the expiration year';
                  }
                  return null;
                },
                onChanged: (value) {
                  expYear = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'CVC',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the CVC';
                  }
                  return null;
                },
                onChanged: (value) {
                  cvc = value;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate() ) {



                      final paymentData = {
                        'Order': {'id': widget.orderId},
                        'Card': {
                          'number': cardNumber,
                          'exp_month': expMonth,
                          'exp_year': expYear,
                          'cvc': cvc,
                        },
                      };
                      await Session.getUser_from_prefs(user)
                          .then((value) => user = value)
                          .catchError((error) {
                        // Handle the error here
                        print('Error occurred while getting user from prefs: $error');
                      });

                      http.Response response = await ReservationController.CreateReservation(widget.orderId, cardNumber, expMonth, expYear, cvc, user.token);

                      if (response.statusCode == 200 || response.statusCode == 201) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Payment Successfully Transmitted"),
                              actions: [
                                TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Close the dialog
                                    Navigator.pop(context, '/ReservationPage'); // Replace current route with the new route
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        // Status code is not 200 or 201, handle the error
                        print("Error: ${response.body}");
                      }


                  }
                },
                style: ElevatedButton.styleFrom(primary: Colors.white),
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  final orderId = widget.orderId; // Store the value of widget.orderId
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  PaypalPayment(
                        orderId:orderId,
                        ),
                      ));
                },
                style: ElevatedButton.styleFrom(primary: Colors.white),
                child: Text(
                  'Pay with PayPal',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  }