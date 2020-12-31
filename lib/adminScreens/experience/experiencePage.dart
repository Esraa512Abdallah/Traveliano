



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:traveliano/adminScreens/city/cityDetails.dart';
import 'package:traveliano/adminScreens/experience/exComments.dart';
import 'package:traveliano/models/experience.dart';
import 'package:traveliano/services/user.dart';
import 'package:traveliano/userScreens/strangeProfile.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../globals.dart';

class experiencePage extends StatefulWidget {
  AsyncSnapshot<Experience> exp;
  experiencePage({this.exp});
  @override
  experiencePageState createState() => experiencePageState();
}

class experiencePageState extends State<experiencePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
    SafeArea(child: this.ExWidget(widget.exp))
      
    );
  }












  Widget ExWidget(AsyncSnapshot<Experience> snap) {
    
    var reccommendedWeather;
    return ListView(
      children: <Widget>[
        Stack(
       
          children: <Widget>[
            Container(
            color: snap.data.userModel.Id==Provider.of<FirebaseUser>(context,listen: false).uid?Colors.white70:Colors.white,
              height: MediaQuery.of(context).size.height-120, 
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(33.0),
                ),
                elevation: 2,
               margin:
                    EdgeInsets.only(bottom: 25, right: 5, left:5, top: 1),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.indigo[300],
                                    image: new DecorationImage(
                                        image: new NetworkImage(
                                            snap.data.userModel.Photo),
                                        fit: BoxFit.cover),
                                    shape: BoxShape.circle),
                              ),
                              Container(color: Colors.transparent,
                                padding: EdgeInsets.only(top: 5),
                                margin: EdgeInsets.only(left: 11),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[



                                     Container(
                                           constraints: BoxConstraints(minWidth: 120, maxWidth: 160,maxHeight: 100,),
                                     
                                     
                                     //    color: Colors.white,
                                            //                               height: 50,
                                                                           child: Row(
                                      children: <Widget>[
                                        InkWell(

                                          onTap: () async {

var doc= await Firestore.instance.collection("Users")
.document(Provider.of<FirebaseUser>(context,listen: false).uid)
.collection("Following").document(snap.data.userId).get();
if(doc.data==null){
snap.data.userModel.follow=false;

}else  {snap.data.userModel.follow=true;
}




int x=await user_services().getTrips(snap.data.userId);
int y=await user_services().getFollowing(snap.data.userId);
int z= await user_services().getFollowers(snap.data.userId);

 Navigator.push(context,
    MaterialPageRoute(builder: (context)
    {return strangeProfile(selectedUser:snap.data.userModel,followers:z ,following:y ,trips:x ,); }));
 





                                          },
                                                                 child: Text(snap.data.userModel.firstName,
                                              style: TextStyle(
                                                  color: Colors.indigo[300],
                                                  fontSize: 17,
                                                  fontFamily: 'Bitter',
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        Text(" "),
                                        Text(snap.data.userModel.lastName,
                                            style: TextStyle(
                                                color: Colors.indigo[300],
                                                fontSize: 17,
                                                fontFamily: 'Bitter',
                                                fontWeight: FontWeight.w600)),


                                      /*      Text(" "+snap.data.userModel.lastName,
                                            style: TextStyle(
                                                color: Colors.indigo[300],
                                                fontSize: 17,
                                                fontFamily: 'Bitter',
                                                fontWeight: FontWeight.w600)), */

 

                                      ],
                                                                           ),
                                                                         ),
                                  
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(snap.data.userModel.hometown,
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      //   crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                            //"Time Stamp"
                                            //   snap.data.ExDate.,
                                            timeago.format(snap.data.ExDate),
                                            style:
                                                TextStyle(color: Colors.grey)),

                                        //           SvgPicture.asset('images/khalifa.svg',height: 30,width:30,color:Colors.pink[300] ,),
                                      
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                  ],
                                ),
                              ),
             
                FlatButton(onPressed: (){







bottomSheet(context,   Container(
                                  color: Colors.transparent,
                                  padding: EdgeInsets.all( 15),
                                  child: Container(
                                    //  elevation: 0.0,
                           //         height: 110,
                                    constraints: BoxConstraints(maxHeight: 200),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: <Widget>[
                              
                              
                  Text(snap.data.status+" Trip",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w600)) ,           
                              

                                          Text(
                                              snap.data.description.toString(),
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontSize: 15,
                                                  color: Colors.black54,
                                                  fontFamily: '')),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),);


                              },child: Icon(Icons.expand_more,color: Colors.indigo,size: 30,),
                              
                              ),
             
                            ],
                          ),
                        ],
                      ),

                      Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 16, bottom: 16),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                /***********************************************************************************************************/

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Traveled To ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600)),
                                    InkWell(


onTap: ()

async {


DocumentSnapshot doc= await Firestore.instance.collection("Cities").document(snap.data.cityId).get();

                                                            
                                   Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => cityDetails(doc)));
                   
    





},


                                                                          child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                        // elevation:2,
                                        color: Colors.grey[200],
                                        //          margin:EdgeInsets.only(right:5,left:190 ),
                                        // padding:EdgeInsets.all(10 ),

                                        child: Row(
                                          // crossAxisAlignment: CrossAxisAlignment.start,

                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    snap.data.cityModel.Name,
                                                    style: TextStyle(
                                                        color: Colors.indigo[300],
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontFamily:
                                                            'ShadowsIntoLight',
                                                        fontSize: 20),
                                                  ),

                                                  //    Text(' city',style:  TextStyle(color: Colors.indigo[300],
                                                  //      fontWeight:FontWeight.w800,fontFamily: 'ShadowsIntoLight',fontSize:20 ),),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
