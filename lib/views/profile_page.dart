import 'dart:convert';

import 'package:cityflat/controllers/user_controller.dart';
import 'package:cityflat/entities/user_e.dart';
import 'package:cityflat/session.dart';
import 'package:cityflat/splash_screen.dart';
import 'package:cityflat/views/profile_info.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {


  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  late Map<String, dynamic>  user= {};

  static Future<Map<String,dynamic>> fetchUser() async {
  UserE userP = new UserE.noarg();
  late Map<String, dynamic>  user;
 await  Session.getUser_from_prefs(userP).then((value) => {

   userP =value
  });

  await UserController.FetchUser(userP.id).then((value) => {
    if(value.statusCode==200){

user=jsonDecode(value.body)
    }

  });
  return user;


}
  @override
  void initState() {
    fetchUser().then((value) => {
    setState(() { user= value ;})


    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if( user!=null){
print (    user["img"]);
print(user["id"]);
print(user["name"]);
print(user["name"]);
print(user["email"]);
print(user["number"]);
print(user["address"]);
print(user["birthdate"]);
      return Scaffold(
        backgroundColor: Colors.black,
        body: Profile_info(user["id"],user["img"],user["name"],user["email"],user["number"],user["address"],user["birthdate"]),
      );
    } else {


      return SplashScreen();
    }


  }
}
