
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counter_animation/counter_animation.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import "dart:io";

import 'package:provider/provider.dart';
import 'package:traveliano/HOMEPAGE/EshomePage_rate.dart' as hm;
import 'package:traveliano/abdalahSwap/Hotels.dart';
import 'package:traveliano/abdalahSwap/Restourants.dart';
import 'package:traveliano/abdalahSwap/Swap.dart';
import 'package:traveliano/adminScreens/restuarant/allRestaurant.dart';
import 'package:traveliano/adminScreens/tourismplace/allTourismPlaces.dart';
import 'package:traveliano/models/experience.dart';
import 'package:traveliano/models/notification.dart';
import 'package:traveliano/models/user.dart';
//import 'package:traveliano/home.dart';
import 'package:traveliano/services/user.dart';
import 'package:traveliano/userScreens/Experince.dart';
import 'package:traveliano/userScreens/myExperince.dart';

import '../globals.dart';
import '../home.dart';



class strangeProfile extends StatefulWidget {
User selectedUser=new User();
int followers,following,trips;
strangeProfile({this.selectedUser,this.followers,this.following,this.trips});
  @override

 State<StatefulWidget> createState() {
    // TODO: implement createState
    return strangeProfileState();
  }
}
class strangeProfileState extends State<strangeProfile> {




