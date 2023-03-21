import 'package:cityflat/views/home.dart';
import 'package:cityflat/views/messages_page.dart';
import 'package:cityflat/views/notification_page.dart';
import 'package:cityflat/views/profile_page.dart';
import 'package:flutter/material.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({Key? key}) : super(key: key);

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  int _currentIndex = 0;
  final List<Widget> _interfaces = [
    HomePage(),
    NotificationPage(),
    MessagesPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    Color shadowColor = Colors.greenAccent;
    return Scaffold(
      body: _interfaces[_currentIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 2),
        decoration: const BoxDecoration(

          boxShadow: [
            BoxShadow(

              color: Color(0xffad9c00), //New
              blurRadius: 3,
            ),
            BoxShadow(

              color: Color.fromRGBO(255, 215, 0,5), //New
              blurRadius: 3,
            ),
            BoxShadow(

              color: Color(0xffad9c00), //New
              blurRadius: 3,
            ),
            BoxShadow(

              color: Color.fromRGBO(255, 215, 0,5), //New
              blurRadius: 3,
            ),
            BoxShadow(

              color: Color(0xffad9c00), //New
              blurRadius: 3,
            ),
            BoxShadow(

              color: Color(0xffad9c00), //New
              blurRadius: 3,
            )
          ],
        ),
        child: BottomNavigationBar(
          selectedFontSize: 15,
          selectedLabelStyle: TextStyle(

              color: Colors.white,
              fontFamily: 'alethiapro',
              fontWeight: FontWeight.bold),
          showUnselectedLabels: false,
          type: BottomNavigationBarType.shifting,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(

              label: "Home",

              activeIcon: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return RadialGradient(
                    center: Alignment.topLeft,
                    radius: 1,
                    colors: <Color>[
                      Color(0xffad9c00),
                      Color.fromRGBO(255, 215, 0,5),
                      Color(0xffad9c00),
                      Color.fromRGBO(255, 215, 0,5),
                    ],
                    tileMode: TileMode.mirror,
                  ).createShader(bounds);
                },
                child: Icon(
                  Icons.home_filled,
                ),
              ),
              icon: Icon(
                Icons.home_filled,
                color: Color.fromRGBO(206, 206, 206, 5),
              ),
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              label: "Notifications",
              activeIcon: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return RadialGradient(
                    center: Alignment.topLeft,
                    radius: 1,
                    colors: <Color>[
                      Color(0xffad9c00),
                      Color.fromRGBO(255, 215, 0,5),
                      Color(0xffad9c00),
                      Color.fromRGBO(255, 215, 0,5),
                    ],
                    tileMode: TileMode.mirror,
                  ).createShader(bounds);
                },
                child: Icon(
                  Icons.notifications,
                ),
              ),
              icon: Icon(
                Icons.notifications,
                color: Color.fromRGBO(206, 206, 206, 5),
              ),
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              label: "Reservations",
              activeIcon: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return RadialGradient(
                    center: Alignment.topLeft,
                    radius: 1,
                    colors: <Color>[
                      Color(0xffad9c00),
                      Color.fromRGBO(255, 215, 0,5),
                      Color(0xffad9c00),
                      Color.fromRGBO(255, 215, 0,5),
                    ],
                    tileMode: TileMode.mirror,
                  ).createShader(bounds);
                },
                child: Icon(
                  Icons.note_alt_outlined,
                ),
              ),
              icon: Icon(
                Icons.note_alt_outlined,
                color: Color.fromRGBO(206, 206, 206, 5),
              ),
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              label: "Profile",
              activeIcon: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return RadialGradient(
                    center: Alignment.topLeft,
                    radius: 1,
                    colors: <Color>[
                      Color(0xffad9c00),
                      Color.fromRGBO(255, 215, 0,5),
                      Color(0xffad9c00),
                      Color.fromRGBO(255, 215, 0,5),
                    ],
                    tileMode: TileMode.mirror,
                  ).createShader(bounds);
                },
                child: Icon(
                  Icons.person,
                ),
              ),
              icon: Icon(
                Icons.person,
                color:Color.fromRGBO(206, 206, 206, 5),
              ),
              backgroundColor: Colors.black,
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (int value) {
            setState(() {
              _currentIndex = value;
            });
          },
        ),
      ),
    );
  }
}
