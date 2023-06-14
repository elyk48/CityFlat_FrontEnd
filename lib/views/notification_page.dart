import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/dialog_controller.dart';
import '../controllers/user_controller.dart';
import '../entities/notification_e.dart';
import '../entities/user_e.dart';
import '../utils.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationModel> notifications = [];

  void refreshPage(){
    fetchNotifications().then((fetchedNotifications) {
      setState(() {
        notifications = fetchedNotifications;
      });
    }).catchError((error) {
      print('Failed to fetch notifications: $error');
    });

  }
  @override
  void initState() {
    super.initState();
    fetchNotifications().then((fetchedNotifications) {
      setState(() {
        notifications = fetchedNotifications;
      });
    }).catchError((error) {
      print('Failed to fetch notifications: $error');
    });
  }

  Future<List<NotificationModel>> fetchNotifications() async {
    try {
      var prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("user_token");

      if (token == null) {
        throw Exception("User token not found");
      }

      var response = await UserController.getMyNotifications(token);

      if (response.statusCode == 200) {
        List<dynamic> jsonNotifications = jsonDecode(response.body);

        List<NotificationModel> notifications = [];

        for (int i = 0; i < jsonNotifications.length; i++) {
          Map<String, dynamic> notificationData = jsonNotifications[i];

          notifications.add(
            NotificationModel.noUser(
              notificationData['id'],
              notificationData['message'],
              notificationData['read'],
              DateTime.parse(notificationData['createdAt']),
            ),
          );
        }

        return notifications;
      } else {
        throw Exception('Failed to fetch notifications. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching notifications: $error');
      throw Exception('Failed to fetch notifications');
    }
  }

  Future<void> deleteNotification(String notificationId) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("user_token");

      if (token == null) {
        throw Exception("User token not found");
      }
      var response = await UserController.DeleteOneNotification(notificationId, token);

      if (response.statusCode == 200) {
        DialogController.showAlertDialog(
          context,
          'Notification Delete',
          'The Notification has been deleted successfully.',
        );
      } else {
        throw Exception('Failed to delete notification. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error deleting notification: $error');
      throw Exception('Failed to delete notification');
    }
  }

  Future<void> clearNotifications() async {
    try {
      var prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("user_token");

      if (token == null) {
        throw Exception("User token not found");
      }

      var response = await UserController.DeleteAllNotifications(token);

      if (response.statusCode == 200) {
        setState(() {
          notifications.clear();
        });
      } else {
        throw Exception('Failed to clear notifications. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error clearing notifications: $error');
      throw Exception('Failed to clear notifications');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 50.0),
            child: Text(
              'Notifications',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.topRight,
            child: ElevatedButton(
              onPressed: clearNotifications,
              child: Text('Clear All'),
              style: ElevatedButton.styleFrom(

                primary: Colors.red,
              ),
            ),
          ),
          Expanded(
            child: notifications.isEmpty
                ? Center(
              child: Text(
                'No Notifications',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
                : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                final formattedDate = DateFormat('dd MMM yyyy').format(notification.createdAt);
                final formattedTime = DateFormat('HH:mm').format(notification.createdAt);

                return Card(
                  color: Colors.white,
                  elevation: 2.0,
                  margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    title: Text(
                      notification.message,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      '$formattedDate at $formattedTime',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      ),
                    ),
                    trailing: PopupMenuButton<String>(
                      icon: Icon(Icons.more_vert),
                      onSelected: (value) {
                        if (value == 'delete') {
                          deleteNotification(notification.id);
                          refreshPage();
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem<String>(
                            value: 'delete',
                            child: Text('Delete'),
                          ),
                        ];
                      },
                    ),
                    onTap: () {
                      // Handle notification tap
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}