import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traveliano/adminScreens/dialog.dart';
import 'package:traveliano/adminScreens/hotel/addAccommodation2.dart';
import 'package:traveliano/adminScreens/locationpreview.dart' as location;
import 'package:traveliano/adminScreens/restuarant/newRestuarant2.dart';
import 'package:traveliano/adminScreens/tourismplace/newTourismPlace2.dart';
import 'package:traveliano/globals.dart';
import 'package:traveliano/services/admin.dart';
import "package:traveliano/adminScreens/editLocation.dart" as loc;
import 'package:traveliano/adminScreens/restuarant/addImage.dart' as res;
import 'package:traveliano/adminScreens/tourismplace/addImage.dart' as tou;
import 'package:traveliano/adminScreens/hotel/addImage.dart' as hot;
class cityPreview extends StatefulWidget {
  DocumentSnapshot _city;

  cityPreview(DocumentSnapshot snap) {
    _city = snap;
  }
  @override
  cityPreviewState createState() => cityPreviewState(_city);
}

class cityPreviewState extends State<cityPreview> {
  DocumentSnapshot _city;
  cityPreviewState(DocumentSnapshot city) {
    _city = city;
  }

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  bool ismap = false;
  double x = 300, hotelHeight = 60, resHeight = 60, tourHeight = 60;
  bool visible = false, visible2 = false, visible3 = false;

