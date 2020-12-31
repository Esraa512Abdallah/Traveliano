

import 'package:traveliano/HOMEPAGE/contactUs.dart';
import 'package:traveliano/HOMEPAGE/policy.dart';
import 'package:traveliano/adminScreens/experience/liquid.dart';
import 'package:traveliano/userScreens/notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flare_flutter/flare_actor.dart';
//import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:traveliano/HOMEPAGE/citiesPage.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:traveliano/HOMEPAGE/homePage.dart';
import 'package:traveliano/HOMEPAGE/SearchPage.dart';

import "package:traveliano/HOMEPAGE/suggestPage.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:traveliano/load.dart';
import 'package:traveliano/services/admin.dart';
import 'package:traveliano/services/user.dart';
import 'package:traveliano/HOMEPAGE/EshomePage_rate.dart' as Esrate;
import 'package:traveliano/userScreens/profile.dart';
import 'package:traveliano/userScreens/Experince.dart' as ex;
import 'package:traveliano/userScreens/strangeProfile.dart';
import '../wrapper.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
 // FlareController fcon;

  final citiesPage _cities = new citiesPage();
  final  _user = new SearchPage();
  final  _home = new ex.Experinces(specificId: null,);
  final suggestPage _suggest = new suggestPage();

int trips,followers,following;

  Widget _showpage;
int x;
  Widget _PageChooser(int page) {
    setState(() {
      x=page;
    });
    switch (page) {
      case 0:
        return _home;
        break;
      case 1:
        return _user;
        break;
      case 2:
        return _cities;
        break;
      case 3:
        return _suggest;
        break;
      default:
        return GestureDetector(
            onTap: () async {

            
            },
            child: Container(
                child: userProfile(),
            )
            );
    }
  }
var icon=Icon(Icons.message);
  Color drawertext=Colors.black;










  @override
  Widget build(BuildContext context) {

    FirebaseUser user = Provider.of<FirebaseUser>(context);
    // TODO: implement build
    return 
    
    
    
    InnerDrawer(
         //   key: _innerDrawerKey,
            onTapClose: true, // default false
            swipe: true, // default true 
            colorTransition: Colors.black,           
          //  colorTransition: Color.red, // default Color.black54
            
            // DEPRECATED: use offset
            leftOffset: 0.6, // Will be removed in 0.6.0 version
            rightOffset: 0.6,// Will be removed in 0.6.0 version
            
            //When setting the vertical offset, be sure to use only top or bottom
            offset: IDOffset.only( 
           //   top: 0.5, 
              //OR 
               bottom: 0.1, 
              right: 0.8, left: 0.4
            ),
            
            // DEPRECATED:  use scale
            leftScale: 0.9,// Will be removed in 0.6.0 version
            rightScale: 0.9,// Will be removed in 0.6.0 version
            
            scale: IDOffset.horizontal( 0.8 ), // set the offset in both directions
            
            proportionalChildArea : true, // default true
            borderRadius: 50, // default 0
            leftAnimationType: InnerDrawerAnimation.static, // default static
            rightAnimationType: InnerDrawerAnimation.quadratic,
            backgroundColor: Colors.white, // default  Theme.of(context).backgroundColor
            
            //when a pointer that is in contact with the screen and moves to the right or left            
            onDragUpdate: (double val, InnerDrawerDirection direction) {
                // return values between 1 and 0
                print(val);
                // check if the swipe is to the right or to the left
                print(direction==InnerDrawerDirection.start);
            },
            
            innerDrawerCallback: (a) => print(a), // return  true (open) or false (close)
            leftChild: Container(
height: 400,
child: ListView(
reverse: true,

children: <Widget>[


 FlatButton(
child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: <Widget>[
        Text("Log Out",style: TextStyle(color: drawertext,fontWeight: FontWeight.w300,fontSize: 15),),
 
 Icon(Icons.exit_to_app)
  ],
),
//leading: Icon(Icons.info_outline),
onPressed: (){
  user_services().signOut();
}
      ) ,
   
   
   
            SizedBox(height: MediaQuery.of(context).size.height/11,),
   
   
   
   FlatButton(
child: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[
 Icon(Icons.info_outline,color: Colors.blue,)
      ,  Text("  About",style: TextStyle(color: drawertext,fontWeight: FontWeight.w300,fontSize: 15),),
 
  ],
),
//leading: Icon(Icons.info_outline),
onPressed: (){user_services().signOut();},
      ) ,
      
      
    
      FlatButton(
child: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[
 Icon(Icons.phone,color: Colors.amber,size: 30,)
      ,  Text("  Contact us",style: TextStyle(color: drawertext,fontWeight: FontWeight.w300,fontSize: 15),),
 
  ],
),
//leading: Icon(Icons.info_outline),
onPressed: (){


 Navigator.push(context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation)=> contact(),
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
      ) ,



 FlatButton(onPressed: (){

Navigator.push(context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation)=> policy(),
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
child: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[ Icon(Icons.security,color: Colors.amberAccent,),
        Text("  Privacy Policy",style: TextStyle(color: drawertext,fontWeight: FontWeight.w300,fontSize: 15),),


],

),

        ),
        

 

 Divider(color: Colors.blue,thickness: 1,height: 0,indent: 0,endIndent: 30,),


 FlatButton(onPressed: null,
child: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[ Icon(Icons.bookmark_border,color: Colors.lightBlue,),
        Text("  Saved",style: TextStyle(color:drawertext,fontWeight: FontWeight.w300,fontSize: 15),),


],

),

        ),  
        
 
         FlatButton(onPressed: (){


  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>liquid(colName:"tourismPlaces") ),
  ); 
      

         },
child: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[ 
    Icon(Icons.account_balance,color: Colors.orange,),
      
     // SvgPicture.asset("images/bad.svg",height: 20,),
      
        Text("  Tourism Places",style: TextStyle(color: drawertext,fontWeight: FontWeight.w300,
        fontSize: 14),),


],

),

        ), FlatButton(onPressed: (){
          
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>liquid(colName:"accommodation") ),
  ); 
        },
