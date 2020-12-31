import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class dialog extends StatefulWidget {
BuildContext context;
  dialog(BuildContext context){

this.context=context;
  }
  @override
  dialogState createState() => dialogState(this.context);
}

class dialogState extends State<dialog> {
BuildContext context;
  dialogState(BuildContext context){

this.context=context;
  }




int val=400;

 RangeValues valuess= RangeValues(1,100);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

content: NumberPicker.integer(
                initialValue: val,
                minValue: 0,
                maxValue: 100,
                
                onChanged: (vall){setState(() {
                  val=vall;
                });}
                )
                
    );
  }
}