import 'package:cityflat/views/webview_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class PaypalPayment extends StatelessWidget {
  final String orderId;

  const PaypalPayment({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body:Wid(
url: "https://github.com",

      ),
    );
  }



}