child: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[ 
    Icon(Icons.local_hotel,color: Colors.green,),
      
     // SvgPicture.asset("images/bad.svg",height: 20,),
      
        Text("  Hotels/Hostels",style: TextStyle(color: drawertext,fontWeight: FontWeight.w300,fontSize: 15),),


],

),

        ), FlatButton(onPressed: (){


  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>liquid(colName:"Restaurants") ),
  ); 
      

        },
child: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[ 
    Icon(Icons.restaurant_menu,color: Colors.blueAccent,),
      
     // SvgPicture.asset("images/bad.svg",height: 20,),
      
        Text("  Restaurants",style: TextStyle(color: drawertext,fontWeight: FontWeight.w300,fontSize: 15),),


],

),

        ),






FlatButton(onPressed: null,
child: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[ 
    Icon(Icons.local_airport,color: Colors.teal,),
      
     // SvgPicture.asset("images/bad.svg",height: 20,),
      
        Text("  My Experience",style: TextStyle(color: drawertext,fontWeight: FontWeight.w300,fontSize: 15),),


],

),

        ),

 
FlatButton(onPressed: null,
child: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[ 
 //   Icon(Icons.local_airport,color: Colors.white,),
      
     // SvgPicture.asset("images/bad.svg",height: 20,),
      
        Text("   Traveliano",style: TextStyle(color: Colors.blue,
        fontWeight: FontWeight.w800,fontSize: 35,fontFamily: "Pacifico"),),


],

),

        ),



]
        )
        ),// required if rightChild is not set
            rightChild: Scaffold(
                          body: SafeArea(
                                                      child: Container(


color: Colors.white,


height: MediaQuery.of(context).size.height,
child: Column(

children: <Widget>[
  
   
  Row(
    children: <Widget>[
      Icon(FontAwesomeIcons.solidBell,size: 30,color: Colors.redAccent,),
  Text("Notifications",style: TextStyle(fontSize: 20,color: Colors.black,
  fontWeight: FontWeight.w500),),

  ],
  ),
Container(
  
  height: 500,
  child: notificationS()),
/////////////////////////////////////////////////////////////////////////////////////////noti here
],

),
 




              ),
                          ),
            ), // required if leftChild is not set
            
            //  A Scaffold is generally used but you are free to use other widgets
            // Note: use "automaticallyImplyLeading: false" if you do not personalize "leading" of Bar
            scaffold:
    Scaffold(






     /*    drawer:  CurvedDrawer(
    color: Colors.white,
    labelColor: Colors.black54,
    width: 75.0,
    items: <DrawerItem>[
      DrawerItem(icon:Icon(Icons.enhanced_encryption,size: 10,), label: "Messages"),
      //DrawerItem(icon:icon, label: "Messages")
    ],
    onTap: (index) {
      //Handle button tap
    },
  ), */

       /*    ListTile(
title: Text("Log Out"),
leading: Icon(Icons.info_outline),
onTap: (){user_services().signOut();},
      ) */
     
        bottomNavigationBar: CurvedNavigationBar(
 //     buttonBackgroundColor:   x==3? Colors.red[300]:Colors.white,

          height:50,
animationCurve: Curves.decelerate,
animationDuration: Duration(seconds: 2),
          color: Colors.red[300],
          buttonBackgroundColor: Colors.red[400],

          backgroundColor: Colors.white,
          items: <Widget>[
            //   SvgPicture.asset('images/fork.svg',height: 30,width:30),
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.search,
              color: Colors.white,
            ),
       Icon(
              Icons.public,
              color: Colors.white,
            ),
        
            Icon(
              Icons.rate_review,
              color: Colors.white,
            ),

            Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
          ],
          //animationCurve: Curves.easeInOutCirc,
          onTap: (index) {
            setState(() {
              _showpage = _PageChooser(index);
            });
          },
        ),
      
      
      
      
        body:
     
Container(
 // margin: EdgeInsets.all(10),
          color: Colors.white,
          child: Center(
            child: _showpage == null ? _home : _showpage,
          ),
)






        )
            //OR
          
        );
    
    
    
    
    
    




  }}
        
        
        
        
        
        
        
        
         /*Container(
          color: Colors.white,
          child: Center(
            child: _showpage == null ? _home : _showpage,
          ),
        )
        */
        
      

  