import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveliano/animation/fadeAnimmation.dart';
//import 'package:traveliano/services/admin.dart';

class homePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homePageState();
  }
}

class homePageState extends State<homePage> {
  double rating = 0;
  Future<QuerySnapshot> getDocs(String ColName) async {
    QuerySnapshot x =
    await Firestore.instance.collection(ColName).getDocuments();
    return x;
  }

  Future<DocumentSnapshot> getUser(String id) async {
    DocumentReference x =
    await Firestore.instance.collection("Users").document(id);
    DocumentSnapshot user = await x.get();
    return user;
  }









  ScrollController _hideButtonController;

  var _isVisible;
  @override
  initState(){
    super.initState();
    _isVisible = true;
    _hideButtonController = new ScrollController();
    _hideButtonController.addListener((){
      if(_hideButtonController.position.userScrollDirection == ScrollDirection.reverse){
        if(_isVisible == true) {
          /* only set when the previous state is false
             * Less widget rebuilds
             */
          print("**** ${_isVisible} up"); //Move IO away from setState
          setState((){
            _isVisible = false;
          });
        }
      } else {
        if(_hideButtonController.position.userScrollDirection == ScrollDirection.forward){
          if(_isVisible == false) {
            /* only set when the previous state is false
               * Less widget rebuilds
               */
            print("**** ${_isVisible} down"); //Move IO away from setState
            setState((){
              _isVisible = true;
            });
          }
        }
      }});
  }



