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
              color: Colors.greenAccent, //New
              blurRadius: 10,
            )
          ],
        ),
        child: BottomNavigationBar(
          selectedFontSize: 15,
          selectedLabelStyle: TextStyle(
              color: Colors.white70,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            shadows: [
              for (double i = 1; i < 3; i++)
                Shadow(
                  color: shadowColor,
                  blurRadius: 1*i ,
                ),
            ],

          ),
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
                      Colors.greenAccent,
                      Colors.blueAccent,
                      Colors.greenAccent,
                      Colors.blueAccent,
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
                color: Colors.grey,
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
                      Colors.greenAccent,
                      Colors.blueAccent,
                      Colors.greenAccent,
                      Colors.blueAccent,
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
                color: Colors.grey,
              ),
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              label: "Message",
              activeIcon: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return RadialGradient(
                    center: Alignment.topLeft,
                    radius: 1,
                    colors: <Color>[
                      Colors.greenAccent,
                      Colors.blueAccent,
                      Colors.greenAccent,
                      Colors.blueAccent,
                    ],
                    tileMode: TileMode.mirror,
                  ).createShader(bounds);
                },
                child: Icon(
                  Icons.messenger_rounded,
                ),
              ),
              icon: Icon(
                Icons.messenger_rounded,
                color: Colors.grey,
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
                      Colors.greenAccent,
                      Colors.blueAccent,
                      Colors.greenAccent,
                      Colors.blueAccent,
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
                color: Colors.grey,
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
