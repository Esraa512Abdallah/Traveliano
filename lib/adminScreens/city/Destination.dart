import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:traveliano/adminScreens/city/placeDetails.dart';
import 'package:traveliano/animation/fadeAnimmation.dart';
import 'package:traveliano/globals.dart';
import 'package:traveliano/load.dart';
import 'package:traveliano/models/city.dart';
import 'package:traveliano/adminScreens/locationpreview.dart' as loca;
import 'package:traveliano/services/admin.dart';
//import 'package:flutter_travel_ui/models/activity_model.dart';
//import 'package:flutter_travel_ui/models/destination_model.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinationScreen extends StatefulWidget {
  DocumentSnapshot Citysnap;
  String Collection;
  String barName;

  DestinationScreen({this.Citysnap, this.Collection, this.barName});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool ismap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    /*   appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Top " + widget.barName,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w800)),
      ), */
      body: FutureBuilder(
        future: Firestore.instance
            .collection(widget.Collection)
            .where("cityId", isEqualTo: widget.Citysnap.documentID)
            .getDocuments(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (!snap.hasData) return load("Loading ... please wait");
          if (snap.data.documents.length == 0)
            return Container(
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Icon(
                      Icons.sentiment_dissatisfied,
                      size: MediaQuery.of(context).size.width - 80,
                      color: Colors.grey[200],
                    ),
                  ),
                  Center(
                      child: Text(
                    "Oops,nothing to display",
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.grey),
                  )),
                ],
              ),
            );

          return ListView.builder(
              itemCount: snap.data.documents.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(49.0, 2.0, 5.0, 5.0),
                      height: 190.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        /*      image:DecorationImage(image: 
                  
                  NetworkImage(   snap.data.documents[index]["photo"])
                  ,
                  fit: BoxFit.cover
                  ), */

                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 1.0,
                              spreadRadius: 3.0)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 140.0,
                                  //  color: Colors.black26,
                                  child: InkWell(
                                    onTap: () {
//Navigate to page
                                    },
                                    child: InkWell(

                                      onTap: () async {

DocumentSnapshot doc=snap.data.documents[index];
 var users=  await admin_ser().getRateUsers(widget.Collection,doc.documentID);
Navigator.push(context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation)=>placeDetails(barName: "Details",Collection: widget.Collection,placeSnap: snap.data.documents[index] ,users: users,),
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
                                      child: Text(
                                        snap.data.documents[index]["Name"],
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: "Oswald",
                                          color: Colors.amber,
                                          // fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    child: Stack(
                                      children: <Widget>[
                                        snap.data.documents[index]['rate'] > 4
                                            ? Icon(
                                                Icons.star,
                                                size: 35,
                                                color: Colors.amber,
                                              )
                                            : snap.data.documents[index]
                                                        ['rate'] >
                                                    2
                                                ? Icon(
                                                    Icons.star_half,
                                                    size: 35,
                                                    color: Colors.amber,
                                                  )
                                                : Icon(
                                                    Icons.star_border,
                                                    size: 35,
                                                    color: Colors.amber,
                                                  ),
                                        Center(
                                          child: Text(
                                            snap.data.documents[index]['rate']
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ) /////////
                              ],
                            ),

//Text(snap.data.documents[index]["country"]),

                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  color: Colors.grey[400],
                                ),
                                Text(
                                  widget.Citysnap.data["Name"],
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            /*    Row(
                        children: <Widget>[

                          Text("2.5"),
                          _buildRatingStars(4),
                        ],
                      ), */
                            SizedBox(height: 10.0),
                            /*        Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5.0),
                            width: 70.0,
                            decoration: BoxDecoration(
                              color: Colors.red[300],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                            "Winter",
                            style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Container(
                            padding: EdgeInsets.all(5.0),
                            width: 70.0,
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                             "Ski",
                            ),
                          ),
                        ],
                      ) */

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: widget.Collection == "accommodation"
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          snap.data.documents[index]["minPrice"]
                                                  .toString() +
                                              "\$",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Text("-"),
                                        Text(
                                          snap.data.documents[index]["maxPrice"]
                                                  .toString() +
                                              "\$",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w300),
                                        )
                                      ],
                                    )
                                  : Row(
                                      children: <Widget>[
                                        Text(
                                          "Avg Cost :",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          snap.data.documents[index]["Cost"]
                                                  .toString() +
                                              "\$",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        left: 10.0,
                        top: 15.0,
                        bottom: 15.0,
                        child: FadeAnimation(
                          1,
                          Container(
                            height: 110,
                            width: 135,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: snap.data.documents[index]
                                                ["photo"] ==
                                            null
                                        ? AssetImage("images/default.png")
                                        : NetworkImage(
                                            snap.data.documents[index]["photo"],
                                          ),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        Colors.black26, BlendMode.screen))),
                          ),
                        )),
                  ],
                );
              });
        },
      ),
    );
  }
}
