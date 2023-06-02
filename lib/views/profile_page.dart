import 'dart:convert';

import 'package:cityflat/controllers/user_controller.dart';
import 'package:cityflat/entities/user_e.dart';
import 'package:cityflat/session.dart';
import 'package:cityflat/splash_screen.dart';
import 'package:cityflat/views/profile_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {


  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  late Map<String, dynamic>  user= {};

   Future<Map<String,dynamic>> fetchUser() async {
  UserE userP = new UserE.noarg();
  late Map<String, dynamic>  user;
 await  Session.getUser_from_prefs(userP).then((value) =>  {
   setState(() {   userP =value;})

  });

  await UserController.FetchUser(userP.id).then((value) => {
    if(value.statusCode==200){


      setState(() { user=jsonDecode(value.body);})
    }

  });
  return user;


}
  @override
  void initState() {
    super.initState();

    try {
      fetchUser().then((value) {
        setState(() {
          user = value;
        });
      });
    } catch (e) {
      // Handle the exception here
      print("Error fetching user: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    if(user == null) {
      // User data is still being fetched, show a loading indicator
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if(user.isEmpty) {
      // User data fetch failed, show a blank screen
      return Scaffold(
        backgroundColor: Colors.black,
        body: Container(),
      );
    } else {
      // User data fetch successful, show the profile info
      final id = user['id'] ;
      final name = user['name'] ;
      final email = user['email'] ;
      final number = user['number'] ;
      final address = user['address'] ;
      final birthdate = user['birthdate'] != null
          ? DateFormat.yMMMd().format(DateTime.parse(user['birthdate']))
          : '';
      return Scaffold(
        backgroundColor: Colors.black,
        body: Profile_info(id, name, email, number, address, birthdate),
      );
    }
  }






}
