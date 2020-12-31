import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:traveliano/adminScreens/dialog.dart';
import 'package:traveliano/adminScreens/experience/editExperience.dart';
import 'package:traveliano/models/city.dart';
import 'package:traveliano/models/experience.dart';
import 'package:traveliano/services/admin.dart';
import 'package:traveliano/services/user.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../globals.dart';

class myExperince extends StatefulWidget {
  @override
   myExperinceState createState() =>  myExperinceState();
}

class  myExperinceState extends State <myExperince> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 //appBar: AppBar(title: Text("My Experince"),),

          body: StreamBuilder(

stream: Firestore.instance.collection("Experience")
.where("userid",isEqualTo: Provider.of<FirebaseUser>(context,listen: false).uid)
.snapshots(),

builder:(context,snap){
  
  if(!snap.hasData) 
return    Stack(
                 children: <Widget>[



Container(height: 80,width: 80,
    
    margin: EdgeInsets.only(top:20,left: 20),
    
    decoration: BoxDecoration(
    
    color: Colors.grey[100],
    
    borderRadius: BorderRadius.circular(80)
    
    
    
    ),
    
      
    
    )

                   ,

Container(
  height: 6,width: MediaQuery.of(context).size.width/2,color: Colors.grey[100]
,margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/3, MediaQuery.of(context).size.height/12, 0, 0),

),Container(
  height: 6,width: MediaQuery.of(context).size.width/3,color: Colors.grey[100]
,margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/3, MediaQuery.of(context).size.height/8, 0, 0),

),

Container(
  height: 5,width: MediaQuery.of(context).size.width/1.15,color: Colors.grey[100]
,margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/12, MediaQuery.of(context).size.height/3, 0, 0),

),

Container(
  height: 5,width: MediaQuery.of(context).size.width/1.2,color: Colors.grey[100]
,margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10, MediaQuery.of(context).size.height/2.5, 0, 0),

),

Container(
  height: 5,width: MediaQuery.of(context).size.width/1.3,color: Colors.grey[100]
,margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/8, MediaQuery.of(context).size.height/2.1, 0, 0),

),







                   Shimmer.fromColors(
direction: ShimmerDirection.ltr,
                     baseColor: Colors.white10,
                     highlightColor: Colors.black12,
                                    child:Container(

                                   
                             
                                    margin: EdgeInsets.all(5),
height: 400,

decoration: BoxDecoration(
color: Colors.grey,
borderRadius: BorderRadius.circular(20)

),

                                    )
                   ),
                 ],
               ); 

 if(snap.data.documents.length==0) return Container(
    color:Colors.white,
    child: Center(child:Text("Your Experience will appear here \n once it is added",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: Colors.grey),)));

return ListView.builder(
itemBuilder: (BuildContext context, int index){
       // List rev = snap.data.documents.reversed.toList();

Experience ex;
ex=admin_ser().convertSnapToExperince(snap.data.documents[index]);

return ExCi(ex);
},
itemCount: snap.data.documents.length,
);} ,        )
    );
}}


 class ExCi extends StatefulWidget {
   Experience _experience;
ExCi(Experience experience){
this._experience=experience;
  }
  @override
  _ExCiState createState() => _ExCiState(this._experience);
}
class _ExCiState extends State<ExCi> {
  Experience _experience;
  _ExCiState(Experience experience){
this._experience=experience;
  }
  Future<Experience> _load() async {
    await _experience.loadUser();
    await _experience.loadCity();
    return _experience;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _load(),
      builder: (context,AsyncSnapshot<Experience> snap){

        if(!snap.hasData)return 
        
        Stack(
              children: <Widget>[



Container(height: 80,width: 80,
    
    margin: EdgeInsets.only(top:20,left: 20),
    
    decoration: BoxDecoration(
    
    color: Colors.grey[100],
    
    borderRadius: BorderRadius.circular(80)
    
    
    
    ),
    
      
    
    )

                ,

Container(
  height: 6,width: MediaQuery.of(context).size.width/2,color: Colors.grey[100]
,margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/3, MediaQuery.of(context).size.height/12, 0, 0),

),Container(
  height: 6,width: MediaQuery.of(context).size.width/3,color: Colors.grey[100]
,margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/3, MediaQuery.of(context).size.height/8, 0, 0),

),

Container(
  height: 5,width: MediaQuery.of(context).size.width/1.15,color: Colors.grey[100]
,margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/12, MediaQuery.of(context).size.height/3, 0, 0),

),

Container(
  height: 5,width: MediaQuery.of(context).size.width/1.2,color: Colors.grey[100]
,margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10, MediaQuery.of(context).size.height/2.5, 0, 0),

),

Container(
  height: 5,width: MediaQuery.of(context).size.width/1.3,color: Colors.grey[100]
,margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/8, MediaQuery.of(context).size.height/2.1, 0, 0),

),







                Shimmer.fromColors(
direction: ShimmerDirection.ltr,
                  baseColor: Colors.white10,
                  highlightColor: Colors.black12,
                                 child:Container(

                                
                          
                                 margin: EdgeInsets.all(5),
height: 400,

decoration: BoxDecoration(
color: Colors.grey,
borderRadius: BorderRadius.circular(20)

),

                                 )
                ),
              ],
            ); 
