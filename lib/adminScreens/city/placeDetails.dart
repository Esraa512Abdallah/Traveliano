
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:traveliano/adminScreens/locationpreview.dart';
import 'package:traveliano/adminScreens/rates.dart';
import 'package:traveliano/animation/fadeAnimmation.dart';
import 'package:traveliano/imagePreview.dart';
import 'package:traveliano/load.dart';
import 'package:traveliano/models/city.dart';
import 'package:traveliano/adminScreens/locationpreview.dart' as loca;
import 'package:traveliano/services/admin.dart';

import '../../globals.dart';
//import 'package:flutter_travel_ui/models/activity_model.dart';
//import 'package:flutter_travel_ui/models/destination_model.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class placeDetails extends StatefulWidget {
 DocumentSnapshot placeSnap;
String Collection;
String barName;
var users;

  placeDetails({this.placeSnap,this.Collection,this.barName,this.users});

  @override
  _placeDetailsState createState() => _placeDetailsState();
}

class _placeDetailsState extends State<placeDetails> {










  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

 
List<String> serviceslist =new List<String>();
@override
   initState()  {
    // TODO: implement initState
    super.initState();
       
if(widget.Collection=="accommodation"){
 
for (MapEntry entry in widget.placeSnap.data["services"].entries) {
  if(entry.value==true){

serviceslist.add(entry.key.toString());


  }

} }

 


  }



