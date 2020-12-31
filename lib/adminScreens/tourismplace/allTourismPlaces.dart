import 'dart:typed_data';
import 'package:traveliano/adminScreens/tourismplace/AdTourism.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:traveliano/adminScreens/dialog.dart';
import 'package:traveliano/adminScreens/editLocation.dart';
import 'package:traveliano/adminScreens/tourismplace/addImage.dart';
import 'package:traveliano/globals.dart';
import 'package:traveliano/services/admin.dart';
import 'package:traveliano/adminScreens/locationpreview.dart' as location;
import 'package:traveliano/load.dart';

import 'newTourismPlace2.dart';

class tourismPlace extends StatefulWidget {
  @override
  _tourismPlaceState createState() => _tourismPlaceState();
}

class _tourismPlaceState extends State<tourismPlace> {

  DocumentSnapshot pressedDoc = null;

/*   ////////////////////////////////////////
  Widget TplaceDetails(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          pressedDoc = null;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                  Divider(
                    color: Colors.cyan,
                    height: 5.0,
                  ),
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
                                SvgPicture.asset("images/tourism.svg",height: 50.0,),
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
                                      pressedDoc.data['rate'].toString(),
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
                     
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Tickets or any fees: " +
                                    pressedDoc.data["Cost"].toString() +
                                    "\$ per person"),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  pressedDoc.data['Description'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                              ),
                              // Icon(Icons.restaurant),
                            ],
                          ),
                        ],
                      )),

                  Divider(
                    color: Colors.cyan,
                    height: 30.0,
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(1.0),
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'http://i.imgur.com/74sByqd.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(1.0),
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'http://i.imgur.com/74sByqd.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(1.0),
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'http://i.imgur.com/74sByqd.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(1.0),
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'http://i.imgur.com/74sByqd.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.amber,
                blurRadius: 3.0,
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

 */
////////////////////////////////////////////
  Tplaces(BuildContext context, DocumentSnapshot snap) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () async {
var x=admin_ser().convertSnapToTourismPlace(snap);

  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => tourismDetails(hotel:x,),
  ));


        },
        child: Padding(
          padding: const EdgeInsets.all(0.0),
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
              padding: const EdgeInsets.all(15.0),
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
                            
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 150,
                          child: Text(
                            snap.data["Name"],
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style:
                                TextStyle(color: Colors.blue, fontSize: 18),
                          ),
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

bottomSheet(context, NewTourismPlace(tourismPlace: admin_ser().convertSnapToTourismPlace(snap),));
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
    MaterialPageRoute(builder: (context) => MyApp(object:admin_ser().convertSnapToHotel2(snap),col:"tourismPlaces",)));   
 
//print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
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

                                                   bottomSheet(context, UploadImage(null, admin_ser().convertSnapToTourismPlace(snap)));
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
                              context, snap.documentID, "tourismPlaces");
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


String SearchText=null;
  @override
  Widget build(BuildContext context) {
    Widget searchfield = TextFormField(
      cursorWidth: 1.2, obscureText: false,

      //        controller:_TourismPlace_Name,
onChanged: (val){
setState(() {
  SearchText=val;
});


},
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
        suffixIcon: Icon(
          Icons.search,
          color: Colors.green,
        ),
        //  filled: true,

        hintText: "Search for Tourism place ...",
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

      return Scaffold(


        
     floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: FloatingActionButton(heroTag: "kjkj",
          onPressed: (){






Navigator.push(context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation)=>NewTourismPlace(tourismPlace: null,),
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: searchfield,
                  ),
                  preferredSize: Size.fromHeight(50),
                ),

                //   leading: Icon(Icons.filter_list,color: Colors.green,) ,
                actions: <Widget>[],
                title: Text("Top Tourism Places",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20,
                        fontWeight: FontWeight.w900)),

            //    centerTitle: true,
                
                 backgroundColor: Colors.white,
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
            body:/* pressedDoc !=null?TplaceDetails(context):  */Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child:
              
               StreamBuilder(
                stream: SearchText==null?
             
                admin_ser().getTourismPlacesStream()
                :
             admin_ser().SearchStream(SearchText,"tourismPlaces","Name"),
              
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
                              Text("Oops,No Tourism Places Found \n click + button to add",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w100 ,fontSize: 15)),
                            ],
                          ));
                  return ListView.builder(
                    itemBuilder: (context, index) =>
                        Tplaces(context, snapshots.data.documents[index]),
                    itemCount: snapshots.data.documents.length,
                  );
                },
              ),
            ));
  }
}
