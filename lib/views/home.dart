import 'package:flutter/material.dart';
import 'package:expandable_search_bar/expandable_search_bar.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 31, 31, 5),
      appBar: AppBar(
        backgroundColor: Colors.black,
        excludeHeaderSemantics: false,
automaticallyImplyLeading: false,
toolbarHeight: 150,

titleSpacing: 1,
title:
        AnimSearchBar(
          prefixIcon: Icon(Icons.search_outlined, size: 35,color: Colors.black),
          onSubmitted: (p0) {},
          width: 400,

          closeSearchOnSuffixTap: false,
          suffixIcon: Icon(Icons.filter_list),


          textController: textController, onSuffixTap: (){

        },
        ),
      ),
      /*body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.black,
        ),
        height: 180,
        width: double.infinity,
        padding: EdgeInsets.only(top: 27),
        alignment: Alignment.topCenter,
        child: AnimSearchBar(
          prefixIcon: Icon(Icons.search_outlined, size: 35),
          onSubmitted: (p0) {},
          width: 400,

          closeSearchOnSuffixTap: false,
          suffixIcon: Icon(Icons.filter_list),


          textController: textController, onSuffixTap: (){

        },
        ),
      ),*/
    );
  }
}
