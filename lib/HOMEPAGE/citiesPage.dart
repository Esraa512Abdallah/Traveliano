import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:steps_indicator/steps_indicator.dart';
import 'package:traveliano/adminScreens/city/Destination.dart';
import 'package:traveliano/adminScreens/city/cityDetails.dart';
//import 'package:firebase_connect/homepages/searchServices.dart';
import 'package:traveliano/adminScreens/locationpreview.dart' as location;
import 'package:traveliano/adminScreens/locationpreview.dart';
import 'package:traveliano/adminScreens/rates.dart';
import 'package:traveliano/animation/fadeAnimmation.dart';
import 'package:traveliano/globals.dart';
import 'dart:core';

import 'package:traveliano/load.dart';
import 'package:traveliano/models/city.dart';
import 'package:traveliano/services/admin.dart';

class citiesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return citiesPageState();
  }
}

class citiesPageState extends State<citiesPage> {
  bool enableMap = false;

var radio=0;
var radio2=0;
bool suggest=false;
City new_city=new City();
int selector=1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  
        return enableMap
            ? location.MyApp(20, 40)
            : Scaffold(
    backgroundColor: Colors.white,
    
            appBar: AppBar(
              actions: <Widget>[Padding(
                padding: const EdgeInsets.all(10.0),
                child:RaisedButton(
             shape: RoundedRectangleBorder(

borderRadius: BorderRadius.circular(120)

             ),
             colorBrightness: Brightness.dark,
                  onPressed: (){
    
    setState(() {
      suggest=!suggest;
    });
    
    
                  },
                  child: suggest==false?Text("Suggest",style: TextStyle( fontFamily: "Baloo",
                  fontSize:15,color: Colors.white,fontWeight: FontWeight.w200),):Text("❌ Close",style: TextStyle( fontFamily: "Baloo",
                  fontSize:15,color: Colors.white70,fontWeight: FontWeight.w200),),
                  color: Colors.blueAccent,
        
        
                  )
              )],
              elevation:suggest==false? 0.3:2,
    backgroundColor: Colors.white,
    title: suggest==false?Text("Destinations",
    
        
    
        style:TextStyle(color:Colors.black,
    
        
    
        fontSize: 20,
    
        
    
        fontWeight: FontWeight.w800)
        ):Text("Suggestion",
    
        
    
        style:TextStyle(color:Colors.black,
    
        
    
        fontSize: 20,
    
        
    
        fontWeight: FontWeight.w800)
        )
    
    
            ),
                body: suggest==false?
       StreamBuilder(
                  stream: Firestore.instance.collection('Cities').snapshots(),
                  builder: (BuildContext build, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) return Stack(
                 children: <Widget>[




                   







                   Shimmer.fromColors(
direction: ShimmerDirection.ltr,
                     baseColor: Colors.white24,
                     highlightColor: Colors.black12,
                                    child:Container(

                                   
                             
                                    margin: EdgeInsets.all(5),
height: MediaQuery.of(context).size.width/1.3,

decoration: BoxDecoration(
color: Colors.grey,
borderRadius: BorderRadius.circular(20)

),

                                    )
                   ),
                 ],
               ); 



                       if(snapshot.data.documents.length==0) return Container(
    color:Colors.white,
    child: Center(child:Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Icon(Icons.mood_bad,size: 300,color: Colors.grey[200],),
        Text("Oops, there aren't any city to display ",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: Colors.grey),),
      ],
    )));

    
                    return ListView.builder(
                      //controller: _hideButtonController,
                 
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return 
                        
                        Container(height: MediaQuery.of(context).size.height/2.1,
                          child: FadeAnimation(
                            1,
                                                 FlipCard(
    //flipOnTouch: false,
    
                              direction: FlipDirection.VERTICAL
    ,
                              back: Container(
                                margin: EdgeInsets.only(
                                    top: 25, bottom: 10, left: 10, right: 10),
    
                                width: MediaQuery.of(context).size.width - 20,
    
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.cyan[300],
                                        blurRadius: 10.0,
                                      )
                                    ],
                                    color: Colors.indigo[200],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                // height:MediaQuery.of(context).size.height/1.3,
                                //  height: 300,
    
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListView(
                                      children: <Widget>[
                                        Text(
                              "  ", //           snapshot.data.documents[index]['info'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: '',
                                              fontSize: 19,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.white),
                                        ),
                                      ],
                                    )),
                              ),
                              front: Container(
                                //   height:MediaQuery.of(context).size.height/1.3,
                                // height: 300,
                                margin: EdgeInsets.only(
                                    top: 0, bottom: 0, left: 0, right: 0),
    
                                width: MediaQuery.of(context).size.width - 20,
                                padding: EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 10.0,
                                      )
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(0)),
                                    image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      colorFilter: new ColorFilter.mode(
                                          Colors.black.withOpacity(0.4),
                                          BlendMode.darken),
                                      image:
                                      
                          snapshot.data.documents[index]["photo"]!=null?
                                      NetworkImage(snapshot.data.documents[index]["photo"])
                                      :
                                      AssetImage("images/default.png"),
                                    
                                    
                                    
                                    )
                                    
                                    ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Container(width: 200,color: Colors.transparent,
                                                child: InkWell(
                                                  onTap: (){
    
    
                                                               
                                   Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => cityDetails(snapshot.data.documents[index])));
                   
    
                                                  },
                                                                                              child: Text(
                                                      snapshot.data.documents[index]['Name'],
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                        
                                                          color: Colors.white,
                                                         // fontFamily: 'Baloo',
                                                          fontWeight: FontWeight.w300,
                                                          fontSize: 30)),
                                                ),
                                              ),
                                              /*  */
                                            ],
                                          ),
                                          Container(color: Colors.transparent,height:50,width: 50,
                                       /*   child: Stack(
                                              children: <Widget>[
            
                                      snapshot.data.documents[index]['rate']>4?  Icon(
                                                  Icons.star,
                                                  size: 50,
                                                  color: Colors.amber,
                                                ):    snapshot.data.documents[index]['rate']>2? 
    Icon(
                                                  Icons.star_half,
                                                  size: 50,
                                                  color: Colors.amber,
                                                ):Icon(
                                                  Icons.star_border,
                                                  size: 50,
                                                  color: Colors.amber,
                                                ),
    
    
    
                                                Center(
                                                  child: InkWell(
                                                    
                                                    
                                                    onTap:()async{
                     
    
                                              bottomSheet(context, Rates(users: [15,24,58,465,654],));
    //users:admin_ser().getRateUsers("Restaurants", "ZG25uDlOmRjUCb0wUqpl") ,)
    
                                                  } ,
                                               child: Text(snapshot
                                                        .data.documents[index]['rate']
                                                        .toString()
                                                        ,style: TextStyle(fontWeight: FontWeight.w900,color:Colors.white),
                                                        
                                                        textAlign: TextAlign.center,
                                                        
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),  */
                                          ),
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: <Widget>[
             Icon(Icons.location_on,color: Colors.grey[100],),
    
                                          Text(
                                            snapshot.data.documents[index]['country'],
                                            style: TextStyle(color: Colors.white60),
                                          ),
                                        ],
                                      ),
                                      enabled: true,
                                    ),
    
    
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    
    
    children: <Widget>[
    
    
    snapshot.data.documents[index]['recommendedWeather'].toString().isNotEmpty?Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(18.0),
                                                ),
                                                // elevation:2,
                                                color: Colors.transparent,
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
                                                            snapshot
                                                                .data
                                                                .documents[index][
                                                                    'recommendedWeather']
                                                                .toString(),
                                                            style: TextStyle(
                                                               color: Colors.cyan,
                                                                fontWeight:
                                                                    FontWeight.w100,
                                                                fontFamily: 'Oswald',
                                                                fontSize: 20),
                                                          ),
    
                                                          //    Text(' city',style:  TextStyle(color: Colors.teal,
                                                          //      fontWeight:FontWeight.w800,fontFamily: 'ShadowsIntoLight',fontSize:20 ),),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ):Container(),
                     snapshot.data.documents[index]['recommendedType'].toString().isNotEmpty?Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(18.0),
                                                ),
                                                // elevation:2,
                                                color: Colors.transparent,
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
                                                            snapshot
                                                                .data
                                                                .documents[index]
                                                                    ['recommendedType']
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors.cyan[200],
                                                                fontWeight:
                                                                    FontWeight.w100,
                                                                fontFamily: 'Oswald',
                                                                fontSize: 20),
                                                          ),
    
                                                          //    Text(' city',style:  TextStyle(color: Colors.teal,
                                                          //      fontWeight:FontWeight.w800,fontFamily: 'ShadowsIntoLight',fontSize:20 ),),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ):Container(),
    
    
    
    
    ],
    
    
    ),
    
    
    
    
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              snapshot.data
                                                      .documents[index]['maxBudget']
                                                      .toString() +
                                                  "\$",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 25,
                                                  color: Colors.white,
                                                  fontFamily: ''),
                                            ),
                                            Text(
                                              " - ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              snapshot.data
                                                      .documents[index]['minBudget']
                                                      .toString() +
                                                  '\$',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 25,
                                                  color: Colors.white,
                                                  fontFamily: ''),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                
                                
                                
                                
                                
                                
                             /*        Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: InkWell(
                                            child: SvgPicture.asset(
                                              'images/map.svg',
                                              height: 35,
                                            ),
                                            onTap: () {
                                              //return
                                     //   bottomSheet(context,MyApp(snapshot.data["latitude"],snapshot.data["longitude"]));
                                            },
                                          ),
                                        ),
                                        Align(
                                          child:  Container(
    
                               //    alignment: Alignment.topRight,
                                       child: PopupMenuButton<String>(
                                        tooltip: "Options",
                                         icon:Icon(Icons.more_vert ,size: 30,color: Colors.blue,),
    
                                         itemBuilder: (context) => [
                                      
    /////////////////////////////////////////////////////////////////////////////////////////////////////////
    PopupMenuItem(child: InkWell(
    
                                 child:Center(
                                   child: Text('Restaurants', style: TextStyle(color: Colors.blueGrey,),
    
                                   ),
                                 ),
                                 onTap: (){
    
                         
                                   Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DestinationScreen(Citysnap:snapshot.data.documents[index] ,Collection: "Restaurants",barName: "Retaurants",),)
      );             
    
    
    
                                 },
    
                               ))
    ,
    
         PopupMenuItem(
    
    //height: 300,
    
                                             child:InkWell(
    
                                               child: Center(child: Text('Hotels',style: TextStyle(color: Colors.blueGrey),)),
    
                                               onTap: (){
    
                                   Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DestinationScreen(Citysnap:snapshot.data.documents[index] ,Collection: "accommodation",barName: "Hotels/Hostels",),)
      );             
    
    
    
                                               },
    
                                             ),
    
                                           ),
    
    PopupMenuItem(
      child: InkWell(
    
                                                     child:    Center(
                                                       child: Text('Tourism places', style: TextStyle(color: Colors.blueGrey,),
    
                                                       ),
                                                     ),
                                                     onTap: (){
     Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DestinationScreen(Citysnap:snapshot.data.documents[index] ,Collection: "tourismPlaces",barName: "Toursim Attractions",),)
      );
                                                     },
    
                                                   ))
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
                                         ],
                                       ),
                                     ),
    
                                          alignment: Alignment.bottomRight,
                                        ),
                                      ],
                                    ), */
                                   ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                )
                
                
                :Container(
    color: Colors.white,
    height: 500,
    child:Container(
      child:  SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        
        children: <Widget>[
        
        Container(
          
          
          height: MediaQuery.of(context).size.height/1.7,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
          child:
           Center(
             child: FadeAnimation(2,
                             selector==1?
         Column(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(" Which country do you intend to visit? ",
                    
                        textAlign: TextAlign.center,
                    
                        style:TextStyle(color:Colors.black,
                         fontSize: 20,
                        fontWeight: FontWeight.w800)
                        ),
               Padding(
                padding: const EdgeInsets.fromLTRB(20,50,20,0),
                child: DropdownButtonFormField(//isDense: true,isExpanded: true,
                    decoration: InputDecoration(
                    
                    
                       //  icon: Icon(Icons.keyboard_arrow_down),
                     //     iconEnabledColor: Colors.blue,
                    ),
                    
                              value: new_city.Country,
                   
                       hint: Text("Country ..."),
                      // disabledHint: Text("Travel with ...."), 
     
                          onChanged: (val){
                       
                      
                            setState(() {
                              
                                  new_city.Country=val;
                        
          
 
                             
                               
                          
                            });
                   


                   Timer( Duration(seconds:2),
                   
                   (){
setState(() {
  
                               selector++;

                       
});


                   });
                       
                          },
                items: countries.map<DropdownMenuItem<String>>((String value){
                
                return DropdownMenuItem<String>(child: Text(value),value: value,);
                
                }).toList(),
                              ),
    
          ),
          
        
          
          
                 ],
          )
          
          
          :selector==2?
            Column(crossAxisAlignment: CrossAxisAlignment.center
          ,mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

  Padding(
    padding: const EdgeInsets.only(bottom:20.0),
    child: Text(" Which Season do you prefer? ",
                      
                          textAlign: TextAlign.center,
                      
                          style:TextStyle(color:Colors.black,
                      
                          
                      
                          fontSize: 20,
                      
                          
                      
                          fontWeight: FontWeight.w800)
                          ),
  ),


                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: MediaQuery.of(context).size.width/2,
                                        child: RadioListTile(
                            
                            title:Text("Winter",style: TextStyle(fontWeight: FontWeight.w300,color:Colors.cyan),) ,
                            value: 0, groupValue: radio, onChanged: (val){
                               setState(() {
                            radio=val;
                         
                          });
                              Timer( Duration(seconds:2),
                   
                   (){
setState(() {
  
                               selector++;

                       
});


                   });
                          }
                          
                          ),
                        ),
                    
                             SizedBox(width: MediaQuery.of(context).size.width/2,
                                        child: RadioListTile(
                            
                            title:Text("Summer",style: TextStyle(fontWeight: FontWeight.w300,color:Colors.cyan) ),
                            value: 1, groupValue: radio, onChanged: (val){    Timer( Duration(seconds:2),
                   
                   (){
setState(() {
  
                               selector++;

                       
});


                   }); setState(() {
                            radio=val;
                          });}),
                        ),
                    
                    
                      ],
                    ), 
                
                
                
                
                         Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: MediaQuery.of(context).size.width/2,
                                        child: RadioListTile(
                            
                            title:Text("Autumn",style: TextStyle(fontWeight: FontWeight.w300,color:Colors.cyan)  ) ,
                            value: 2, groupValue: radio, onChanged: (val){    Timer( Duration(seconds:2),
                   
                   (){
setState(() {
  
                               selector++;

                       
});


                   }); setState(() {
                            radio=val;
                          });}),
                        ),
                    
                             SizedBox(width: MediaQuery.of(context).size.width/2,
                                        child: RadioListTile(
                            
                            title:Text("Spring",style: TextStyle(fontWeight: FontWeight.w300,color:Colors.cyan)) ,
                            value: 3, groupValue: radio, onChanged: (val){    Timer( Duration(seconds:2),
                   
                   (){
setState(() {
  
                               selector++;

                       
});


                   }); setState(() {
                            radio=val;
                          });}),
                        ),
                    
                    
                      ],
                    )
                
                  ],
        )
        
        :
        selector==3 ?
           Column(crossAxisAlignment: CrossAxisAlignment.center
          ,mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

  Padding(
    padding: const EdgeInsets.only(bottom:20.0),
    child: Text(" Which kind of cities do you prefer? ",
                      
                          textAlign: TextAlign.center,
                      
                          style:TextStyle(color:Colors.black,
                      
                          
                      
                          fontSize: 20,
                      
                          
                      
                          fontWeight: FontWeight.w800)
                          ),
  ),


                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: MediaQuery.of(context).size.width/2.2,
                                        child: RadioListTile(
                            
                            title:Text("Coastal",style: TextStyle(fontWeight: FontWeight.w300,color:Colors.cyan),) ,
                            value: 0, groupValue: radio2, onChanged: (val){    Timer( Duration(seconds:2),
                   
                   (){
setState(() {
  
                               selector++;

                       
});


                   }); setState(() {
                            radio2=val;
                           
                          });}),
                        ),
                    
                             SizedBox(width: MediaQuery.of(context).size.width/1.9,
                                        child: RadioListTile(
                            
                            title:Text("Honeymoon",style: TextStyle(fontWeight: FontWeight.w300,color:Colors.cyan) ),
                            value: 1, groupValue: radio2, onChanged: (val){
                                  Timer( Duration(seconds:2),
                   
                   (){
setState(() {
  
                               selector++;

                       
});


                   });
                               setState(() {



                            radio2=val; 
                          });}),
                        ),
                    
                    
                      ],
                    ), 
                
                
                
                
                         Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: MediaQuery.of(context).size.width/2,
                                        child: RadioListTile(
                            
                            title:Text("Historic",style: TextStyle(fontWeight: FontWeight.w300,color:Colors.cyan)  ) ,
                            value: 2, groupValue: radio2, onChanged: (val){    Timer( Duration(seconds:2),
                   
                   (){
setState(() {
  
                               selector++;

                       
});


                   }); setState(() {
                            radio2=val; 
                          });}),
                        ),
                    
                             SizedBox(width: MediaQuery.of(context).size.width/2,
                                        child: RadioListTile(
                            
                            title:Text("Ski",style: TextStyle(fontWeight: FontWeight.w300,color:Colors.cyan)) ,
                            value: 3, groupValue: radio2, onChanged: (val){     Timer( Duration(seconds:2),
                   
                   (){
setState(() {
  
                               selector++;

                       
});


                   });  setState(() {
                            radio2=val;
                          });}),
                        ),
                    
                    
                      ],
                    ),      Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: MediaQuery.of(context).size.width/2,
                                        child: RadioListTile(
                            
                            title:Text("Discovery",style: TextStyle(fontWeight: FontWeight.w300,color:Colors.cyan)  ) ,
                            value: 4, groupValue: radio2, onChanged: (val){    Timer( Duration(seconds:2),
                   
                   (){
setState(() {
  
                               selector++;

                       
});


                   }); setState(() {
                            radio2=val; 
                          });}),
                        ),
                    
                             SizedBox(width: MediaQuery.of(context).size.width/2,
                                        child: RadioListTile(
                            
                            title:Text("Religous",style: TextStyle(fontWeight: FontWeight.w300,color:Colors.cyan)) ,
                            value: 5, groupValue: radio2, onChanged: (val){    Timer( Duration(seconds:2),
                   
                   (){
setState(() {
  
                               selector++;

                       
});


                   }); setState(() {
                            radio2=val; 
                          });}),
                        ),
                    
                    
                      ],
                    )
                
                  ],
        )
        :selector==4 ?
        Column(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(" What is your average budget? ",
                    
                        textAlign: TextAlign.center,
                    
                        style:TextStyle(color:Colors.black,
                    
                        
                    
                        fontSize: 20,
                    
                        
                    
                        fontWeight: FontWeight.w800)
                        ),
               Padding(
                padding: const EdgeInsets.fromLTRB(20,50,20,0),
                child:TextFormField(
    //              initialValue:_hotel.maxPrice!=null?_hotel.maxPrice.toString():"",

onFieldSubmitted:(val){

this.new_city.maxBudget=int.parse(val);
    Timer( Duration(seconds:2),
                   
                   (){
setState(() {
  
                               selector++;

                       
});


                   });

print(selector.toString()+'###############################');
}
,
               
                        cursorWidth: 1.2,   obscureText: false,

                     //   controller:_Max_price,

                        textAlign: TextAlign.left,

                        textDirection: TextDirection.ltr,

                        autofocus: false,

                        cursorColor: Colors.black,

                        keyboardType:  TextInputType.numberWithOptions(
                            decimal: true
                        ),
                         inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly
    ],



                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: .5,
                          wordSpacing: 1.5,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationColor: Colors.red,
                        ),

                        decoration: InputDecoration(
                          suffixStyle: TextStyle(fontSize: 12),
                               suffixText: "ex: 2500\$",
suffixIcon: Icon(Icons.attach_money),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),

                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),

                          errorStyle:
                          TextStyle(color: Colors.red, fontWeight: FontWeight.w500),

                          labelText: 'Budget',

                          hintText: "Enter your budget",

                          contentPadding: EdgeInsets.all(20),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red[300],
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                            gapPadding: 40.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
    
          ),
          
        
          
          
                 ],
          ): 
          ///////////////////////استريم الفلتر
          
          StreamBuilder(


            //ناقص تظبيط الفتر حسب البيانات اللى ف الكيرينس
                  stream: Firestore.instance.collection('Cities')
                  
   .where("recommendedWeather",isEqualTo: radio==0?"Winter":radio==1?"Summer":radio==2?"Autumn":"Spring"  )
    .where("recommendedType",isEqualTo :radio2==0?"Coastal":radio2==1?"Honeymoon":radio2==2?"Historic":radio2==3?"Ski":radio2==4?"Discovery":"Religous"  )
                  .where("country",isEqualTo:this.new_city.Country)    
                  
                  .where("minBudget",isLessThan:this.new_city.maxBudget)
                            .snapshots(),
                  builder: (BuildContext build, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                   if(snapshot.data.documents.length==0) return Container(
    color:Colors.white,
    child: Center(child:Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Icon(Icons.mood_bad,size: 300,color: Colors.grey[200],),
        Text("Oops, we have not found your best destinations ",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: Colors.grey),),
      ],
    )));
                    return ListView.builder(
                      //controller: _hideButtonController,
                 
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return Container(height: MediaQuery.of(context).size.height/2.5,
                          child: FadeAnimation(
                            1,
                                                 FlipCard(
    //flipOnTouch: false,
    
                              direction: FlipDirection.VERTICAL
    ,
                              back: Container(
                                margin: EdgeInsets.only(
                                    top: 25, bottom: 10, left: 10, right: 10),
    
                                width: MediaQuery.of(context).size.width ,
    
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.cyan[300],
                                        blurRadius: 10.0,
                                      )
                                    ],
                                    color: Colors.blue[200],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                // height:MediaQuery.of(context).size.height/1.3,
                                //  height: 300,
    
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListView(
                                      children: <Widget>[
                                        Text(
                                          snapshot.data.documents[index]['info'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: '',
                                              fontSize: 19,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.white),
                                        ),
                                      ],
                                    )),
                              ),
                              front: Container(
                                //   height:MediaQuery.of(context).size.height/1.3,
                                // height: 300,
                                margin: EdgeInsets.only(
                                    top: 0, bottom: 0, left: 0, right: 0),
    
                                width: MediaQuery.of(context).size.width ,
                                padding: EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 10.0,
                                      )
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(0)),
                                    image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      colorFilter: new ColorFilter.mode(
                                          Colors.black.withOpacity(0.4),
                                          BlendMode.darken),
                                      image: snapshot.data.documents[index]["photo"]!=null?new NetworkImage(snapshot.data.documents[index]["photo"])
                                      :AssetImage("images/default.png")
                                      ,
                                    )
                                    
                                    ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Container(width: 200,color: Colors.transparent,
                                                child: InkWell(
                                                  onTap: (){
    
    
                                                               
                                   Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => cityDetails(snapshot.data.documents[index])));
                   
    
                                                  },
                                                                                              child: Text(
                                                      snapshot.data.documents[index]['Name'],
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                        
                                                          color: Colors.white,
                                                         // fontFamily: 'Baloo',
                                                          fontWeight: FontWeight.w300,
                                                          fontSize: 30)),
                                                ),
                                              ),
                                              /*  */
                                            ],
                                          ),
                                          Container(color: Colors.transparent,height:50,width: 50,
                                         /*    child: Stack(
                                              children: <Widget>[
            
                                      snapshot.data.documents[index]['rate']>4?  Icon(
                                                  Icons.star,
                                                  size: 50,
                                                  color: Colors.amber,
                                                ):    snapshot.data.documents[index]['rate']>2? 
    Icon(
                                                  Icons.star_half,
                                                  size: 50,
                                                  color: Colors.amber,
                                                ):Icon(
                                                  Icons.star_border,
                                                  size: 50,
                                                  color: Colors.amber,
                                                ),
    
    
    
                                          /*       Center(
                                                  child: InkWell(
                                                    
                                                    
                                                    onTap:()async{
                     var users=await admin_ser().getRateUsers("Restaurants", "ZG25uDlOmRjUCb0wUqpl");
    
                                              bottomSheet(context, Rates(users: users,));
    //users:admin_ser().getRateUsers("Restaurants", "ZG25uDlOmRjUCb0wUqpl") ,)
    
                                                  } ,
                                               child: Text(snapshot
                                                        .data.documents[index]['rate']
                                                        .toString()
                                                        ,style: TextStyle(fontWeight: FontWeight.w900,color:Colors.white),
                                                        
                                                        textAlign: TextAlign.center,
                                                        
                                                        ),
                                                  ),
                                                ), */
                                              ],
                                            ), */
                                          ),
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: <Widget>[
             Icon(Icons.location_on,color: Colors.grey[100],),
    
                                          Text(
                                            snapshot.data.documents[index]['country'],
                                            style: TextStyle(color: Colors.white60),
                                          ),
                                        ],
                                      ),
                                      enabled: true,
                                    ),
    
    
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    
    
    children: <Widget>[
    
    
    snapshot.data.documents[index]['recommendedWeather'].toString().isNotEmpty?Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(18.0),
                                                ),
                                                // elevation:2,
                                                color: Colors.transparent,
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
                                                            snapshot
                                                                .data
                                                                .documents[index][
                                                                    'recommendedWeather']
                                                                .toString(),
                                                            style: TextStyle(
                                                               color: Colors.cyan,
                                                                fontWeight:
                                                                    FontWeight.w100,
                                                                fontFamily: 'Oswald',
                                                                fontSize: 20),
                                                          ),
    
                                                          //    Text(' city',style:  TextStyle(color: Colors.teal,
                                                          //      fontWeight:FontWeight.w800,fontFamily: 'ShadowsIntoLight',fontSize:20 ),),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ):Container(),
                     snapshot.data.documents[index]['recommendedType'].toString().isNotEmpty?Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(18.0),
                                                ),
                                                // elevation:2,
                                                color: Colors.transparent,
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
                                                            snapshot
                                                                .data
                                                                .documents[index]
                                                                    ['recommendedType']
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors.cyan[200],
                                                                fontWeight:
                                                                    FontWeight.w100,
                                                                fontFamily: 'Oswald',
                                                                fontSize: 20),
                                                          ),
    
                                                          //    Text(' city',style:  TextStyle(color: Colors.teal,
                                                          //      fontWeight:FontWeight.w800,fontFamily: 'ShadowsIntoLight',fontSize:20 ),),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ):Container(),
    
    
    
    
    ],
    
    
    ),
    
    
    
    
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              snapshot.data
                                                      .documents[index]['maxBudget']
                                                      .toString() +
                                                  "\$",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 25,
                                                  color: Colors.white,
                                                  fontFamily: ''),
                                            ),
                                            Text(
                                              " - ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              snapshot.data
                                                      .documents[index]['minBudget']
                                                      .toString() +
                                                  '\$',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 25,
                                                  color: Colors.white,
                                                  fontFamily: ''),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                
                                
                                
                                
                                
                              /*   
                                    Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: InkWell(
                                            child: SvgPicture.asset(
                                              'images/map.svg',
                                              height: 35,
                                            ),
                                            onTap: () {
                                              setState(() {
                                                enableMap = !enableMap;
                                              });
                                            },
                                          ),
                                        ),
                                        Align(
                                          child:  Container(
    
                               //    alignment: Alignment.topRight,
                                       child: PopupMenuButton<String>(
                                        tooltip: "Options",
                                         icon:Icon(Icons.more_vert ,size: 30,color: Colors.blue,),
    
                                         itemBuilder: (context) => [
                                      
    /////////////////////////////////////////////////////////////////////////////////////////////////////////
    PopupMenuItem(child: InkWell(
    
                                 child:Center(
                                   child: Text('Restaurants', style: TextStyle(color: Colors.blueGrey,),
    
                                   ),
                                 ),
                                 onTap: (){
    
                         
                                   Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DestinationScreen(Citysnap:snapshot.data.documents[index] ,Collection: "Restaurants",barName: "Retaurants",),)
      );             
    
    
    
                                 },
    
                               ))
    ,
    
         PopupMenuItem(
    
    //height: 300,
    
                                             child:InkWell(
    
                                               child: Center(child: Text('Hotels',style: TextStyle(color: Colors.blueGrey),)),
    
                                               onTap: (){
    
                                   Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DestinationScreen(Citysnap:snapshot.data.documents[index] ,Collection: "accommodation",barName: "Hotels/Hostels",),)
      );             
    
    
    
                                               },
    
                                             ),
    
                                           ),
    
    PopupMenuItem(
      child: InkWell(
    
                                                     child:    Center(
                                                       child: Text('Tourism places', style: TextStyle(color: Colors.blueGrey,),
    
                                                       ),
                                                     ),
                                                     onTap: (){
     Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DestinationScreen(Citysnap:snapshot.data.documents[index] ,Collection: "tourismPlaces",barName: "Toursim Attractions",),)
      );
                                                     },
    
                                                   ))
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
                                         ],
                                       ),
                                     ),
    
                                          alignment: Alignment.bottomRight,
                                        ),
                                      ],
                                    ), */
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                )
             ),
           ),
        
        
        )