/***********************************************************************************************************/
                          
                          
                                SizedBox(
                                  height: 4,
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 5,
                                    ),



                                          Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                     
                     
                     
                     
                     
                                    Text(" In ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600)),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      // elevation:2,
                                      color: Colors.grey[200],
                                      //          margin:EdgeInsets.only(right:5,left:190 ),
                                      // padding:EdgeInsets.all(10 ),

                                      child: Row(
                                        // crossAxisAlignment: CrossAxisAlignment.start,

                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  snap.data.cityModel.Country,
                                                  style: TextStyle(
                                                      color: Colors.indigo[300],
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontFamily:
                                                          'ShadowsIntoLight',
                                                      fontSize: 20),
                                                ),

                                                //    Text(' city',style:  TextStyle(color: Colors.indigo[300],
                                                //      fontWeight:FontWeight.w800,fontFamily: 'ShadowsIntoLight',fontSize:20 ),),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                
                     
                     
                     
                     
                     
                                          Text(' In ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: '',
                                                fontWeight: FontWeight.w600,
                                              )),
                                          Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                            // elevation:2,
                                            color: Colors.grey[200],
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
                                             snap.data.reccommendedWeather ,
                                                         
                                                        style: TextStyle(
                                                            color: Colors.purple,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily: 'Oswald',
                                                            fontSize: 15),
                                                      ),

                                                      //    Text(' city',style:  TextStyle(color: Colors.indigo[300],
                                                      //      fontWeight:FontWeight.w800,fontFamily: 'ShadowsIntoLight',fontSize:20 ),),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),

