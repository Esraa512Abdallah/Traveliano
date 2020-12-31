import 'package:traveliano/blocked.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import'package:traveliano/Login.dart' as login;
import 'package:traveliano/adminScreens/city/Destination.dart';
import 'package:traveliano/adminScreens/experience/ratePlacesEx.dart';
//import 'package:traveliano/adminScreens/experience/squad.dart';
import 'package:traveliano/adminScreens/geolocator.dart';
import 'package:traveliano/adminScreens/newPaint2.dart';
import 'package:traveliano/adminScreens/rates.dart';
import 'package:traveliano/load.dart';
import 'package:traveliano/register.dart' as register;
import 'package:traveliano/home.dart' as home;
import 'package:traveliano/HOMEPAGE/home.dart' as hm;
import 'package:traveliano/splashScreen.dart';
import 'package:traveliano/userScreens/myExperince.dart';
import 'package:traveliano/userScreens/profile.dart';
import 'package:traveliano/adminScreens/home.dart' as adhome;
import 'HOMEPAGE/home.dart';
import 'abdalahSwap/Swap.dart';
import 'adminScreens/hotel/AdHotel.dart';
import 'adminScreens/newPaint3.dart';
import 'models/hotel.dart';

class wrapper extends StatelessWidget{


  @override
  Widget build(BuildContext context) {


final user=Provider.of<FirebaseUser>(context);


    
if(user==null){
//return newpaint3();
return login.login();
//return splash();
//return hm.Home();
// return Swap();
}else{
 // return liquid();
  //
 // return adhome.home();
//return userProfile();
 if(user.uid=="ktXwLhNqcQMVlTEcI7L88C0dIkA2"){

  return adhome.home();
}else{
  



  return Home();







  
  
   }
//
//return ratePlacesEx();
//
//return Rates();
//return hotelDetails(hotel:hotel);
//return DestinationScreen();
//return load("Loading");
//return Geolocato();
//return myExperince();
//return login.login();
}



  }





  
}






