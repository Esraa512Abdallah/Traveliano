import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
class tourPlace extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build



    return Scaffold(


body: ListView(children: <Widget>[




InkWell(

   onTap: (){Navigator.pushNamed(context, "AddTPlace");},
  child:   Container(padding: EdgeInsets.only(left: 15,right: 15),
  
    margin: EdgeInsets.only(left: 10,top: 10),
  
  height: 150,
  
  decoration: BoxDecoration(
  
    
  
    color: Colors.orange,
  
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70))
  
        
  
    ,//border: Border.all(width: 2.0,color: Colors.black26),
  
  
  
        boxShadow:[BoxShadow(color: Colors.cyan,blurRadius: 10.0,)], 
  
  
  
    ),
  
  
  
  child: Row(
  
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
    crossAxisAlignment: CrossAxisAlignment.center,
  
    children: <Widget>[
  
          // SvgPicture.asset("images/globe.svg",height: 70,),   
  
           Icon(Icons.add,color: Colors.blueAccent,size: 70,),
  
           
  
           Text("New \nPlace",style: TextStyle(fontSize: 30,color: Colors.white),),
  
      
  
    ],
  
  ),
  
  ),
),




InkWell(


  
   onTap: (){Navigator.pushNamed(context, "AllTplace");},

  child:   Container(padding: EdgeInsets.only(left: 15,right: 15),
  
    margin: EdgeInsets.only(right: 10,top: 10),
  
  height: 150,
  
  decoration: BoxDecoration(
  
    
  
        boxShadow:[BoxShadow(color: Colors.cyan,blurRadius: 10.0,)], 
  
    color: Colors.orange,borderRadius: BorderRadius.only(bottomRight: Radius.circular(70))),
  
  child: Row(
  
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
    crossAxisAlignment: CrossAxisAlignment.center,
  
    children: <Widget>[
  
          Text("All \nPlaces",style: TextStyle(fontSize: 30,color: Colors.white),),
  
          SvgPicture.asset("images/khalifa.svg",height: 70,),
  
    ],
  
  ),
  
  
  
  
  
  ),
),


Container(
  margin: EdgeInsets.only(left: 10,top: 10),
height: 150,

/*

child: InkWell(
  child: Icon(Icons.arrow_back,size: 50,color: Colors.green,)
  
  
  
  ),
*/




),



],),
    );
  }




  
}