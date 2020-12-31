import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:traveliano/wrapper.dart';

class splash extends StatefulWidget {


  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();

Timer(Duration(seconds: 7),(){


   Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context){return wrapper(); }));


});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
       height: MediaQuery.of(context).size.height,
       
        child:Column(

children: <Widget>[


Image.asset('images/plane.png',

 height:(MediaQuery.of(context).size.height/10)*7 ,fit: BoxFit.cover,),
Container(
  
  child: 
                     Shimmer.fromColors(
direction: ShimmerDirection.ltr,
                       baseColor: Colors.blue[50],
                       highlightColor: Colors.blue[700],
                    child:Text("Traveliano", style: TextStyle(color: Colors.white,
            fontFamily: "Pacifico",fontWeight: FontWeight.w700,fontSize: 35))
                     ),
  
  height: (MediaQuery.of(context).size.height/10),)






],


        ),
      ),
    );
  }
}