 User _user=new User();

  
  List<Widget> pages=[myExperince(),Restourants(),Hotels()];
int position=0;
  File _image ;
ScrollController _sc=ScrollController(initialScrollOffset: 0);
bool _isVisible=true;
int followers=0;
int following =0;
int trips=0;


@override
void initState() {
    // TODO: implement initState
    super.initState();
this._user=widget.selectedUser;
followers=widget.followers;
following =widget.following;
trips=widget.trips;
//this.dispose();

  }
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:  
       Container(
          //var usersMap = snapshot2.data.documents.asMap();

              //painter:LogoPainter( ),
//height: 300,
             child:ListView(





               children: <Widget>[
              
              
              
                 AnimatedContainer(
                   color: Colors.white,
                   duration: Duration(seconds:1),
                                                      height:MediaQuery.of(context).size.width/1.3,
                   child: CustomPaint(
                //     size: Size.fromHeight(250),
                     painter:LogoPainter( ),

                     child: Column (
                       children: <Widget>[
                         Container(
                           padding: EdgeInsets.only(top:30.0,left:10),
                           child:Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: <Widget>[
                               Container(
                                 child: Stack(
                                   children: <Widget>[
                         

                                

                         
                                     Container(




                                       child: CircleAvatar(
                                         radius: 40,
                                         backgroundColor: Color(0xff476cfb),
                                         child: ClipOval(
                                           child: new SizedBox(
                                             width: 80.0,
                                             height: 80.0,
                                             child: (_image!=null)?Image.file(
                                               _image,
                                               fit: BoxFit.cover,
                                             ):Image.network(
                                            _user.Photo,
                                               fit: BoxFit.cover,
                                             ),
                                           ),
                                         ),
                                       ),

                                     ),


                                   ],
                                 ),

                               ),


                               Container(

                                 child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                   children: <Widget>[
                                     Container(
                                       padding:EdgeInsets.only(left:9),
                                       child: Row(
                                         //mainAxisAlignment: MainAxisAlignment.center,
                                         children: <Widget>[


                                           Text(_user.firstName,
                                               style: TextStyle(
                                                   color:
                                                   Colors.white
                                                 ,//  ,fontWeight: FontWeight.w900,
                                                  fontFamily: "Merienda",
fontSize: 15
                                                   )
                                           ),
                                           Text(' ',
                                               style: TextStyle(
                                                   color:
                                                   Colors.white)
                                           ),
                                           Text(_user.lastName,
                                               style: TextStyle(
                                                   color:
                                                   Colors.white
                                                   ,
                                                   fontFamily: "Merienda",fontSize: 15,
                                                   )
                                           ),

                                         ],
                                       ),
                                     ),

                                     Row(
                                       // mainAxisAlignment: MainAxisAlignment.start,
                                       children: <Widget>[
                                         Icon(
                                           Icons.location_on,
                                           color: Colors
                                               .white54,
                                         ),

                                         Text(_user.hometown,
                                             style: TextStyle(
                                                 color:
                                                 Colors.white
                                                 ,
                                                 fontWeight: FontWeight.w100
                                                 
                                                 
                                                 )
                                         ),




                                       ],
                                     ),


                                   ],

                                 ),
                               ),
                         
                             ],
                           ),
                         ),



                               RotationTransition(

                              turns: new AlwaysStoppedAnimation(0 / 360),   
                               child:      Container(
                                 alignment: Alignment.centerRight,
                                 //color: Colors.blueAccent,
                                margin: EdgeInsets.only(bottom: 0,right: 50),
                                //color: Colors.teal,
                                   //   padding: EdgeInsets.only(right:30),
                                   child:RaisedButton(
                                     onPressed: ()
                                     async {

if(_user.follow==false){




await Firestore.instance.collection("Users")
.document(Provider.of<FirebaseUser>(context,listen: false).uid,)
.collection("Following")
.document(_user.Id)
.setData({

  "timestamp":DateTime.now()
});
 await Firestore.instance.collection("Users")
.document(_user.Id)
.collection("Followers")
.document(Provider.of<FirebaseUser>(context,listen: false).uid)
.setData({

  "timestamp":DateTime.now()
});


 setState(() {
  _user.follow==true;
});
/*
Notify noti;
noti.title=_user.firstName+" started following you";
noti.body="now he will be notified about your Experience";

Firestore.instance.collection("Notifications").add({
"title":noti.title,
"body":noti.body,
"userId":_user.Id

}); */



}else{


await Firestore.instance.collection("Users")
.document(Provider.of<FirebaseUser>(context,listen:false).uid)
.collection("Following")
.document(_user.Id).delete();

 await Firestore.instance.collection("Users")
.document(_user.Id)
.collection("Followers")
.document(Provider.of<FirebaseUser>(context,listen:false).uid)
.delete();


setState(() {
  _user.follow==false;
});

}







                                       
                                     },
                                     
                                     child: 
                             _user.follow?   
                             
                             
                                Text('Following',style: TextStyle(color: Colors.red),)
                                :

                                Text('Follow',style: TextStyle(color: Colors.blue),),
                                   
                                   color: Colors.white,


                    shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(10.0),

                        side: BorderSide(color: Colors.red,width: 0.5)

                    ),
                                   
                                   ),
                                 ) 
                                 
                                 
                                 ),

                         Container(
                           padding: EdgeInsets.only(top:5,left: 5),
                           child:
                           
    
                           
                          RotationTransition(
                              turns: new AlwaysStoppedAnimation(0/ 360),
                                                        child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: <Widget>[
                                               Container(
                                   // padding: EdgeInsets.only(left:10),
                                   child:Column(
                                     children: <Widget>[
                                       CounterAnimation(
    begin: 0,
    end: following==null?0:following,
    duration: 5,
    curve: Curves.easeIn,
  textStyle: TextStyle(color: Colors.purple[100],fontSize: 20,fontWeight: FontWeight.w200)
),
                            //   Text('123',style: TextStyle(color: Colors.purple[100],fontSize: 20,fontWeight: FontWeight.w200),),
                           Text('Following',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                             
                                     ],
                                   ),
                                 ),
                                 Container(
                                   // padding: EdgeInsets.only(left:10),
                                   child:Column(
                                     children: <Widget>[
                                     CounterAnimation(
    begin: 0,
    end: trips==null?0:trips,
    duration: 4,
    curve: Curves.easeIn,
  textStyle: TextStyle(color: Colors.purple[100],fontSize: 20,fontWeight: FontWeight.w200)
), Text('Trips',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                                     ],
                                   ),
                                 ),
                                 Container(
                                   //  padding: EdgeInsets.only(left:10),
                                   child:Column(
                                     children: <Widget>[
                                         CounterAnimation(
    begin: 0,
    end: followers==null?0:followers,
    duration: 5,
    curve: Curves.easeIn,
  textStyle: TextStyle(color: Colors.purple[100],fontSize: 20,fontWeight: FontWeight.w200)
),Text('Followers',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                                     ],
                                   ),
                                 ),


                   
                               ],
                             ),
                           ),


                         ),

                       ],
                     ),
                   ),
                 ),






            

               
             
               
                 Container(
height:MediaQuery.of(context).size.height/1.5,
                
                
             //      child:hm.homePage(),
               child: Experinces(specificId:_user.Id,)
               
              
                
                
                
                
                 ),


               ],
          ),

          ));
       
     
          }

    




    




}




class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint();
    paint.color = Colors.red[300];
    
    //paint.blendMode=BlendMode.luminosity;
    var path = Path();


    path.lineTo(0, size.height*0.78);
    path.lineTo(size.width / 1.25, size.height*0.98);

    // path.relativeQuadraticBezierTo(15,3, 23, -5);
    path.relativeQuadraticBezierTo(10, 2, 22, -4);

    path.lineTo(size.width, size.height*0.78);
    path.lineTo(size.width, 0);

    path.close();
    canvas.drawPath(path, paint);
  }

   bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}





