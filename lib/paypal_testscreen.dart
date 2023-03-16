
import 'package:cityflat/payment_next_screen.dart';
import 'package:flutter/material.dart';
class PaypalTest extends StatefulWidget {
  const PaypalTest({Key? key}) : super(key: key);

  @override
  State<PaypalTest> createState() => _PaypalTestState();
}

class _PaypalTestState extends State<PaypalTest> {
    late double price=5;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
appBar: AppBar(


  title: Text('Paypal test'),
),
      body: TextField(

onChanged: (value) {
  price= double.parse(value);
},

      ),
 floatingActionButton: FloatingActionButton(

  onPressed:() {

Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreen(price)));

  },

   child: Icon(Icons.payment),
),

    );
  }
}

  