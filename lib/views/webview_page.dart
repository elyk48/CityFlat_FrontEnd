import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class Wid extends StatefulWidget {
  final String url;
  const Wid({Key? key, required this.url}) : super(key: key);

  @override
  State<Wid> createState() => _WidState();
}

class _WidState extends State<Wid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: WebViewWidget(
          controller: WebViewController()
            ..loadRequest(Uri.parse(widget.url)),
        ));
  }
}