///print(snap.data.cityModel.Name+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@21");
return //Text(snap.data.description);

 ExWidget(snap);



      }
      
      
      
      
      
      
      
      
      );
  }







Widget ExWidget(AsyncSnapshot<Experience> snap){



    return Stack(
    //  overflow: Overflow.clip,
      children: <Widget>[
        Container(color: Colors.white,
          height: MediaQuery.of(context).size.height/1.5,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(
                      30.0),
            ),
            elevation: 3,
              color: Colors.grey[50],
            margin: EdgeInsets.only(
                bottom: 5,
                right: 10,
                left: 10,
                top: 3),
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
                                    image:       snap.data.userModel.Photo!=null?
                                     NetworkImage(snap.data.userModel.Photo)
                                      : AssetImage("images/defaultuser.png"),
                                    
                                    fit: BoxFit
                                        .cover),
                                shape: BoxShape
                                    .circle),
                          ),
                          Container(
                            padding: EdgeInsets
                                .only(
                                    top:
                                        10),
                            margin: EdgeInsets
                                .only(
                                    left:
                                        11),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                              children: <
                                  Widget>[
                                Container(
                                  child:
                                      Row(
                                    children: <
                                        Widget>[
                                      Text(
                                             snap.data.userModel.firstName,
                                          style: TextStyle(color: Colors.teal, fontSize: 17, fontFamily: 'Bitter', fontWeight: FontWeight.w600)),
                                      Text(
                                          " "),
                                      Text(
                                             snap.data.userModel.lastName,
                                          style: TextStyle(color: Colors.teal, fontSize: 17, fontFamily: 'Bitter', fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: <
                                      Widget>[
                                    Text(
                                            snap.data.userModel.hometown,
                                        style:
                                            TextStyle(color: Colors.grey)),
                                  ],
                                ),
                             Text(//"Time Stamp"
                                 //   snap.data.ExDate.,
                       
        timeago.format(snap.data.ExDate),textAlign: TextAlign.start,
                                  //   textAlign:TextAlign.end,   
                                       style:
                                     TextStyle(color: Colors.grey[300])),
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
                        padding:
                            EdgeInsets.only(
                                top: 16,
                                bottom: 16),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: <
                              Widget>[
                            /***********************************************************************************************************/

                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                              children: <
                                  Widget>[
                                Text(
                                    "Traveled To ",
                                    style: TextStyle(
                                        fontWeight:
                                            FontWeight.w600)),
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
                                              snap.data.cityModel.Name
                                              
                                              ,
                                              style: TextStyle(color: Colors.teal, fontWeight: FontWeight.w800, fontFamily: 'ShadowsIntoLight', fontSize: 20),
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
/***********************************************************************************************************/
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: <
                                  Widget>[
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  child:
                                      Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: <
                                        Widget>[
                                      Text(
                                          'From',
                                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
                                      //Text(,style: TextStyle(color: Colors.blue)),
                                      Card(
                                        shape:
                                            RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                        ),
                                        // elevation:2,
                                        color:
                                            Colors.grey[200],
                                        //          margin:EdgeInsets.only(right:5,left:190 ),
                                        // padding:EdgeInsets.all(10 ),

                                        child:
                                            Row(
                                          // crossAxisAlignment: CrossAxisAlignment.start,

                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                     snap.data.From.year.toString()+"-"+snap.data.From.month.toString()+"-"+snap.data.From.day.toString(),
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

                                      Text(
                                          ' To ',
                                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
                                      Card(
                                        shape:
                                            RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                        ),
                                        // elevation:2,
                                        color:
                                            Colors.grey[200],
                                        //          margin:EdgeInsets.only(right:5,left:190 ),
                                        // padding:EdgeInsets.all(10 ),

                                        child:
                                            Row(
                                          // crossAxisAlignment: CrossAxisAlignment.start,

                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(

              snap.data.To.year.toString()+"-"+snap.data.To.month.toString()+"-"+snap.data.To.day.toString(),
                                                
                                                  /*  snap.data.To.toString()*/
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
                                  child:
                                      Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: <
                                        Widget>[
                                      Text(
                                          'Budget ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: '',
                                            fontWeight: FontWeight.w600,
                                          )),
                                      Card(
                                        shape:
                                            RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                        ),
                                        // elevation:2,
                                        color:
                                            Colors.grey[200],
                                        //          margin:EdgeInsets.only(right:5,left:190 ),
                                        // padding:EdgeInsets.all(10 ),

                                        child:
                                            Row(
                                          // crossAxisAlignment: CrossAxisAlignment.start,

                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: Row(
                                                //    mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                  snap.data.budget.toString() + '\$',
                                                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500, fontFamily: 'Chewy', fontSize: 20),
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
                 /*            SizedBox(
                              height: 10,
                            ),
                            Container(
                              color: Colors
                                  .white,
                              padding: EdgeInsets
                                  .only(
                                      left:
                                          10),
                              child:
                                  Container(
                                //  elevation: 0.0,
                                height: 110,
                                child:
                                    SingleChildScrollView(
                                  child: Text(
                                      snap.data.description
                                          .toString(),
                                      style: TextStyle(
                                          height: 1.5,
                                          fontSize: 15,
                                          color: Colors.black54,
                                          fontFamily: '')),
                                ),
                              ),
                            ), */
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
            //        Divider(height: 0,thickness: 2,),
        Positioned(
          right: 10,
          left: 10,
          top: MediaQuery.of(context).size.height/2,
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment
                    .spaceAround,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(
                      top: 15),
                  child:
                  FloatingActionButton(
                            heroTag: DateTime.now(),
                            backgroundColor: Colors.amber,
                            child: Icon(Icons.expand_less,size:40,),
                            onPressed: () async{

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


                             
/* 
Navigator.push(context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation)=> ExpComments(ExpId:_experience.Id),
   transitionDuration: Duration(milliseconds: 2000),
   transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          
          return SlideTransition(

            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
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
              
                ); */










                              //                print(snapshot2.data.documents[index].documentID+"           ######### User id");
                              //                   print(snapshot3.data.documents[index].documentID+"           ######### City id");
                            },
                          )
                  ), 
                  
                
            /*     
                     Container(
                  padding: EdgeInsets.only(
                      top: 15),
                  child:
                      FloatingActionButton(
                        backgroundColor: Colors.orange
                   , heroTag: DateTime.now().toString(),
                    child:Icon(FontAwesomeIcons.chartBar),
                    onPressed: () {
           
           
           
           
           
           
                             Navigator.push(context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation)=> editExp(exp: snap.data),
   transitionDuration: Duration(milliseconds: 1000),
   transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      
      return SlideTransition(

        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
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
                  )), */
                     Container(
                  padding: EdgeInsets.only(
                      top: 15),
                  child:
                      FloatingActionButton(
                        backgroundColor: Colors.green,
                    heroTag: DateTime.now().toString(),
                    child:Icon(Icons.edit),
                    onPressed: () {
           
           
           
           
           
           
                             Navigator.push(context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation)=> editExp(exp: snap.data),
   transitionDuration: Duration(milliseconds: 1000),
   transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      
      return SlideTransition(

        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
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
                  )),
                     Container(
                  padding: EdgeInsets.only(
                      top: 15),
                  child:
                      FloatingActionButton(
                        backgroundColor: Colors.red,
                    heroTag: DateTime.now().toString(),
                    child:Icon(Icons.delete),
                    onPressed: () {
                   Dialogs.yesAbortDialog(
                              context, snap.data.Id, "Experience");
                      //                print(snapshot2.data.documents[index].documentID+"           ######### User id");
                      //                   print(snapshot3.data.documents[index].documentID+"           ######### City id");
                    },
                  )),
             
            ],
          ),
        ),
      ],
    );
                      


}




}





