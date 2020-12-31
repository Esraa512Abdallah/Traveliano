import 'package:flutter/material.dart';
import 'package:traveliano/userScreens/myExperince.dart';
import 'Tourism_places.dart';
import 'Restourants.dart';
import 'Hotels.dart';



class Swap extends StatefulWidget {

  @override
  _SwapState createState() => _SwapState();
}

class _SwapState extends State<Swap> {

  List<Widget> pages=[myExperince(),Hotels(),Restourants()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: PageView.builder(
        itemCount: pages.length,
        itemBuilder: (context, position) => pages[position],
      ),
    );
  }
}