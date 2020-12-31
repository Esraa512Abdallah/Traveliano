import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';


class load extends StatelessWidget{

String text;

load(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
     
          body: Container(
            height: MediaQuery.of(context).size.height,
        color: Colors.white,
      child: Center(
        child:
        
        Stack(
     //     mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
         /*   SpinKitChasingDots(
duration: Duration(seconds: 2),
            color: Colors.red
            ,
            size: 150.0,
      ), */
//SvgPicture.asset("images/load.svg",height: 50,color: Colors.blue,),
Center(child: Image.asset("images/circle.gif",height: 200,fit: BoxFit.cover,)),
Align(
  alignment: Alignment.bottomCenter,
  child:   Padding(
    padding: const EdgeInsets.only(bottom:100.0),
    child: Text(this.text,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
  ),
),


          ],
        ),
      ),
      
      ),
    );
  }



}








