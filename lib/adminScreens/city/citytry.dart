import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traveliano/adminScreens/locationpreview.dart' as location;
import 'package:traveliano/services/admin.dart';

class citytry extends StatefulWidget {

String _city;

citytry(String snap ){

_city=snap;
}
  @override
  citytryState createState() => citytryState(_city);
}

class citytryState extends State<citytry> {
  String _city;
  citytryState(String city){

_city=city;

  }

GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();



bool ismap=false;
double x=300,hotelHeight=60,resHeight=60,tourHeight=60;
bool visible=false,visible2=false,visible3=false;



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: Container(
    

////////////////////////////////////////////////////



/////////////  //////////////        FRONT

/////////////////////////////////////////////////////




        child:  SafeArea( 
          ///////edited
         child:Column(
         children:<Widget>[
Expanded(

 
  child:   ListView(
  
      children: <Widget>[
  
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: AnimatedContainer(
  
        
  
     duration: Duration(seconds:1),height: hotelHeight,curve: Curves.bounceIn,
  
        
  
    
  
        
  
    child: Column(
  
        
  
        children: <Widget>[
  
        
  
        
  
        
  
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
  
        
  
    children: <Widget>[ Text("Hotels",style: TextStyle(color: Colors.orangeAccent,fontSize: 30,fontFamily: "Baloo"),)      , 
  
        
  
    FlatButton(onPressed:(){
  
        
  
     if(hotelHeight==60) {
  
        
  
        
  
        
  
    new Timer(Duration(seconds: 2),(){
  
        
  
        
  
        
  
        
  
        
  
        setState(() {
  
        
  
    visible=true;
  
        
  
        });
  
        
  
        
  
        
  
        });
  
        
  
        
  
        
  
     }else {setState(() {
  
        
  
    visible=false;
  
        
  
        });}
  
        
  
    
  
        
  
        setState(() {
  
        
  
        
  
        
  
        
  
        
  
        hotelHeight==60?hotelHeight=300:hotelHeight=60;});},child: Text("Explore",style: TextStyle(color: Colors.blue)))  ],),
  
        
  
        
  
        
  
        
  
        
  
        
  
        
  
        visible&&hotelHeight==300? FutureBuilder(
  
        
  
        
  
        
  
        future: admin_ser().getCity_Places(_city, "accommodation"),
  
        
  
        builder: (context,snapshots){
  
        
  
        if(!snapshots.hasData){return Stack(
  
        
  
    children: <Widget>[
  
        
  
            Padding(
  
        
  
              padding: const EdgeInsets.all(30.0),
  
        
  
              child: Center(child: CircularProgressIndicator()),
  
        
  
            ),
  
        
  
    ],
  
        
  
        );}
  
        
  
        if(snapshots.data.documents.length==0)return Center(child: Text("Not Found"));
  
        
  
        return Expanded(
  
        
  
        
  
        
  
    child:   SizedBox(
  
        
  
        
  
        
  
        //duration: Duration(seconds: 1),
  
        
  
        
  
        
  
    height: 70,
  
        
  
        
  
        
  
        
  
        
  
        
  
        
  
    
  
        
  
        
  
        
  
        child:   ListView.builder(
  
        
  
        
  
        
  
    
  
        
  
        
  
        
  
        
  
        
  
        
  
        
  
    
  
        
  
        
  
        
  
        scrollDirection: Axis.horizontal,
  
        
  
        
  
        
  
    
  
        
  
        
  
        
  
        
  
        
  
        
  
        
  
    
  
        
  
        
  
        
  
          itemBuilder:(context,index){
  
        
  
        
  
        
  
    
  
        
  
        
  
        
  
        
  
        
  
        
  
        
  
    
  
        
  
        
  
        
  
        return Padding(
  
        
  
        
  
        
  
          padding: const EdgeInsets.all(8.0),
  
        
  
        
  
        
  
          child: Container(
  
        
  
        
  
        
  
            width: 170,
  
        
  
        
  
        
  
          decoration:   BoxDecoration(
  
        
  
        
  
        
  
    
  
        
  
        
  
        
  
               boxShadow:[BoxShadow(color: Colors.cyan[300],blurRadius: 10.0,)], 
  
        
  
        
  
        
  
              color: Colors.white,
  
        
  
        
  
        
  
     borderRadius: BorderRadius.all( Radius.circular(15)),
  
        
  
        
  
        
  
    
  
        
  
        
  
        
  
         
  
        
  
        
  
        
  
              ),
  
        
  
        
  
        
  
    
  
        
  
        
  
        
  
                child: Column(
  
        
  
        
  
        
  
                  children: <Widget>[
  
        
  
        
  
        
  
        
  
        
  
        
  
        
  
        Container(
  
        
  
        
  
        
  
    
  
        
  
        
  
        
  
        decoration:   BoxDecoration(
  
        
  
        
  
        
  
    
  
        
  
        
  
        
  
               boxShadow:[BoxShadow(color: Colors.cyan[300],blurRadius: 5.0,)], 
  
        
  
        
  
        
  
          
  
        
  
        
  
        
  
     borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
  
        
  
        
  
        
  
    image:DecorationImage(
  
        
  
        
  
        
  
        
  
        
  
        
  
        
  
        image: NetworkImage("https://oeb.global/oeb-insights/wp-content/uploads/2016/10/Blog-Berlin-move.jpg")
  
        
  
        
  
        
  
        ,fit: BoxFit.cover,
  
        
  
        
  
        
  
    )
  
        
  
        
  
        
  
              ),
  
        
  
        
  
        
  
        height: 150,
  
        
  
        
  
        
  
    
  
        
  
        
  
        
  
        
  
        
  
        
  
        
  
        ),
  
        
  
        
  
        
  
        
  
        
  
        
  
        
  
                    Row(
  
        
  
        
  
        
  
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
  
        
  
        
  
        
  
                      children: <Widget>[
  
        
  
        
  
        
  
                        Text(snapshots.data.documents[index]["Name"],style: TextStyle(color: Colors.black,fontFamily: "Oswald"),),
  
        
  
        
  
        
  
                        Column(
  
        
  
        
  
        
  
                          children: <Widget>[
  
        
  
        
  
        
  
                            Icon(Icons.star,color:Colors.amber,size: 25,),
  
        
  
        
  
        
  
                            Text(snapshots.data.documents[index]["Rate"].toString(),style: TextStyle(fontSize: 10,fontFamily: "Oswald",color: Colors.black),),
  
        
  
        
  
        
  
                          ],
  
        
  
        
  
        
  
                        ),
  
        
  
        
  
        
  
                   
  
        
  
        
  
        
  
                   
  
        
  
        
  
        
  
                   
  
        
  
        
  
        
  
                      ],
  
        
  
        
  
        
  
                    ),
  
        
  
        
  
        
  
        
  
        
  
        
  
        
  
     Row(
  
        
  
        
  
        
  
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  
        
  
        
  
        
  
                      children: <Widget>[
  
        
  
        
  
        
  
                        Text(snapshots.data.documents[index]["MinPrice"].toString()+"\$",style: TextStyle(color: Colors.black,fontFamily: "Oswald"),),
  
        
  
        
  
        
  
                      Text("-"),
  
        
  
        
  
        
  
                            Text(snapshots.data.documents[index]["MaxPrice"].toString()+"\$",style: TextStyle(fontFamily: "Oswald",color: Colors.black),),
  
        
  
        
  
        
  
            
  
        
  
        
  
        
  
                   
  
        
  
        
  
        
  
                   
  
        
  
        
  
        
  
                   
  
        
  
        
  
        
  
                      ],
  
        
  
        
  
        
  
                    ),
  
        
  
        
  
        
  
        
  
        
  
        
  
        
  
                  ],
  
        
  
        
  
        
  
                )),
  
        
  
        
  
        
  
        );
  
        
  
        
  
        
  
    
  
        
  
        
  
        
  
        
  
        
  
        
  
        
  
    
  
        
  
        
  
        
  
          },
  
        
  
        
  
        
  
    
  
        
  
        
  
        
  
        
  
        
  
        
  
        
  
    
  
        
  
        
  
        
  
        itemCount: snapshots.data.documents.length,
  
        
  
        
  
        
  
    
  
        
  
        
  
        
  
        
  
        
  
        
  
        
  
    
  
        
  
        
  
        
  
        
  
        
  
        
  
        
  
    
  
        
  
        
  
        
  
        
  
        
  
        
  
        
  
    
  
        
  
        
  
        
  
        ),
  
        
  
        
  
        
  
    
  
        
  
        
  
        
  
    ),
  
        
  
        
  
        
  
        );
  
        
  
        
  
        
  
        },
  
        
  
        
  
        
  
        
  
        
  
        
  
        
  
        
  
        
  
            ):Container()
  
        
  
        ////////////
  
        
  
        ],
  
        
  
        
  
        
  
        
  
        
  
        
  
        
  
    ),
  
        
  
    
  
        
  
         
  
        
  
        decoration: BoxDecoration(
  
        
  
    
  
        
  
               boxShadow:[BoxShadow(color: Colors.cyan[300],blurRadius: 10.0,)], 
  
        
  
              color: Colors.white,
  
        
  
     borderRadius: BorderRadius.all( Radius.circular(15)),
  
        
  
    
  
        
  
         
  
        
  
              ),
  
        
  
    
  
        
  
    
  
        
  
                 
  
        
  
    ),
      ),
  
   
  
   
  
  Padding(
      padding: const EdgeInsets.all(2.0),
      child: AnimatedContainer(
      
         duration: Duration(seconds:1),height: resHeight,curve: Curves.bounceIn,
      
        
      
        child: Column(
      
      children: <Widget>[
      
      
      
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
      
        children: <Widget>[ Text("Restaurants",style: TextStyle(color: Colors.orangeAccent,fontSize: 30,fontFamily: "Baloo"),)      , 
      
        FlatButton(onPressed:(){
      
         if(hotelHeight==60) {
      
      
      
        new Timer(Duration(seconds: 2),(){
      
      
      
      
      
      setState(() {
      
        visible2=true;
      
      });
      
      
      
      });
      
      
      
         }else {setState(() {
      
        visible2=false;
      
      });}
      
        
      
    setState(() {
      
    
      
    
      
    resHeight==60?resHeight=300:resHeight=60;});},child: Text("Explore",style: TextStyle(color: Colors.blue)))  ],),
      
      
      
      
      
      
      
      visible2&&resHeight==300? FutureBuilder(
      
      
      
      future: admin_ser().getCity_Places(_city, "Restaurants"),
      
      builder: (context,snapshots){
      
      if(!snapshots.hasData){return Stack(
      
        children: <Widget>[
      
        Padding(
      
          padding: const EdgeInsets.all(30.0),
      
          child: Center(child: CircularProgressIndicator()),
      
        ),
      
        ],
      
      );}
      
      if(snapshots.data.documents.length==0)return Center(child: Text("Not Found"));
      
      return Expanded(
      
      
      
        child:   SizedBox(
      
      
      
    //duration: Duration(seconds: 1),
      
      
      
        height: 70,
      
      
      
    
      
      
      
        
      
      
      
    child:   ListView.builder(
      
      
      
        
      
      
      
    
      
      
      
        
      
      
      
    scrollDirection: Axis.horizontal,
      
      
      
        
      
      
      
    
      
      
      
        
      
      
      
      itemBuilder:(context,index){
      
      
      
        
      
      
      
    
      
      
      
        
      
      
      
    return Padding(
      
      
      
      padding: const EdgeInsets.all(8.0),
      
      
      
      child: Container(
      
      
      
        width: 170,
      
      
      
      decoration:   BoxDecoration(
      
      
      
        
      
      
      
           boxShadow:[BoxShadow(color: Colors.cyan[300],blurRadius: 10.0,)], 
      
      
      
          color: Colors.white,
      
      
      
         borderRadius: BorderRadius.all( Radius.circular(15)),
      
      
      
        
      
      
      
       
      
      
      
          ),
      
      
      
        
      
      
      
            child: Column(
      
      
      
              children: <Widget>[
      
      
      
      
      
      
      
      Container(
      
      
      
        
      
      
      
    decoration:   BoxDecoration(
      
      
      
        
      
      
      
           boxShadow:[BoxShadow(color: Colors.cyan[300],blurRadius: 5.0,)], 
      
      
      
      
      
      
      
         borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
      
      
      
        image:DecorationImage(
      
      
      
    
      
      
      
    image: NetworkImage(snapshots.data.documents[index]["photo"])
      
      
      
      ,fit: BoxFit.cover,
      
      
      
        )
      
      
      
          ),
      
      
      
      height: 150,
      
      
      
        
      
      
      
      
      
      
      
      ),
      
      
      
      
      
      
      
                Row(
      
      
      
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
      
      
      
                  children: <Widget>[
      
      
      
                    Text(snapshots.data.documents[index]["Name"],style: TextStyle(color: Colors.black,fontFamily: "Oswald"),),
      
      
      
                    Column(
      
      
      
                      children: <Widget>[
      
      
      
                        Icon(Icons.star,color:Colors.amber,size: 25,),
      
      
      
                        Text(snapshots.data.documents[index]["Rate"].toString(),style: TextStyle(fontSize: 10,fontFamily: "Oswald",color: Colors.black),),
      
      
      
                      ],
      
      
      
                    ),
      
      
      
               
      
      
      
               
      
      
      
               
      
      
      
                  ],
      
      
      
                ),
      
      
      
      
      
      
      
         Row(
      
      
      
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      
      
      
                  children: <Widget>[
      
      
      
                    Text(snapshots.data.documents[index]["MinPrice"].toString()+"\$",style: TextStyle(color: Colors.black,fontFamily: "Oswald"),),
      
      
      
                  Text("-"),
      
      
      
                        Text(snapshots.data.documents[index]["MaxPrice"].toString()+"\$",style: TextStyle(fontFamily: "Oswald",color: Colors.black),),
      
      
      
        
      
      
      
               
      
      
      
               
      
      
      
               
      
      
      
                  ],
      
      
      
                ),
      
      
      
      
      
      
      
              ],
      
      
      
            )),
      
      
      
    );
      
      
      
        
      
      
      
    
      
      
      
        
      
      
      
      },
      
      
      
        
      
      
      
    
      
      
      
        
      
      
      
    itemCount: snapshots.data.documents.length,
      
      
      
        
      
      
      
    
      
      
      
        
      
      
      
    
      
      
      
        
      
      
      
    
      
      
      
        
      
      
      
    ),
      
      
      
        
      
      
      
        ),
      
      
      
      );
      
      
      
      },
      
      
      
      
      
      
      
      
      
        ):Container()
      
      ////////////
      
      ],
      
      
      
      
      
      
      
        ),
      
        
      
       
      
    decoration: BoxDecoration(
      
        
      
           boxShadow:[BoxShadow(color: Colors.cyan[300],blurRadius: 10.0,)], 
      
          color: Colors.white,
      
         borderRadius: BorderRadius.all( Radius.circular(15)),
      
        
      
       
      
          ),
      
        
      
        
      
             
      
        ),
  ),
  
  
  
  
  
  
  
  /////////////////////////Third Anumated Container
  
  
  
  
  
  Padding(
      padding: const EdgeInsets.all(2.0),
      child: AnimatedContainer(
      
         duration: Duration(seconds:1),height: tourHeight,curve: Curves.bounceIn,
      
        
      
        child: Column(
      
      children: <Widget>[
      
      
      
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
      
        children: <Widget>[ Text("Tourism Places",style: TextStyle(color: Colors.orangeAccent,fontSize: 30,fontFamily: "Baloo"),)      , 
      
        FlatButton(onPressed:(){
      
         if(hotelHeight==60) {
      
      
      
        new Timer(Duration(seconds: 2),(){
      
      
      
      
      
      setState(() {
      
        visible3=true;
      
      });
      
      
      
      });
      
      
      
         }else {setState(() {
      
        visible3=false;
      
      });}
      
        
      
    setState(() {
      
    
      
    
      
    tourHeight==60?tourHeight=300:tourHeight=60;});},child: Text("Explore",style: TextStyle(color: Colors.blue)))  ],),
      
      
      
      
      
      
      
      visible3&&tourHeight==300? FutureBuilder(
      
      
      
      future: admin_ser().getCity_Places(_city, "tourismPlaces"),
      
      builder: (context,snapshots){
      
      if(!snapshots.hasData){return Stack(
      
        children: <Widget>[
      
        Padding(
      
          padding: const EdgeInsets.all(30.0),
      
          child: Center(child: CircularProgressIndicator()),
      
        ),
      
        ],
      
      );}
      
      if(snapshots.data.documents.length==0)return Center(child: Text("Not Found"));
      
      return Expanded(
      
      
      
        child:   SizedBox(
      
      
      
    //duration: Duration(seconds: 1),
      
      
      
        height: 70,
      
      
      
    
      
      
      
        
      
      
      
    child:   ListView.builder(
      
      
      
        
      
      
      
    
      
      
      
        
      
      
      
    scrollDirection: Axis.horizontal,
      
      
      
        
      
      
      
    
      
      
      
        
      
      
      
      itemBuilder:(context,index){
      
      
      
        
      
      
      
    
      
      
      
        
      
      
      
    return Padding(
      
      
      
      padding: const EdgeInsets.all(8.0),
      
      
      
      child: Container(
      
      
      
        width: 170,
      
      
      
      decoration:   BoxDecoration(
      
      
      
        
      
      
      
           boxShadow:[BoxShadow(color: Colors.cyan[300],blurRadius: 10.0,)], 
      
      
      
          color: Colors.white,
      
      
      
         borderRadius: BorderRadius.all( Radius.circular(15)),
      
      
      
        
      
      
      
       
      
      
      
          ),
      
      
      
        
      
      
      
            child: Column(
      
      
      
              children: <Widget>[
      
      
      
      
      
      
      
      Container(
      
      
      
        
      
      
      
    decoration:   BoxDecoration(
      
      
      
        
      
      
      
           boxShadow:[BoxShadow(color: Colors.cyan[300],blurRadius: 5.0,)], 
      
      
      
      
      
      
      
         borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
      
      
      
        image:DecorationImage(
      
      
      
    
      
      
      
    image: NetworkImage("https://oeb.global/oeb-insights/wp-content/uploads/2016/10/Blog-Berlin-move.jpg")
      
      
      
      ,fit: BoxFit.cover,
      
      
      
        )
      
      
      
          ),
      
      
      
      height: 150,
      
      
      
        
      
      
      
      
      
      
      
      ),
      
      
      
      
      
      
      
                Row(
      
      
      
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
      
      
      
                  children: <Widget>[
      
      
      
                    Text(snapshots.data.documents[index]["Name"],style: TextStyle(color: Colors.black,fontFamily: "Oswald"),),
      
      
      
                    Column(
      
      
      
                      children: <Widget>[
      
      
      
                        Icon(Icons.star,color:Colors.amber,size: 25,),
      
      
      
                        Text(snapshots.data.documents[index]["Rate"].toString(),style: TextStyle(fontSize: 10,fontFamily: "Oswald",color: Colors.black),),
      
      
      
                      ],
      
      
      
                    ),
      
      
      
               
      
      
      
               
      
      
      
               
      
      
      
                  ],
      
      
      
                ),
      
      
      
      
      
      
      
         Row(
      
      
      
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      
      
      
                  children: <Widget>[
      
      
      
                    Text("tickets or any fees",style: TextStyle(color: Colors.black,fontFamily: "Oswald"),),
      
      
      
                  Text(":"),
      
      
      
                        Text(snapshots.data.documents[index]["Cost"].toString()+"\$",style: TextStyle(fontFamily: "Oswald",color: Colors.black),),
      
      
      
        
      
      
      
               
      
      
      
               
      
      
      
               
      
      
      
                  ],
      
      
      
                ),
      
      
      
      
      
      
      
              ],
      
      
      
            )),
      
      
      
    );
      
      
      
        
      
      
      
    
      
      
      
        
      
      
      
      },
      
      
      
        
      
      
      
    
      
      
      
        
      
      
      
    itemCount: snapshots.data.documents.length,
      
      
      
        
      
      
      
    
      
      
      
        
      
      
      
    
      
      
      
        
      
      
      
    
      
      
      
        
      
      
      
    ),
      
      
      
        
      
      
      
        ),
      
      
      
      );
      
      
      
      },
      
      
      
      
      
      
      
      
      
        ):Container()
      
      ////////////
      
      ///
      
      ///
      
      ///
      
      
      
      
      
      ],
      
      
      
      
      
      
      
        ),
      
        
      
       
      
    decoration: BoxDecoration(
      
        
      
           boxShadow:[BoxShadow(color: Colors.cyan[300],blurRadius: 10.0,)], 
      
          color: Colors.white,
      
         borderRadius: BorderRadius.all( Radius.circular(15)),
      
        
      
       
      
          ),
      
        
      
        
      
             
      
        ),
  ),
  
  
  
  
  SizedBox(height: 50,),
   
  
   
  
      ],
  
  ),
),





//////////////////////Second Animated Container








],



            ),
          )
         
        ),
      );
  }
}












/*FutureBuilder(

future: admin_ser().getCity_Places(_city, "Restaurants"),
builder: (context,snapshots){
if(!snapshots.hasData){return CircularProgressIndicator();}
return ListView.builder(
scrollDirection: Axis.horizontal,
  itemBuilder:(context,index){

return Container(
  width: 60,color: Colors.blue,
  child: Center(child: Text(snapshots.data.documents[index]["Name"])),);


  },
itemCount: snapshots.data.documents.length,

);

},




        ),*/ 