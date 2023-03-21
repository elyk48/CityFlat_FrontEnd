import 'package:cityflat/views/profile_info.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {


  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
body: Profile_info("01455400","assets/images/appart2.jpg","elyesKabous","elyes.kabous@esprit.tn","52618182","manzeh 7","11/08/1998"),
    );
  }
}
