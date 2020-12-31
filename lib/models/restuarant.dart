
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class Restuarant{
  


double latitude;
double longtude;

String Id;
String Name;
double rate;
String cityId;

int cost;
String foodType;

  var photo;


 double currentUserRate;

  

Future loadRate(context) async {

var userid=Provider.of<FirebaseUser>(context).uid.toString();
await Firestore.instance
.collection("Restaurants")
.document(this.Id).collection("Rates")
.where("userId",isEqualTo: userid)
.getDocuments().then((docs){

if(docs.documents.length==0)this.currentUserRate=0;
else this.currentUserRate= double.parse(docs.documents[0].data["rate"].toString()) ;

});}
/* 
Future<void> loadExperinceRate(context) async {

var userid=Provider.of<FirebaseUser>(context).uid.toString();
await Firestore.instance.collection("Experience")
.document(this.Id).collection("Rates")
.where("userId",isEqualTo: userid)
.getDocuments().then((docs){

if(docs.documents.length==0)this.currentUserRate=0;
else this.currentUserRate= double.parse(docs.documents[0].data["rate"].toString()) ;
});}





 */






}





































/**
 * 


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:traveliano/models/restuarant.dart';
import 'package:traveliano/services/admin.dart';

class ratePlacesEx extends StatefulWidget {

String collectionName;
String cityId;

  @override
  _ratePlacesExState createState() => _ratePlacesExState();
}

class _ratePlacesExState extends State<ratePlacesEx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
          child: Container(color: Colors.white,
        height: 250,
        width: 300,
        child: FutureBuilder(
            future: admin_ser()
                .getCity_Places('-M5ySSgOmvwYJ-wnr2mr', "Restaurants"),
            builder: (context, snapshots) {
              if (!snapshots.hasData) {
                return Center(
                    child: SpinKitCircle(
                  color: Colors.black45,
                  size: 100,
                )
                );
              }
              if (snapshots.data.documents.length == 0) {
                return Center(
                  child: Text("Hit Next to skip"),
                );
              }

              return ListView.builder(
                scrollDirection: Axis.horizontal,
            
          itemBuilder: (BuildContext context, int index) {
               
          Restuarant _restuarant;
          _restuarant= admin_ser().convertSnapToRestaurant(
                        snapshots.data.documents[index]);
               



               
            return   rate(object:
                  _restuarant
                  );
               
               
               
               
               
                },
                itemCount: snapshots.data.documents.length,
              );
            }),
      )),
    );
  }
}

class rate extends StatefulWidget {
  Restuarant object ;
  rate({this.object});
 
  @override
  _rateState createState() => _rateState();
}

class _rateState extends State<rate> {
 

   Restuarant obj ;


  Future<Restuarant> _load() async {
   await   obj.loadRate(context);
    return obj;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

obj=widget.object;

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _load(),
        //   initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot<Restuarant> snapshot) {



  if (!snapshot.hasData) {
                return Center(
                    child: SpinKitDualRing(
                  color: Colors.red,
                  size: 50,
                )
                );
              } 

          return Objectwidget(snapshot);
        },
      ),
      //  child: child,
    );
  }

  Objectwidget( AsyncSnapshot<Restuarant> snap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 150,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.red,
                blurRadius: 10.0,
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.cyan[300],
                        blurRadius: 5.0,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                     image: DecorationImage(
                      image: NetworkImage(
                        snap.data.photo,
                      ),
                      fit: BoxFit.cover,
                    ) ),
                height: 157,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
               // "Name", 
                  snap.data.Name,
                    style: TextStyle(color: Colors.black, fontFamily: "Oswald"),
                  ),
                  Column(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 25,
                      ),
                      Text(
                             snap.data.rate.toString(),
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: "Oswald",
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                child: SmoothStarRating(
                    allowHalfRating: true,
                    //     defaultIconData: IconData(),
                    onRatingChanged: (val) async {
/////////////////////////////////////////////////////////////////////////////////

                           if (  obj.currentUserRate == 0) {
                            await Firestore.instance
                                .collection("Restaurants")
                                .document(snap.data.Id)
                                .collection("Rates")
                                .add({
                              "userId": Provider.of<FirebaseUser>(context)
                                  .uid
                                  .toString(),
                              "rate": val
                            });
                            setState(() {
                            obj.currentUserRate = val;
                            });
                          } else {
                            String rateID;
                            await Firestore.instance
                                .collection("Restaurants")
                                .document(obj.Id)
                                .collection("Rates").where("userId",
                                isEqualTo:Provider.of<FirebaseUser>(context).uid)
                                .getDocuments()
                                .then((docs) {
                              rateID = docs.documents.first.documentID;
                            });

                            if (val ==   obj.currentUserRate) {
                              await Firestore.instance
                                  .collection("Restaurants")
                                  .document(obj.Id).collection("Rates")
                                  .document(rateID)
                                  .delete();

                              setState(() {
                            obj.currentUserRate = 0;
                              });
                            } else {
                              await Firestore.instance
                                  .collection("Restaurants")
                                  .document(obj.Id).collection("Rates")
                                  .document(rateID)
                                  .updateData({"rate": val});

                                      setState(() {
                               obj.currentUserRate = val;
                              });
                            }
                          } 




                          ///////////////////////////////////
                    },
                    starCount: 5,
                    rating: snap.data.currentUserRate,
                    size: 30.0,
                    color: Colors.amber,
                    borderColor: Colors.teal,
                    spacing: 0.0),
              )
            ],
          )),
    );
  }
}



 */