  String getID(DocumentSnapshot snap) {
    return snap.documentID;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[300],
        heroTag: "sfd",
        onPressed: () {
          cardKey.currentState.toggleCard();
//print(x.toString()+"!!!!!!!!!!!!!!!!!!!!!!!!");
        },
        child: Icon(Icons.public),
      ),
      body: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          flipOnTouch: false,
          key: cardKey,
          back: Container(
            //color: Colors.amber,

            child: Stack(
              children: <Widget>[
                location.MyApp(_city.data["latitude"], _city.data['longitude']),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        _city.data["Name"],
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
                    Text(
                      _city.data["country"],
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),

////////////////////////////////////////////////////

/////////////  //////////////        FRONT

/////////////////////////////////////////////////////

          front: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20),
//duration: Duration(seconds: 2),
//color: Colors.red,
                // curve: Curves.easeIn,
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(

                    //   boxShadow:[BoxShadow(color: Colors.cyan[300],blurRadius: 10.0,)],

                    //     color: Colors.white,

                    //    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30) ),

                    image: new DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: _city.data["photo"] != null
                            ? new ColorFilter.mode(
                                Colors.black.withOpacity(0.2),
                                BlendMode.darken,
                              )
                            : new ColorFilter.mode(
                                Colors.black.withOpacity(0.40),
                                BlendMode.darken,
                              ),
                        image: _city.data["photo"] != null
                            ? new NetworkImage(_city.data["photo"])
                            : AssetImage("images/default.png"))),

                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    _city.data["Name"],
                                    style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                        fontFamily: "Oswald"),
                                  ),
                                  Text(
                                    _city.data["country"],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontFamily: "Oswald"),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 40,
                                  ),
                                  Text(
                                    _city.data["rate"].toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Oswald"),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),

                            // elevation:2,

                            color: Colors.transparent,

                            //          margin:EdgeInsets.only(right:5,left:190 ),

                            // padding:EdgeInsets.all(10 ),

                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,

                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    //    mainAxisAlignment: MainAxisAlignment.center,

                                    children: <Widget>[
                                      Text(
                                        _city.data['recommendedWeather']
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Baloo',
                                            fontSize: 18),
                                      ),

                                      //    Text(' city',style:  TextStyle(color: Colors.teal,

                                      //      fontWeight:FontWeight.w800,fontFamily: 'ShadowsIntoLight',fontSize:20 ),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),

                            // elevation:2,

                            color: Colors.transparent,

                            //          margin:EdgeInsets.only(right:5,left:190 ),

                            // padding:EdgeInsets.all(10 ),

                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,

                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    //    mainAxisAlignment: MainAxisAlignment.center,

                                    children: <Widget>[
                                      Text(
                                        _city.data['recommendedType']
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Baloo',
                                            fontSize: 18),
                                      ),

                                      //    Text(' city',style:  TextStyle(color: Colors.teal,

                                      //      fontWeight:FontWeight.w800,fontFamily: 'ShadowsIntoLight',fontSize:20 ),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),

                            // elevation:2,

                            color: Colors.transparent,

                            //          margin:EdgeInsets.only(right:5,left:190 ),

                            // padding:EdgeInsets.all(10 ),

                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,

                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    //    mainAxisAlignment: MainAxisAlignment.center,

                                    children: <Widget>[
                                      Text(
                                        _city.data['travelWith'].toString(),
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Baloo',
                                            fontSize: 18),
                                      ),

                                      //    Text(' city',style:  TextStyle(color: Colors.teal,

                                      //      fontWeight:FontWeight.w800,fontFamily: 'ShadowsIntoLight',fontSize:20 ),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: <Widget>[
                                                  Text(this._city.data["minBudget"].toString()+" \$"
                                                  ,style: TextStyle(fontFamily: "Oswald",fontSize: 25,color: Colors.white)),
                                                            Text("-"),
                                                     Text(this._city.data["maxBudget"].toString()+" \$"
                                                  ,style: TextStyle(fontFamily: "Oswald",fontSize: 25,color: Colors.white)),
                                                          ],
                                                        ),
                  ],
                ),

                //color: Colors.blue,

                height: MediaQuery.of(context).size.width / 1.5,
                width: double.infinity,
              ),

              Expanded(
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: hotelHeight,
                        curve: Curves.bounceIn,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "   Hotels/Hostels",
                                  style: TextStyle(
                                      color: Colors.blue[200],
                                      fontWeight: FontWeight.w200,
                                      fontSize: 25,
                                      fontFamily: "Oswald"),
                                ),
                                FlatButton(
                                    onPressed: () {
                                      if (hotelHeight == 60) {
                                        new Timer(Duration(seconds: 2), () {
                                          setState(() {
                                            visible = true;
                                          });
                                        });
                                      } else {
                                        setState(() {
                                          visible = false;
                                        });
                                      }

                                      setState(() {
                                        hotelHeight == 60
                                            ? hotelHeight = 300
                                            : hotelHeight = 60;
                                      });
                                    },
                                    child:    hotelHeight == 300 ? Icon(Icons.expand_less,color:Colors.blue ,size: 40,)
                                    : Icon(Icons.expand_more,color: Colors.blue,size: 40,)
                                        
                                        
                                        
                                        )
                              ],
                            ),

                            visible && hotelHeight == 300
                                ? FutureBuilder(
                                    future: admin_ser().getCity_Places(
                                        _city.documentID, "accommodation"),
                                    builder: (context, snapshots) {
                                      if (!snapshots.hasData) {
                                        return Stack(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(30.0),
                                              child: Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                            ),
                                          ],
                                        );
                                      }

                                      if (snapshots.data.documents.length == 0)
                                        return Center(child: Text("Not Found"));

                                      return Expanded(
                                        child: SizedBox(
                                          //duration: Duration(seconds: 1),

                                          height: 70,

                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                    width: 170,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color:
                                                              Colors.cyan[300],
                                                          blurRadius: 10.0,
                                                        )
                                                      ],
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                    ),
                                                    child: Column(
                                                      children: <Widget>[
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                  boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                          .cyan[
                                                                      300],
                                                                  blurRadius:
                                                                      5.0,
                                                                )
                                                              ],
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              15),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              15)),
                                                                  image:
                                                                      DecorationImage(
                                                                    image: NetworkImage(snapshots
                                                                            .data
                                                                            .documents[index]
                                                                        [
                                                                        "photo"]),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )),
                                                          height:MediaQuery.of(context).size.width/2.49
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: <Widget>[
                                                            Text(
                                                              snapshots.data
                                                                      .documents[
                                                                  index]["Name"],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontFamily:
                                                                      "Oswald"),
                                                            ),
                                                            Column(
                                                              children: <
                                                                  Widget>[
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .amber,
                                                                  size: 25,
                                                                ),
                                                                Text(
                                                                  snapshots
                                                                      .data
                                                                      .documents[
                                                                          index]
                                                                          [
                                                                          "rate"]
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontFamily:
                                                                          "Oswald",
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                         Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: <Widget>[
                                                        IconButton(icon: Icon(Icons.delete_outline),
                                                         onPressed: () { 

       Dialogs.yesAbortDialog(
                              context, snapshots.data.documents[index].documentID, "accommodation");

                                                          },),
                                                            Text("-"),
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

bottomSheet(context, NewAccommodation(hotel:admin_ser().convertSnapToHotel(snapshots.data.documents[index]),));
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
    MaterialPageRoute(builder: (context) => loc.MyApp(object:admin_ser().convertSnapToHotel(snapshots.data.documents[index]),col: "accommodation",)));   


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

                      bottomSheet(context, hot.UploadImage(null, admin_ser().convertSnapToHotel(snapshots.data.documents[index])));
/*  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DestinationScreen(Citysnap:snapshot.data.documents[index] ,Collection: "tourismPlaces",barName: "Toursim Attractions",),)
  ); */
                                                 },

                                               ))

