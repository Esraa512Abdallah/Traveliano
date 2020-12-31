import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:traveliano/adminScreens/users.dart';
import 'package:traveliano/models/restuarant.dart';
import 'package:traveliano/services/admin.dart';
import 'package:shimmer/shimmer.dart';

class ratePlacesEx extends StatefulWidget {

String collectionName;
String cityId;
ratePlacesEx({this.cityId});
  @override
  _ratePlacesExState createState() => _ratePlacesExState();
}

class _ratePlacesExState extends State<ratePlacesEx> {


  

   String _SearchText;









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
    
        hintText: "Search for places ...",
        contentPadding: EdgeInsets.all(10),
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
      backgroundColor: Colors.black45,
      body: SafeArea(
              child: ListView(
          children: <Widget>[




Container(color: Colors.white,
width: MediaQuery.of(context).size.width,
child:searchfield,



),



            Container(color: Colors.white,
          height: 160,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
              future: _SearchText==null?admin_ser().getCity_Places(widget.cityId, "accommodation")
              :Firestore.instance.collection("accommodation").where("cityId",isEqualTo: widget.cityId)
              .where("Name",isGreaterThanOrEqualTo: searchtxt).getDocuments(),

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
        ),



           Container(color: Colors.white,
          height: 160,
          width:  MediaQuery.of(context).size.width,
          child: FutureBuilder(
              future:_SearchText==null?admin_ser().getCity_Places(widget.cityId, "tourismPlaces")
              :Firestore.instance.collection("tourismPlace").where("cityId",isEqualTo: widget.cityId)
              .where("Name",isGreaterThanOrEqualTo: searchtxt).getDocuments(),
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
        ),
        
        
        
               Container(color: Colors.white,
          height: 160,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
              future:_SearchText==null?admin_ser().getCity_Places(widget.cityId, "Restaurants")
              :Firestore.instance.collection("Restaurants").where("cityId",isEqualTo: widget.cityId)
              .where("Name",isGreaterThanOrEqualTo: searchtxt).getDocuments(),
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
        ),
        
          ],
        ),
      ),
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
                return Shimmer.fromColors(
                  
                  child: Container(
                  margin: EdgeInsets.all(5),
                 width: 150,
                  decoration: BoxDecoration(color: Colors.white
                  ,borderRadius: BorderRadius.circular(20)),)
                , 
                baseColor: Colors.white, highlightColor: Colors.grey[300]);
              } 

          return Objectwidget(snapshot);
        },
      ),
      //  child: child,
    );
  }

  Objectwidget( AsyncSnapshot<Restuarant> snap) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        padding: EdgeInsets.fromLTRB(4, 4, 4, 5),
        decoration: BoxDecoration(
borderRadius: BorderRadius.circular(20),
color:Colors.grey[200],
        ),
       // height: 180,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(//height: 70,
                    width: 140,
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
                                image:  snap.data.photo!=null?NetworkImage(
                                  snap.data.photo,
                                ):AssetImage(
                                 "images/default.png"
                                )
                                ,fit: BoxFit.cover,
                              ) ),
                          height: 80,
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
                        
                   
                      ],
                    )
                    ),
          
          
          
          
          
          
          
              ],
            ),
          
          
    
               Positioned(//bottom: 2,
               
                          child: Align(
                            alignment: Alignment.bottomCenter,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left:8.0),
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
                                          "userId": Provider.of<FirebaseUser>(context,listen: false)
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
                                size: 25.0,
                                color: Colors.amber,
                                borderColor: Colors.teal,
                                spacing: 0.0),
                                                    ),
                          ),
                        )
             
          
          
          ],
        ),
      ),
    );
  }
}
