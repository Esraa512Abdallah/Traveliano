import 'package:flutter/material.dart';
class Restourants extends StatefulWidget {
  @override
  _RestourantsState createState() => _RestourantsState();
}

class _RestourantsState extends State<Restourants> {
  @override
  Widget build(BuildContext context) {
    return
   Scaffold(
      
      body: Center(child: Text('Restaurants',style: TextStyle(fontSize: 25),))
      ,
   
   );
  }
}