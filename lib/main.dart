import 'package:cityflat/apartment_details.dart';
import 'package:cityflat/newpassword.dart';
import 'package:cityflat/reservation_page.dart';
import 'package:cityflat/resetpassword2_code.dart';
import 'package:cityflat/resetpassword_page.dart';
import 'package:cityflat/signin.dart';
import 'package:cityflat/signup_two.dart';
import 'package:cityflat/splash_screen.dart';
import 'package:cityflat/views/email_verification_page.dart';
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
        "/resetpassword": (BuildContext context) {
          return const ResetpasswordPage();
        },
        "/resetpasswordcode": (BuildContext context) {
          return const resetpasswordPagecode();
        },
        "/newpassword": (BuildContext context) {
          return const NewpasswordPage();
        },
        "/appartmentDetails": (BuildContext context) {
          return  ApartmentDetails();
        },
        "/verify-email": (BuildContext context) {
          return const verifyEmail();
        },
        "/ReservationPage": (BuildContext context) {
          return const ReservationPage();
        },






      },

    );
  }
}