  bool ismap=false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(

     /* appBar: AppBar(
        
          elevation: 0,
backgroundColor: Colors.white,
title: Text("Top "+widget.barName,
    
    style:TextStyle(color:Colors.black,
    
    fontSize: 20,
    
    fontWeight: FontWeight.w800)),


        ), */ 

      body:    


 SafeArea(
    child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(25.0, 200.0, 10.0, 1.0),
                  height:MediaQuery.of(context).size.height/1.65,
                  width: double.infinity,
                  decoration: BoxDecoration(
               /*      image:DecorationImage(image: 
                    
                    NetworkImage(   snap.data.documents[index]["photo"])
                    ,
                    fit: BoxFit.cover
                    ), */

boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 1.0,spreadRadius: 3.0)],

                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 45.0, 10.0, 5.0),
                    child: SingleChildScrollView(
                                          child: Column(
                         mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[








                    /*       Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 200.0,color: Colors.teal,
                              //  color: Colors.black26,
                                child: InkWell(

                                  onTap: (){

//Navigate to page 

                                  },
                                                              child: Text("  "+
                                    widget.placeSnap.data["Name"],
                                    style: TextStyle(
                                      fontSize: 20.0,
                                     fontFamily: "Oswald"
                                    ,color: Colors.amber,
                                     // fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),

                             
                              ),   
                              
                              InkWell(
                                            child: SvgPicture.asset(
                                              'images/map.svg',
                                              height: 35,
                                            ),
                                            onTap: () {
                                          bottomSheet(context,Container(
                                            height: MediaQuery.of(context).size.height/1.5,
                                            
                                            child: MyApp(widget.placeSnap.data["longitude"],widget.placeSnap.data["longitude"])));
                                            },
                                          ),
                 
                       /////////
                            ],
                          ), */

//Text(snap.data.documents[index]["country"]),




/* 
 Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.Collection!="tourismPlaces"?Row(
                  mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[



Text(   widget.placeSnap.data["minPrice"].toString()+"\$",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),)
,
Text("-")
,


Text(   widget.placeSnap.data["maxPrice"].toString()+"\$",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),)










],



                ):Row(

children: <Widget>[
Text("Avg Cost :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),)
,
Text( widget.placeSnap.data["Cost"].toString()+"\$",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w300),)
,
    
],

                ),
              ),

 */

Row(

  children: <Widget>[

     Container(

                                      height: 110,width: 103,color: Colors.white            ,

                                                               child: Column(

                                                                 mainAxisAlignment: MainAxisAlignment.end,

                                                children: <Widget>[

          







                                                  Center(

                                                    child: Text(   widget.placeSnap.data['rate']

                                                        .toString()

                                                        ,style: TextStyle(

                                                          fontSize: 66,

                                                          fontWeight: FontWeight.w200,color:Colors.black),

                                                        

                                                        textAlign: TextAlign.center,

                                                        

                                                        ),

                                                  ),





SmoothStarRating(

color: Colors.amber,

allowHalfRating: true,

rating:  widget.placeSnap.data['rate'],

size: 20,











)









,



                                                ],

                                              ),

                                    ),

        Container(

    color: Colors.white,

      height: MediaQuery.of(context).size.width/2.1,

    

      width: 200,

    

      child: Rates(users:widget.users)),

  ],

),








 



     ConstrainedBox(
                           constraints: new BoxConstraints(
                            minHeight: 10.0,
                            minWidth:MediaQuery.of(context).size.width/1.2,
                            maxHeight: MediaQuery.of(context).size.width/4.2,
                            maxWidth: MediaQuery.of(context).size.width/1.2,
                          ),
                            child: widget.Collection=="accommodation"?
                            Container(
                            
                              //width: MediaQuery.of(context).size.width/1.2,
                              color: Colors.white,
                             // padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
//color: Colors.teal,
                             // height: MediaQuery.of(context).size.height/4.6,
                              child: serviceslist.length!=0 ?GridView.builder(
                                
                                itemCount: serviceslist.length,
                                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            childAspectRatio: 2,


                                             crossAxisSpacing: 0.0,
                                            mainAxisSpacing: 2.0, 
                                          )
                              
                              
                              , itemBuilder: (BuildContext context,index){

return Container(
                            
                            decoration: BoxDecoration
                            
                            
                            (
                              
                              
                              borderRadius: BorderRadius.circular(50),color: Colors.red[300]),


                            child:   Center(child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[

                                ClipOval(child: Container(color:Colors.white,height: 12,width: 12,)),
                                Container(width:50,
                                  child: Text(serviceslist[index].toString() ,maxLines: 2  ,
                                   textAlign: TextAlign.center,style: TextStyle(fontSize: 8
                                   ,color: Colors.white,fontWeight: FontWeight.w400 /* ,backgroundColor: Colors.red */),
                                   ),
                                ),
                              ],
                            )),
);

                              }):Center(child: Text("No Services have been added ,once it's added it will appear here"
                              ,textAlign: TextAlign.center,
                              ),
                              
                              
                              )
                            )
                             
                            : widget.Collection=="tourismPlaces"?Card(elevation: 0,
child: ListView(children: <Widget>[
Text(
widget.placeSnap.data["Description"].toString(),
textAlign: TextAlign.center,
)

],),

                            
                            ):
     
                            Container(height: 100,
child:
Row(
  mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
        Text("Food Type:",style: TextStyle(fontSize: 15),), 
        Text(widget.placeSnap.data["foodType"].toString(),style: TextStyle(fontWeight: FontWeight.w300,fontSize: 25),),
  ],
),

                            )
                          ),







Divider(height: 10,indent: 10,thickness: 2,),
 Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.Collection=="accommodation"?Row(
                  mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[



Text(   widget.placeSnap.data["minPrice"].toString()+"\$",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),)
,
Text("-")
,
Text(   widget.placeSnap.data["maxPrice"].toString()+"\$",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),)










],



                ):Row(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
Text("Avg Cost :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),)
,
Text( widget.placeSnap.data["Cost"].toString()+"\$",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w300),)
,
    
],

                ),
              ),