  @override
  build(BuildContext context) {
    // TODO: implement build



    return Scaffold(

     floatingActionButton:_isVisible==true?
       FadeAnimation(1
                , FloatingActionButton(onPressed: (){},
          child: Icon(Icons.add,size: 35,),elevation: 7.0,backgroundColor: Colors.purple[200],),
       ):null,

      body: FutureBuilder<QuerySnapshot>(
          future: getDocs("Experience"),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text("Loading."),
              );
            }
            return FutureBuilder(
                future: getDocs('Users'),
                builder: (BuildContext context, AsyncSnapshot snapshot2) {
                  if (!snapshot2.hasData) {
                    return Center(
                      child: Text("Loading.."),
                    );
                  }
                  return FutureBuilder<QuerySnapshot>(
                      future: getDocs('Cities'),
                      builder: (context, snapshot3) {
                        if (!snapshot3.hasData) {
                          return Center(
                            child: Text("Loading..."),
                          );
                        }
                        return FutureBuilder<QuerySnapshot>(
                            future: getDocs('ExperienceRate'),
                            builder: (context, snapshot4) {
                              if (!snapshot4.hasData) {
                                return Center(
                                  child: Text("Loading..."),
                                );
                              }
                            return ListView.builder(
                              controller: _hideButtonController,
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) {
                                String userId =
                                snapshot.data.documents[index]['userid'];
                                String cityid =
                                snapshot.data.documents[index]['cityid'];

                                var usersMap = snapshot2.data.documents.asMap();
                                var CitiesMap = snapshot3.data.documents.asMap();
                                var ExperienceMap = snapshot.data.documents.asMap();
                                var experienceRateMap = snapshot4.data.documents.asMap();


                                String firstName = 'firstName';
                                String lastName = 'lastName';
                                String photo = 'image';
                                String hometown = 'hometown';
                                String timestamp = 'timestamp';
                                usersMap.forEach((len, snap) {
                                  print("Position: $len, Data: ${snap.data["firstName"]}");

                                  if (snap.documentID == userId) {
                                    firstName = snap.data["firstName"].toString();
                                    lastName = snap.data["lastName"].toString();
                                    photo = snap.data["photo"].toString();
                                    hometown = snap.data["hometown"].toString();
                                    timestamp = snap.data["timestamp"].toString();
                                  }
                                });
                                String CityName = 'CityName';

                                CitiesMap.forEach((len, snap) {
                                  if (snap.documentID == cityid) {
                                    CityName = snap.data["Name"].toString();
                                  }
                                });

                                String experienceid = 'experienceid';
                                ExperienceMap.forEach((len, snap1) {
                                  experienceid = snap1.documentID;
                                });

                                String experienceRateid = 'experienceRateid';
                               // var x = snapshot4.data.documents[index]['rate'] ;
                                var Sum = 0.0 ,Count=0.0,Result=0.0;
                                ExperienceMap.forEach((len, snap1) {

                                  experienceRateMap.forEach((len, snap4) {

                                    if(snap4.data['experienceId']== snap1.documentID) {

                                      Sum = Sum + snap4.data['rate'] ;
                                      Count++;
                                      Result= Sum /Count ;

                                  /*     Firestore.instance
                                          .collection(
                                          'Experience')
                                          .document(snap1.documentID)
                                          .updateData({

                                 //      'rate':'${Result.toStringAsPrecision(3)}',
                                   //     'currentUserId': '${snap4.data['rate']}',
                 
                                      }); */
           

                                   }
                                  });


                                  print('=========='+snap1.documentID +'==========');
                                  print ( Sum);
                                  print(Count);
                                  print(Result);
                                  Sum = 0.0;
                                  Count=0.0;
                                  Result=0.0;



                                });




                                var  _experienceId = snapshot.data.documents[index].documentID ;
                                var  _userId = snapshot.data.documents[index]['userid'] ;


                                return Column(
                                children: <Widget>[
                                  Stack(
                                    overflow: Overflow.visible,
                                    children: <Widget>[
                                      Container(
                                        height: 480,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(33.0),
                                          ),
                                          elevation: 5,
                                          color: Colors.white,
                                          margin: EdgeInsets.only(
                                              bottom: 10,
                                              right: 10,
                                              left: 10,
                                              top: 10),
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment: 
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        Container(
                                                          height: 70,
                                                          width: 70,
                                                          decoration: BoxDecoration(
                                                              image: new DecorationImage(
                                                                  image:
                                                                  new NetworkImage(
                                                                      photo),
                                                                  fit: BoxFit
                                                                      .cover),
                                                              shape: BoxShape
                                                                  .rectangle),
                                                        ),
                                                        Container(
                                                          padding:
                                                          EdgeInsets.only(
                                                              top: 10),
                                                          margin:
                                                          EdgeInsets.only(
                                                              left: 11),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: <Widget>[
                                                              Container(
                                                                child: Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                        firstName,
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .teal,
                                                                            fontSize:
                                                                            22,
                                                                            fontFamily:
                                                                            'Bitter',
                                                                            fontWeight:
                                                                            FontWeight.w600)),
                                                                    Text(" "),
                                                                    Text(
                                                                        lastName,
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .teal,
                                                                            fontSize:
                                                                            22,
                                                                            fontFamily:
                                                                            'Bitter',
                                                                            fontWeight:
                                                                            FontWeight.w600)),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 2,
                                                              ),
                                                              Row(
                                                                children: <
                                                                    Widget>[
                                                                  Text(hometown,
                                                                      style: TextStyle(
                                                                          color:
                                                                          Colors.grey)),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                //   crossAxisAlignment: CrossAxisAlignment.end,
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                      "timestamp   ",
                                                                      style: TextStyle(
                                                                          color:
                                                                          Colors.grey)),

                                                                  //           SvgPicture.asset('images/khalifa.svg',height: 30,width:30,color:Colors.pink[300] ,),
                                                                  Icon(
                                                                    Icons.star,
                                                                    color: Colors
                                                                        .amber,
                                                                  ),

                                                                  Text(
                                                                      snapshot
                                                                          .data
                                                                          .documents[index] ['rate']
                                                                          .toString(),
                                                                      style: TextStyle(
                                                                          color:
                                                                          Colors.blue[500])
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 3,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),

                                                Column(
                                                  children: <Widget>[
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 16, bottom: 16),
                                                      child: Column(
                                                        // crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: <Widget>[
                                                          /***********************************************************************************************************/

                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: <Widget>[
                                                              Text(
                                                                  "Traveled To ",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                              Card(
                                                                shape:
                                                                RoundedRectangleBorder(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      18.0),
                                                                ),
                                                                // elevation:2,
                                                                color: Colors
                                                                    .grey[200],
                                                                //          margin:EdgeInsets.only(right:5,left:190 ),
                                                                // padding:EdgeInsets.all(10 ),

                                                                child: Row(
                                                                  // crossAxisAlignment: CrossAxisAlignment.start,

                                                                  children: <
                                                                      Widget>[
                                                                    Container(
                                                                      padding:
                                                                      EdgeInsets.all(
                                                                          10),
                                                                      child:
                                                                      Row(
                                                                        children: <
                                                                            Widget>[
                                                                          Text(
                                                                            CityName,
                                                                            style: TextStyle(
                                                                                color: Colors.teal,
                                                                                fontWeight: FontWeight.w800,
                                                                                fontFamily: 'ShadowsIntoLight',
                                                                                fontSize: 20),
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
/***********************************************************************************************************/
                                                          SizedBox(
                                                            height: 13,
                                                          ),
                                                          Column(
                                                            children: <Widget>[
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Container(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                                  children: <
                                                                      Widget>[
                                                                    Text('From',
                                                                        style: TextStyle(
                                                                            color:
                                                                            Colors.black,
                                                                            fontWeight: FontWeight.w600)),
                                                                    //Text(,style: TextStyle(color: Colors.blue)),
                                                                    Card(
                                                                      shape:
                                                                      RoundedRectangleBorder(
                                                                        borderRadius:
                                                                        BorderRadius.circular(18.0),
                                                                      ),
                                                                      // elevation:2,
                                                                      color: Colors
                                                                          .grey[
                                                                      200],
                                                                      //          margin:EdgeInsets.only(right:5,left:190 ),
                                                                      // padding:EdgeInsets.all(10 ),

                                                                      child:
                                                                      Row(
                                                                        // crossAxisAlignment: CrossAxisAlignment.start,

                                                                        children: <
                                                                            Widget>[
                                                                          Container(
                                                                            padding:
                                                                            EdgeInsets.all(10),
                                                                            child:
                                                                            Row(
                                                                              children: <Widget>[
                                                                                Text(
                                                                                  snapshot.data.documents[index]['startdate'],
                                                                                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500, fontFamily: 'Chewy', fontSize: 15),
                                                                                ),

                                                                                //    Text(' city',style:  TextStyle(color: Colors.teal,
                                                                                //      fontWeight:FontWeight.w800,fontFamily: 'ShadowsIntoLight',fontSize:20 ),),
                                                                              ],
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),

                                                                    Text(' To ',
                                                                        style: TextStyle(
                                                                            color:
                                                                            Colors.black,
                                                                            fontWeight: FontWeight.w600)),
                                                                    Card(
                                                                      shape:
                                                                      RoundedRectangleBorder(
                                                                        borderRadius:
                                                                        BorderRadius.circular(18.0),
                                                                      ),
                                                                      // elevation:2,
                                                                      color: Colors
                                                                          .grey[
                                                                      200],
                                                                      //          margin:EdgeInsets.only(right:5,left:190 ),
                                                                      // padding:EdgeInsets.all(10 ),

                                                                      child:
                                                                      Row(
                                                                        // crossAxisAlignment: CrossAxisAlignment.start,

                                                                        children: <
                                                                            Widget>[
                                                                          Container(
                                                                            padding:
                                                                            EdgeInsets.all(10),
                                                                            child:
                                                                            Row(
                                                                              children: <Widget>[
                                                                                Text(
                                                                                  snapshot.data.documents[index]['enddate'],
                                                                                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500, fontFamily: 'Chewy', fontSize: 15),
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
                                                              Container(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                        'Budget ',
                                                                        style:
                                                                        TextStyle(
                                                                          color:
                                                                          Colors.black,
                                                                          fontFamily:
                                                                          '',
                                                                          fontWeight:
                                                                          FontWeight.w600,
                                                                        )),
                                                                    Card(
                                                                      shape:
                                                                      RoundedRectangleBorder(
                                                                        borderRadius:
                                                                        BorderRadius.circular(18.0),
                                                                      ),
                                                                      // elevation:2,
                                                                      color: Colors
                                                                          .grey[
                                                                      200],
                                                                      //          margin:EdgeInsets.only(right:5,left:190 ),
                                                                      // padding:EdgeInsets.all(10 ),

                                                                      child:
                                                                      Row(
                                                                        // crossAxisAlignment: CrossAxisAlignment.start,

                                                                        children: <
                                                                            Widget>[
                                                                          Container(
                                                                            padding:
                                                                            EdgeInsets.all(10),
                                                                            child:
                                                                            Row(
                                                                              //    mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: <Widget>[
                                                                                Text(
                                                                                  snapshot.data.documents[index]['budget'].toString() + '\$',
                                                                                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500,
                                                                                      fontFamily: 'Chewy', fontSize: 20),
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
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            color: Colors.white,
                                                            padding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                            child: Container(
                                                              //  elevation: 0.0,
                                                              height: 110,
                                                              child:
                                                              SingleChildScrollView(
                                                                child: Text(
                                                                    snapshot
                                                                        .data
                                                                        .documents[index]
                                                                    [
                                                                    'description']
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        height:
                                                                        1.5,
                                                                        fontSize:
                                                                        15,
                                                                        color: Colors
                                                                            .black54,
                                                                        fontFamily:
                                                                        '')),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                //        Divider(
                                                //        height:0.2 ,

                                                //      color:Colors.grey[300],

                                                //  ),

                                                ////////////////////

                                                ///////////////////////
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 10,
                                        left: 10,
                                        top: 420,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Container(
                                                padding:
                                                EdgeInsets.only(top: 15),
                                                child: FloatingActionButton(
                                                  child: SvgPicture.asset(
                                                    'images/chat.svg',
                                                    height: 30,
                                                    width: 30,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    print(snapshot
                                                        .data
                                                        .documents[index]
                                                        .documentID +
                                                        "           ######### Experince id");
                                                    //                print(snapshot2.data.documents[index].documentID+"           ######### User id");
                                                    //                   print(snapshot3.data.documents[index].documentID+"           ######### City id");
                                                  },
                                                )),
                                            Container(

                                              child: SmoothStarRating(
                                                  allowHalfRating: true,
                                                  onRatingChanged: (v) {
                                                    rating = v;
                                                    print(v.toString() +
                                                        "EX ID ____----___----____=" +
                                                        snapshot
                                                            .data
                                                            .documents[ index]
                                                            .documentID);
                                                    setState(() {
                                                      Firestore.instance
                                                          .collection(
                                                          'ExperienceRate')
                                                          .document()
                                                          .setData({
                                                        //'rate': ' ${rating}',
                                                        'rate': rating ,
                                                        'experienceId': _experienceId ,
                                                        'userId': _userId ,
                                                      });


                                                    });
                                                  },
                                                  starCount: 5,
                                                  rating: double.parse(snapshot
                                                      .data.documents[index]['currentUserId'] ),

                                                  size: 30.0,
                                                  color: Colors.amber,
                                                  borderColor: Colors.teal,
                                                  spacing: 0.0),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            });
                         });
                      });
                });
          }),
    );
  }
}