/////////////////////////////////////////////////////////////////////////////////////////////////////////


                                     ],
                                   ),
                                                          ],
                                                        ),
                                                      ],
                                                    )),
                                              );
                                            },
                                            itemCount:
                                                snapshots.data.documents.length,
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : Container()

                            ////////////
                          ],
                        ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.cyan[300],
                              blurRadius: 10.0,
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: resHeight,
                        curve: Curves.bounceIn,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                  Text(
                                  "   Restaurants",
                                  style: TextStyle(
                                      color: Colors.blue[200],
                                      fontWeight: FontWeight.w200,
                                      fontSize: 25,
                                      fontFamily: "Oswald"),
                                ),
                                FlatButton(
                                    onPressed: () {
                                      if (hotelHeight == 60) {
                                        new Timer(Duration(seconds: 2), () {
                                          setState(() {
                                            visible2 = true;
                                          });
                                        });
                                      } else {
                                        setState(() {
                                          visible2 = false;
                                        });
                                      }

                                      setState(() {
                                        resHeight == 60
                                            ? resHeight = 300
                                            : resHeight = 60;
                                      });
                                    },
                                    child: resHeight == 300 ? Icon(Icons.expand_less,color:Colors.blue ,size: 40,)
                                    : Icon(Icons.expand_more,color: Colors.blue,size: 40,))
                              ],
                            ),

                            visible2 && resHeight == 300
                                ? FutureBuilder(
                                    future: admin_ser().getCity_Places(
                                        _city.documentID, "Restaurants"),
                                    builder: (context, snapshots) {
                                      if (!snapshots.hasData) {
                                        return Stack(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(30.0),
                                              child: Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                            ),
                                          ],
                                        );
                                      }

                                      if (snapshots.data.documents.length == 0)
                                        return Center(child: Text("Not Found"));

                                      return Expanded(
                                        child: SizedBox(
                                          //duration: Duration(seconds: 1),

                                          height: 70,

                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                    width: 170,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color:
                                                              Colors.cyan[300],
                                                          blurRadius: 10.0,
                                                        )
                                                      ],
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                    ),
                                                    child: Column(
                                                      children: <Widget>[
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                  boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                          .cyan[
                                                                      300],
                                                                  blurRadius:
                                                                      5.0,
                                                                )
                                                              ],
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              15),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              15)),
                                                                  image:
                                                                      DecorationImage(
                                                                    image:      snapshots.data.documents[index]["photo"]!=null? NetworkImage(
                                                                       snapshots.data.documents[index]["photo"]
                                                                       
                                                                       ):AssetImage("images/default.png"),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )
                                                                  ),
                                                          height: 149,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: <Widget>[
                                                            Text(
                                                              snapshots.data
                                                                      .documents[
                                                                  index]["Name"],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontFamily:
                                                                      "Oswald"),
                                                            ),
                                                            Column(
                                                              children: <
                                                                  Widget>[
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .amber,
                                                                  size: 25,
                                                                ),
                                                                Text(
                                                                  snapshots
                                                                      .data
                                                                      .documents[
                                                                          index]
                                                                          [
                                                                          "rate"]
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontFamily:
                                                                          "Oswald",
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                         Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: <Widget>[
                                                        IconButton(icon: Icon(Icons.delete_outline),
                                                         onPressed: () { 

       Dialogs.yesAbortDialog(
                              context, snapshots.data.documents[index].documentID, "Restaurants");

                                                          },),
                                                            Text("-"),
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

bottomSheet(context, NewRestaurant(restuaranto: admin_ser().convertSnapToRestaurant(snapshots.data.documents[index]),));
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
    MaterialPageRoute(builder: (context) => loc.MyApp(object:admin_ser().convertSnapToRestaurant(snapshots.data.documents[index]),col: "Restaurants",)));   


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

                      bottomSheet(context, res.UploadImage(null, admin_ser().convertSnapToRestaurant(snapshots.data.documents[index])));
/*  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DestinationScreen(Citysnap:snapshot.data.documents[index] ,Collection: "tourismPlaces",barName: "Toursim Attractions",),)
  ); */
                                                 },

                                               ))