/*
                     
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
                child: widget.Collection!="tourismPlaces"?Row(
                  mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[



Text(   widget.placeSnap.data["minPrice"].toString()+"\$",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),)
,
Text("-")
,


Text(   widget.placeSnap.data["maxPrice"].toString()+"\$",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),)










],



                ):Row(

children: <Widget>[
Text("Avg Cost :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),)
,
Text( widget.placeSnap.data["Cost"].toString()+"\$",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w300),)
,
    
],

                ),
              ),


     ConstrainedBox(
                           constraints: new BoxConstraints(
                            minHeight: 50.0,
                            minWidth: 100.0,
                            maxHeight: 130.0,
                            maxWidth: 300.0,
                          ),
                            child: Card(
                              
                              //width: MediaQuery.of(context).size.width/1.2,
//color: Colors.teal,




                             // padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
//color: Colors.teal,
                             // height: MediaQuery.of(context).size.height/4.6,
                              child: GridView.builder(
                                
                                itemCount: serviceslist.length,
                                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            childAspectRatio: 2,


                                             crossAxisSpacing: 0.0,
                                            mainAxisSpacing: 2.0, 
                                          )
                              
                              
                              , itemBuilder: (BuildContext context,index){

return Container(
                            
                            decoration: BoxDecoration
                            
                            
                            (
                              
                              
                              borderRadius: BorderRadius.circular(50),color: Colors.red[300]),


                            child:   Center(child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[

                                ClipOval(child: Container(color:Colors.white,height: 12,width: 12,)),
                                Container(width:60,
                                  child: Text(serviceslist[index].toString() ,maxLines: 2  ,
                                   textAlign: TextAlign.center,style: TextStyle(fontSize: 9
                                   ,color: Colors.white,fontWeight: FontWeight.w300 /* ,backgroundColor: Colors.red */),
                                   ),
                                ),
                              ],
                            )),
);

                              }),
                            ),
                          ),




 






 */


                        ],
                      ),
                    ),
                  ),
                ),

                
                
                Positioned(
                  height:MediaQuery.of(context).size.width/1.5,
                  width: (MediaQuery.of(context).size.width-40),
                  left: 10.0,
                  top: 15.0,
                //  bottom: 15.0,
                  child:FadeAnimation(
                                    1, InkWell(

                                      onTap: (){


   Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context){
        return imagePreview(imageUrl: widget.placeSnap.data["photo"].toString() ,); }));

                                      },
                                                                          child: Container(
                                        
                                        child: Column(
mainAxisAlignment: MainAxisAlignment.end,
children: <Widget>[



        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: (MediaQuery.of(context).size.width-100),//color: Colors.teal,
                                //  color: Colors.black26,
                                  child: InkWell(

                                      onTap: (){

//Navigate to page 

                                      },
                                                                  child: Text("  "+
                                        widget.placeSnap.data["Name"],
                                        style: TextStyle(
                                          fontSize: 25.0,
                                         fontFamily: "Oswald"
                                        ,color: Colors.amber,
                                         // fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                  ),

                               
                                ),   
                                
                                InkWell(
                                                child: SvgPicture.asset(
                                                  'images/map.svg',
                                                  height: 35,
                                                ),
                                                onTap: () {
                                              bottomSheet(context,Container(
                                                height: MediaQuery.of(context).size.height/1.5,
                                                
                                                child: MyApp(widget.placeSnap.data["latitude"],widget.placeSnap.data["longitude"])));
                                                },
                                              ),
                   
                         /////////
                              ],
                            ),
        ),
],

                                        ),

width: 150,
   ////height: 100,
decoration: BoxDecoration(
color: Colors.black12,
borderRadius: BorderRadius.circular(20),
image: DecorationImage(image: 
                                 widget.placeSnap.data["photo"]==null?
                               AssetImage("images/k.jpg"):
                          NetworkImage(
                                   widget.placeSnap.data["photo"],
                               ),
                            fit: BoxFit.cover,
colorFilter: ColorFilter.mode(Colors.black26,BlendMode.screen)
)

),



                    ),
                                    ),
                  )
          
          
          
          
          
          
          
          
          
          
          
          
                ),
          
          
          
          
          
          
          
          
          
          
          
         
          
          
          
          
          
              ],
            ),
 ),



     
    );
  }
}