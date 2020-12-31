import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:traveliano/adminScreens/experience/addExperience.dart';



import 'package:traveliano/new/page1.dart' as page1;
import 'package:traveliano/new/page2.dart' as page2;
import 'package:traveliano/new/page3.dart' as page3;
import 'package:traveliano/new/page4.dart' as page4;
import 'package:traveliano/new/page5.dart' as page5;


class suggestPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return suggestPageState();
  }

}

class suggestPageState extends State<suggestPage> {

final _pageController = new PageController(
  
  initialPage: 0
  //,
 // viewportFraction: 2.0
  );


List<Slide> slides = new List();



  @override
  Widget build(BuildContext context) {
  
 
    // TODO: implement build
    return  Scaffold(
    
body: Container(

child: AddEx(),
  decoration: BoxDecoration(
//color: Colors.pink[200],
  //image:DecorationImage(image:  AssetImage('images/crop.jpg'),
  //fit: BoxFit.cover
  //)

  ),
  width: double.infinity,
  



),

    );
  }


}