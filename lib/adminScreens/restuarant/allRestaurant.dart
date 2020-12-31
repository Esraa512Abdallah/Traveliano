import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traveliano/adminScreens/restuarant/AdRestaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traveliano/adminScreens/dialog.dart';
import 'package:traveliano/adminScreens/restaurants.dart';
import 'package:traveliano/adminScreens/restuarant/addImage.dart';
import 'package:traveliano/globals.dart';
import 'package:traveliano/services/admin.dart';
import 'package:traveliano/adminScreens/locationpreview.dart' as location;
import "package:traveliano/adminScreens/editLocation.dart" as loc;
import 'package:traveliano/load.dart';

import '../locationpreview.dart';
import 'newRestuarant2.dart';

class restaurants extends StatefulWidget {
  @override
  _restaurantsState createState() => _restaurantsState();
}

class _restaurantsState extends State<restaurants> {
  
  
   DocumentSnapshot pressedDoc = null;
  
  
  
  ////////////////////////////////////////
/*   Widget restuarantDetails(BuildContext context) {

    return InkWell(
      onTap: () {
     var x=admin_ser().convertSnapToRestaurant(snap);

  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => tourismDetails(hotel:x,),
  ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[


                  Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(

                    height: 270,
                    child: location.MyApp(10, 30),
                  ),
                ),
                 Divider(color: Colors.cyan,height:5.0,),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                      color: Colors.transparent,
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          
                          
                          
                          
                          
                          
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.restaurant_menu,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    pressedDoc.data['Name'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    pressedDoc.data['Rate'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star_border,
                                        color: Colors.blue,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star_border,
                                        color: Colors.blue,
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                ),

////////////////////////second container
                ///

                Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text("Average Cost : " +
                                pressedDoc.data["Cost"].toString() +
                                " \$"),

                            Text(
                              pressedDoc.data['FoodType'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            // Icon(Icons.restaurant),

                          ],
                        ),
                      ],
                    )),

              Divider(color: Colors.cyan,height:30.0,),
           
           
           
           Container(
height: MediaQuery.of(context).size.height/2,
child: Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ListView(
  
  scrollDirection: Axis.horizontal,
  
  children: <Widget>[
  
  Padding(
  
    padding: const EdgeInsets.all(1.0),
  
    child:   Container(
  
      width: 200,
  
          decoration: BoxDecoration(
  
            borderRadius: BorderRadiusDirectional.circular(1.0),
  
                          shape: BoxShape.rectangle,
  
                          image: DecorationImage(
  
                            image: NetworkImage(
  
                                'http://i.imgur.com/74sByqd.jpg'),
  
  
  
                            fit: BoxFit.cover,
  
                          ),
  
        )
  
            ),
  
      
  
  ),
  
  Padding(
  
    padding: const EdgeInsets.all(1.0),
  
    child:   Container(
  
      width: 200,
  
          decoration: BoxDecoration(
  
            borderRadius: BorderRadiusDirectional.circular(1.0),
  
                          shape: BoxShape.rectangle,
  
                          image: DecorationImage(
  
                            image: NetworkImage(
  
                                'http://i.imgur.com/74sByqd.jpg'),
  
  
  
                            fit: BoxFit.cover,
  
                          ),
  
        )
  
            ),
  
      
  
  ),
  
  Padding(
  
    padding: const EdgeInsets.all(1.0),
  
    child:   Container(
  
      width: 200,
  
          decoration: BoxDecoration(
  
            borderRadius: BorderRadiusDirectional.circular(1.0),
  
                          shape: BoxShape.rectangle,
  
                          image: DecorationImage(
  
                            image: NetworkImage(
  
                                'http://i.imgur.com/74sByqd.jpg'),
  
  
  
                            fit: BoxFit.cover,
  
                          ),
  
        )
  
            ),
  
      
  
  ),
  
  Padding(
  
    padding: const EdgeInsets.all(1.0),
  
    child:   Container(
  
      width: 200,
  
          decoration: BoxDecoration(
  
            borderRadius: BorderRadiusDirectional.circular(1.0),
  
                          shape: BoxShape.rectangle,
  
                          image: DecorationImage(
  
                            image: NetworkImage(
  
                                'http://i.imgur.com/74sByqd.jpg'),
  
  
  
                            fit: BoxFit.cover,
  
                          ),
  
        )
  
            ),
  
      
  
  ),
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  ],
  
  
  
  
  
  ),
),


           )
       
          
          
          
          
          
        
           
           
              ],
            ),
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 3.0,
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
          ),
        ),
      ),
    );
  } */



//////////////////////////////////////////////////
  restuarant(BuildContext context, DocumentSnapshot snap) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
            var x=admin_ser().convertSnapToRestaurant(snap);

  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => restaurantDetails(hotel:x,),
  ));

          print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        },
        child: SizedBox(
          height: 80,
          child: Container(
            // decoration: BoxDecoration(border:Border(bottom: BorderSide(width: 1.0,color: Colors.blue))),

            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 3.0,
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      /*    Container(
                        //   padding: EdgeInsets.only(left: 20),
                        width: 70,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                          image:NetworkImage(
                    'http://i.imgur.com/74sByqd.jpg'),
         
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                
                */
                      Stack(
                        children: <Widget>[
                          snap.data["rate"] < 2
                              ? Icon(
                                  Icons.star_border,
                                  size: 50,
                                  color: Colors.amber,
                                )
                              : snap.data["rate"] < 3.9
                                  ? Icon(
                                      Icons.star_half,
                                      size: 50,
                                      color: Colors.amber,
                                    )
                                  : Icon(
                                      Icons.star,
                                      size: 50,
                                      color: Colors.amber,
                                    ),
                          Text(
                            snap.data["rate"].toString(),
                            style: TextStyle(color: Colors.teal, fontSize: 30),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 150,
                              child: Text(
                                snap.data["Name"],
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 18),
                              ),
                            ),
                       //     Text(Firestore.instance.collection("Cities").document(snap.data["CityId"].toString()).snapshots().  ) ,
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      
PopupMenuButton<String>(
                                    tooltip: "Options",
                                     icon:Icon(Icons.mode_edit ,size: 25,color: Colors.green,),

                                     itemBuilder: (context) => [
                                  
/////////////////////////////////////////////////////////////////////////////////////////////////////////
PopupMenuItem(child: InkWell(

                             child:Center(
                               child: Text('Basic info', style: TextStyle(color: Colors.blueGrey,),

                               ),
                             ),
                             onTap: (){

bottomSheet(context, NewRestaurant(restuaranto: admin_ser().convertSnapToRestaurant(snap),));
   /*                   
                               Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DestinationScreen(Citysnap:snapshot.data.documents[index] ,Collection: "Restaurants",barName: "Retaurants",),)
  );      */        



                             },

                           ))
,

     PopupMenuItem(

//height: 300,

                                         child:InkWell(

                                           child: Center(child: Text('Location',style: TextStyle(color: Colors.blueGrey),)),

                                           onTap: (){



//bottomSheet(context,loc.MyApp(object: admin_ser().convertSnapToRestaurant(snap),));
 
                           Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => loc.MyApp(object:admin_ser().convertSnapToRestaurant(snap),col: "Restaurants",)));   


                                           },

                                         ),

                                       ),

PopupMenuItem(
  child: InkWell(

                                                 child:    Center(
                                                   child: Text('Image', style: TextStyle(color: Colors.blueGrey,),

                                                   ),
                                                 ),
                                                 onTap: (){

                      bottomSheet(context, UploadImage(null, admin_ser().convertSnapToRestaurant(snap)));
/*  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DestinationScreen(Citysnap:snapshot.data.documents[index] ,Collection: "tourismPlaces",barName: "Toursim Attractions",),)
  ); */
                                                 },

                                               ))

/////////////////////////////////////////////////////////////////////////////////////////////////////////


                                     ],
                                   ),
                  IconButton(
                        //    padding: EdgeInsets.only(left:50),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          Dialogs.yesAbortDialog(
                              context, snap.documentID, "Restaurants");
                        }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget searchfield = TextFormField(
      cursorWidth: 1.2, obscureText: false,

      //        controller:_TourismPlace_Name,

      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      autofocus: false,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      style: TextStyle(
        color: Colors.black,
        letterSpacing: .5,
        wordSpacing: 1.5,
        decorationStyle: TextDecorationStyle.solid,
        decorationColor: Colors.red,
      ),

      decoration: InputDecoration(
        suffixIcon: Icon(Icons.search,color: Colors.green,),
        filled: true,
      fillColor: Colors.white,
        hintText: "Search for Restaurant ...",
        contentPadding: EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
          gapPadding: 40.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white10,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(     floatingActionButtonLocation: 
        FloatingActionButtonLocation.endTop,
        floatingActionButton: FloatingActionButton(
          onPressed: (){






Navigator.push(context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation)=>NewRestaurant(restuaranto: null,),
   transitionDuration: Duration(milliseconds: 700),
   transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      
      return SlideTransition(

        position: Tween<Offset>(
          begin: const Offset(3.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: const Offset(1.0, 0.0),
          ).animate(secondaryAnimation),
          child: child,
        ),
      );
    
    }
          
          )
          
            );











          },
          child: Icon(Icons.add),
          mini: true,
        ),
            appBar: PreferredSize(
              child: AppBar(
                bottom: PreferredSize(
                  child: searchfield,
                  preferredSize: Size.fromHeight(50),
                ),
                iconTheme: new IconThemeData(color: Colors.green),
                //   leading: Icon(Icons.filter_list,color: Colors.green,) ,
                actions: <Widget>[],
                title: Text("Top Restaurants",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 20,
                        fontWeight: FontWeight.w900)),

                centerTitle: true, backgroundColor: Colors.white,
              ),
              preferredSize: Size.fromHeight(95),
            ),
    
            body:  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: StreamBuilder(
                      stream: admin_ser().getRestaurantsStream(),
                      builder: (context, snapshots) {
                        if (!snapshots.hasData)
                          return Center(child: load("Loading ...please wait"));
                        if (snapshots.data.documents.length == 0)
                          return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.sentiment_dissatisfied,
                                size: 200,color: Colors.grey[300],
                              ),
                              Text("Sorry,No Restaurants Found \n click + button to add",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w100 ,fontSize: 15)),
                            ],
                          ));
                        return ListView.builder(
                          itemBuilder: (context, index) => restuarant(
                              context, snapshots.data.documents[index]),
                          itemCount: snapshots.data.documents.length,
                        );
                      },
                    ),
                  )));
  }
}
