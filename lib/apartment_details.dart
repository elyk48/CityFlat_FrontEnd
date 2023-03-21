import 'package:flutter/material.dart';

class ApartmentDetails extends StatefulWidget {
  const ApartmentDetails({Key? key}) : super(key: key);

  @override
  State<ApartmentDetails> createState() => _ApartmentDetailsState();
}
Future<bool> getApartmentInfo() async {




  return true;
}

class _ApartmentDetailsState extends State<ApartmentDetails> {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(builder:(BuildContext context, AsyncSnapshot<bool> snapshot) {

      if(snapshot.hasData) {

      return Scaffold(

      );
    }


    )
  }
}