snap.data.reccommendedWeather=="Summer"?
Icon(Icons.wb_sunny,color: Colors.yellow,):Container(),


],
                                      ),
                                    ),


                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Text('From',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600)),
                                          //Text(,style: TextStyle(color: Colors.blue)),
                                          Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                            // elevation:2,
                                            color: Colors.grey[200],
                                            //          margin:EdgeInsets.only(right:5,left:190 ),
                                            // padding:EdgeInsets.all(10 ),

                                            child: Row(
                                              // crossAxisAlignment: CrossAxisAlignment.start,

                                              children: <Widget>[
                                                Container(
                                                  padding: EdgeInsets.all(10),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                        snap.data.From.year
                                                                .toString() +
                                                            "-" +
                                                            snap.data.From.month
                                                                .toString() +
                                                            "-" +
                                                            snap.data.From.day
                                                                .toString(),
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily: 'Oswald',
                                                            fontSize: 15),
                                                      ),

                                                      //    Text(' city',style:  TextStyle(color: Colors.indigo[300],
                                                      //      fontWeight:FontWeight.w800,fontFamily: 'ShadowsIntoLight',fontSize:20 ),),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),

                                          Text(' To ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600)),
                                          Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                            // elevation:2,
                                            color: Colors.grey[200],
                                            //          margin:EdgeInsets.only(right:5,left:190 ),
                                            // padding:EdgeInsets.all(10 ),

                                            child: Row(
                                              // crossAxisAlignment: CrossAxisAlignment.start,

                                              children: <Widget>[
                                                Container(
                                                  padding: EdgeInsets.all(10),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                        snap.data.To.year
                                                                .toString() +
                                                            "-" +
                                                            snap.data.To.month
                                                                .toString() +
                                                            "-" +
                                                            snap.data.To.day
                                                                .toString(),

                                                        /*  snap.data.To.toString()*/
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily: 'Oswald',
                                                            fontSize: 15),
                                                      ),

                                                      //    Text(' city',style:  TextStyle(color: Colors.indigo[300],
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
                                      margin:EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text('Budget ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: '',
                                                fontWeight: FontWeight.w600,
                                              )),
                                          Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                            // elevation:2,
                                            color: Colors.grey[200],
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
                                                        snap.data.budget
                                                                .toString() +
                                                            '\$',
                                                        style: TextStyle(
                                                            color: Colors.purple,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily: 'Oswald',
                                                            fontSize: 20),
                                                      ),

                                                      //    Text(' city',style:  TextStyle(color: Colors.indigo[300],
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
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text( ' Marked '+snap.data.cityModel.Name+" as"
                                          ,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: '',
                                                fontWeight: FontWeight.w600,
                                              )),
                                          Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                            // elevation:2,
                                            color: Colors.grey[100],
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
                                                        snap.data.reccommendedType
                                                            ,
                                                        style: TextStyle(
                                                            color: Colors.purple[200],
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily: 'Oswald',
                                                            fontSize: 20),
                                                      ),

                                                      //    Text(' city',style:  TextStyle(color: Colors.indigo[300],
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
                                  height: 5,
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
       /*      Positioned(
              right: 10,
              left: 10,
              top:MediaQuery.of(context).size.width-44,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
              
                  snap.data.userId==Provider.of<FirebaseUser>(context,listen: false).uid? Container():Container(
                    child: SmoothStarRating(
                        allowHalfRating: true,
                        onRatingChanged: (val) async {
                          if (snap.data.currentUserRate == 0) {
                            await Firestore.instance
                                .collection("Experience")
                                .document(snap.data.Id)
                                .collection("Rates")
                                .add({
                              "userId": Provider.of<FirebaseUser>(context,listen: false)
                                  .uid
                                  .toString(),
                              "rate": val
                            });
                            setState(() {
                              snap.data.currentUserRate = val;
                            });
                          } else {
                            String rateID;
                            await Firestore.instance
                                .collection("Experience")
                                .document(snap.data.Id)
                                .collection("Rates").where("userId",
                                isEqualTo:Provider.of<FirebaseUser>(context,listen: false).uid)
                                .getDocuments()
                                .then((docs) {
                              rateID = docs.documents.first.documentID;
                            });

                            if (val == snap.data.currentUserRate) {
                              await Firestore.instance
                                  .collection("Experience")
                                  .document(snap.data.Id).collection("Rates")
                                  .document(rateID)
                                  .delete();

                              setState(() {
                                snap.data.currentUserRate = 0;
                              });
                            } else {
                              await Firestore.instance
                                  .collection("Experience")
                                  .document(snap.data.Id).collection("Rates")
                                  .document(rateID)
                                  .updateData({"rate": val});

                                      setState(() {
                                snap.data.currentUserRate = val;
                              });
                            }
                          }
                        },
                        starCount: 5,
                        rating: snap.data.currentUserRate,
                        size: 30.0,
                        color: Colors.amber,
                        borderColor: Colors.indigo[300],
                        spacing: 0.0),
                  )
                ],
              ),
            ), */
          ],
        ),
    
    
  /*   Text("Comments ",textAlign: TextAlign.end,style: TextStyle(fontSize: 15,
    color: Colors.teal,fontFamily: "Oswald"),),
     */  SizedBox(
          height: 600,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10,0,10,10),
            child: ExpComments(ExpId:snap.data.Id),
          ),
        ),
          
    
      ],
    );
  }







}