/////////////////////////////////////////////////////////////////////////////////////////////////////////


                                     ],
                                   ),
                                                          ],
                                                        ),
                                                      ],
                                                    )),
                                              );
                                            },
                                            itemCount:
                                                snapshots.data.documents.length,
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : Container()

                            ////////////
                          ],
                        ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.cyan[300],
                              blurRadius: 10.0,
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),

                    /////////////////////////Third Anumated Container

                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: tourHeight,
                        curve: Curves.bounceIn,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                   Text(
                                  "   Tourism Places",
                                  style: TextStyle(
                                      color: Colors.blue[200],
                                      fontWeight: FontWeight.w200,
                                      fontSize: 25,
                                      fontFamily: "Oswald"),
                                ),
                                FlatButton(
                                    onPressed: () {
                                      if (hotelHeight == 60) {
                                        new Timer(Duration(seconds: 2), () {
                                          setState(() {
                                            visible3 = true;
                                          });
                                        });
                                      } else {
                                        setState(() {
                                          visible3 = false;
                                        });
                                      }

                                      setState(() {
                                        tourHeight == 60
                                            ? tourHeight = 300
                                            : tourHeight = 60;
                                      });
                                    },
                                    child: tourHeight == 300 ? Icon(Icons.expand_less,color:Colors.blue ,size: 40,)
                                    : Icon(Icons.expand_more,color: Colors.blue,size: 40,))
                              ],
                            ),

                            visible3 && tourHeight == 300
                                ? FutureBuilder(
                                    future: admin_ser().getCity_Places(
                                        _city.documentID, "tourismPlaces"),
                                    builder: (context, snapshots) {
                                      if (!snapshots.hasData) {
                                        return Stack(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(30.0),
                                              child: Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                            ),
                                          ],
                                        );
                                      }

                                      if (snapshots.data.documents.length == 0)
                                        return Center(child: Text("Not Found"));

                                      return Expanded(
                                        child: SizedBox(
                                          //duration: Duration(seconds: 1),

                                          height: 70,

                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                    width: 170,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color:
                                                              Colors.cyan[300],
                                                          blurRadius: 10.0,
                                                        )
                                                      ],
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                    ),
                                                    child: Column(
                                                      children: <Widget>[
                                                        Container(
                                                          /*  
       child: FloatingActionButton(
                       //    padding: EdgeInsets.only(left:50),
                       child: Icon(
                         Icons.delete,
                         color: Colors.red,
                       ),
                       onPressed: () {
                         Dialogs.yesAbortDialog(
                             context, getID(snapshots.data.documents[index]), "tourismPlaces");
                       }
                       
                       
                       ), */

                                                          decoration:
                                                              BoxDecoration(
                                                                  boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                          .cyan[
                                                                      300],
                                                                  blurRadius:
                                                                      5.0,
                                                                )
                                                              ],
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              15),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              15)),
                                                                  image:
                                                                      DecorationImage(
                                                                    image:      snapshots.data.documents[index]["photo"]!=null? NetworkImage(
                                                                       snapshots.data.documents[index]["photo"]
                                                                       
                                                                       ):AssetImage("images/default.png"),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )
                                                                  
                                                                  
                                                                  ),
                                                          height: 139,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: <Widget>[
                                                            Text(
                                                              snapshots.data
                                                                      .documents[
                                                                  index]["Name"],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontFamily:
                                                                      "Oswald"),
                                                            ),
                                                            Column(
                                                              children: <
                                                                  Widget>[
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .amber,
                                                                  size: 25,
                                                                ),
                                                                Text(
                                                                  snapshots
                                                                      .data
                                                                      .documents[
                                                                          index]
                                                                          [
                                                                          "rate"]
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontFamily:
                                                                          "Oswald",
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                           Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: <Widget>[
                                                        IconButton(icon: Icon(Icons.delete_outline),
                                                         onPressed: () { 

       Dialogs.yesAbortDialog(
                              context, snapshots.data.documents[index].documentID, "accommodation");

                                                          },),
                                                            Text("-"),
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

bottomSheet(context, NewTourismPlace(tourismPlace:admin_ser().convertSnapToTourismPlace(snapshots.data.documents[index]),));
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
    MaterialPageRoute(builder: (context) => loc.MyApp(object:admin_ser().convertSnapToTourismPlace(snapshots.data.documents[index]),col: "tourismPlaces",)));   


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

                      bottomSheet(context, tou.UploadImage(null, admin_ser().convertSnapToTourismPlace(snapshots.data.documents[index])));
/*  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DestinationScreen(Citysnap:snapshot.data.documents[index] ,Collection: "tourismPlaces",barName: "Toursim Attractions",),)
  ); */
                                                 },

                                               ))

/////////////////////////////////////////////////////////////////////////////////////////////////////////


                                     ],
                                   ),
                                                          ],
                                                        ),
                                                      ],
                                                    )),
                                              );
                                            },
                                            itemCount:
                                                snapshots.data.documents.length,
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : Container()

                            ////////////

                            ///

                            ///

                            ///
                          ],
                        ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.cyan[300],
                              blurRadius: 10.0,
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),

//////////////////////Second Animated Container
            ],
          )),
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
