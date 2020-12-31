import 'package:flutter/cupertino.dart';

class block extends StatefulWidget {


  @override
  _blockState createState() => _blockState();
}

class _blockState extends State<block> {
  @override
  Widget build(BuildContext context) {
    return Container(
    child: Text("You are blocked for violating us"),
    );
  }
}