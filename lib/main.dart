import 'package:cityflat/signin.dart';
import 'package:cityflat/signup_two.dart';
import 'package:cityflat/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:cityflat/signup.dart';

import 'navigation_menus/nav_bottom.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "City Flat",
     home: SplashScreen(),
      routes: // <- Routes
      {
         /* "/": (BuildContext context) {
            return const SpalshScreen();
          },*/

        "/signup": (BuildContext context) {
          return const SignUpPage();
        },
        "/signup2": (BuildContext context) {
          return const SignUpPageTwo();
        },
        "/navBottom": (BuildContext context) {
          return const NavigationBottom();
        },
        "/signin": (BuildContext context) {
          return const SignInPage();
        },






      },

    );
  }
}


