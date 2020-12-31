import 'package:flutter/material.dart';
class Hotels extends StatefulWidget {
  @override
  _HotelsState createState() => _HotelsState();
}

class _HotelsState extends State<Hotels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(child: Text('Hotels',style: TextStyle(fontSize: 25),)),
    );
  }
}