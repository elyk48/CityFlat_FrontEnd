import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/help_controller.dart';

class HelpPage extends StatelessWidget {
  TextEditingController _messageController = TextEditingController();

  Future<void> _submitMessage(BuildContext context) async {
    String message = _messageController.text;

    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("user_token");

    if (token == null) {
      throw Exception("User token not found in HelpPage");
    }

    var response = await HelpController.CreateHelp(message, token);

    // Clear the message field
    _messageController.clear();

    if (response.statusCode == 200 || response.statusCode == 201) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Message Submitted'),
            content: Text('Your message has been submitted successfully.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Internal Server Error. Could not send message.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context,'/navBottom');
          },
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Help',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _messageController,
                  maxLines: null, // Allow the text field to have multiple lines
                  decoration: InputDecoration(
                    hintText: 'Type your message here...',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () => _submitMessage(context),
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
