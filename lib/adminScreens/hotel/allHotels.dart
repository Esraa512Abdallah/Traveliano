import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:traveliano/adminScreens/hotel/AdHotel.dart';
import 'package:traveliano/adminScreens/hotel/addAccommodation2.dart';
import 'package:traveliano/adminScreens/editLocation.dart' as loc;
import 'package:traveliano/adminScreens/hotel/addImage.dart';
import 'package:traveliano/globals.dart';
import 'package:traveliano/main.dart';


import 'package:traveliano/models/hotel.dart';
import 'package:traveliano/services/admin.dart';

import 'package:traveliano/load.dart';

import '../dialog.dart';

class hotel extends StatefulWidget {
  @override
  _hotelState createState() => _hotelState();
}

class _hotelState extends State<hotel> {







void _BottomSheet(context,Widget wid) {
    showModalBottomSheet(
    useRootNavigator: true,
    isScrollControlled: true,
    
    backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          decoration: BoxDecoration(

borderRadius: BorderRadius.circular(80)

          ),
        child:wid ,
        
        
        );});
        }







  Widget Hotels(BuildContext context, DocumentSnapshot snap) {






    
    return SizedBox(
      height: 80,
      child: Container(
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
                        InkWell(

                          onTap: (){

   
Navigator.push(context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation)=>hotelDetails(hotel:admin_ser().convertSnapToHotel(snap) ),
   transitionDuration: Duration(milliseconds: 1000),
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
                                                    child: Container(

                                                      width: 150,
                                                      child: Text(
                           snap.data['Name'].toString(),
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: TextStyle(color: Colors.blue, fontSize: 18),
                          ),
                                                    ),
                        ),
                        //              Text(snap.data["country"]),
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

_BottomSheet(context, NewAccommodation(hotel:admin_ser().convertSnapToHotel(snap)));
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



//_BottomSheet(context,MyApp(object:admin_ser().convertSnapToHotel(snap)));
 
                             Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => loc.MyApp(object:admin_ser().convertSnapToHotel(snap),col: "accommodation",)));   


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

                                                 bottomSheet(context, UploadImage(null, admin_ser().convertSnapToHotel(snap)));
/*  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DestinationScreen(Citysnap:snapshot.data.documents[index] ,Collection: "tourismPlaces",barName: "Toursim Attractions",),)
  ); */
                                               },

                                             ))

/////////////////////////////////////////////////////////////////////////////////////////////////////////


                                   ],
                                 ),
/*
 
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NewAccommodation(hotel:admin_ser().convertSnapToHotel(snap),),
  )); 

*/








                    
                     IconButton(
                      //    padding: EdgeInsets.only(left:50),
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        Dialogs.yesAbortDialog(
                            context, snap.documentID, "accommodation");
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
String _SearchText=null;
  @override
  Widget build(BuildContext context) {
  
    Widget searchfield = 
    
    TextFormField(

onChanged: (val){
setState(() {
  _SearchText=val;
});

},

      cursorWidth: 1.2, obscureText: false,

      //        controller:_TourismPlace_Name,

      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      autofocus: false,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      style: TextStyle(
       // backgroundColor: Colors.white,
        color: Colors.black,
        letterSpacing: .5,
        wordSpacing: 1.5,
        decorationStyle: TextDecorationStyle.solid,
        decorationColor: Colors.red,
      ),

      decoration: InputDecoration(
        suffixIcon: Icon(Icons.search,color: Colors.green,),
      //  filled: true,
    
        hintText: "Search for hotel ...",
        contentPadding: EdgeInsets.all(15),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
          gapPadding: 40.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),

    );



    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(

     floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: FloatingActionButton(
          onPressed: (){






Navigator.push(context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation)=>NewAccommodation(hotel: new Hotel(),),
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
                title: Text("Top Hotels/Hostels",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red[300],
                        fontSize: 20,
                        fontWeight: FontWeight.w900)),

                centerTitle: true, backgroundColor: Colors.white,
              ),
              preferredSize: Size.fromHeight(95),
            ),
            /*    appBar: AppBar(
          title: Text("search"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                })
          ],
        ),*/
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: 
              StreamBuilder(
                stream:_SearchText==null?admin_ser().getHotelsStream():
                admin_ser().SearchStream(_SearchText,"accommodation","Name")
                ,
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
     Text("Sorry,No Hotels/Hostels Found \n click + button to add",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w100 ,fontSize: 15)),
                            ],
                          ));

                  return ListView.builder(
                    itemBuilder: (context, index) =>
                        Hotels(context, snapshots.data.documents[index]),
                    itemCount: snapshots.data.documents.length,
                  );
                },
              ),
            )));
  }
}