,



    













Container(color: Colors.white
,height: 100,
  child:   Column(mainAxisAlignment: MainAxisAlignment.end,
  
    children: <Widget>[
  
            StepsIndicator(
  
        
  
          doneStepWidget: Icon(Icons.check_circle,color: Colors.green,),
  
        
  
          selectedStep:(selector-1),
  
        
  
          nbSteps: 5,
  
        
  
          selectedStepColorOut: Colors.greenAccent,
  
        
  
          selectedStepColorIn: Colors.white,
  
        
  
          doneStepColor: Colors.lightGreen,
  
        
  
          unselectedStepColor: Colors.greenAccent,
  
        
  
          doneLineColor: Colors.greenAccent,
  
        
  
          undoneLineColor: Colors.greenAccent,
  
        
  
          isHorizontal: true,
  
        
  
          lineLength: 40,
  
        
  
          lineThickness: 2,
  
        
  
          doneStepSize: 10,
  
        
  
          unselectedStepSize: 10,
  
        
  
          selectedStepSize: 15,
  
        
  
          selectedStepBorderSize: 1,
  
        
  
        // Custom Widget 
  
        
  
        ),
  
   
  
   
  
   
  
   
  
   
  
 selector>1?IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.red[200],),onPressed: (){
  
  setState(() {
  
    selector--;
  
  });
  
  
  
  
  
   },):Container(),
  
   
  
   
  
    ],
  
  ),
)

],


),
      )
,




    ),





            )
            
            
            
            
            );











          
  }
}
