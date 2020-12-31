import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveliano/Login.dart' as login;
//import 'package:traveliano/adminScreens/hotels.dart' as prefix0;

import 'package:traveliano/register2.dart' as register;
import 'package:traveliano/home.dart' as home;
import 'package:traveliano/services/user.dart';
import 'package:traveliano/splashScreen.dart';
import 'package:traveliano/userScreens/profile.dart';

import './adminScreens/addNewcity.dart' as addcity;
import './adminScreens/location.dart' as locate;
import './adminScreens/home.dart' as Ahome;
import './adminScreens/restuarant/newRestuarant2.dart' as newrestaurant;
import 'package:traveliano/adminScreens/hotel/addAccommodation2.dart'
    as newHotel;
import 'package:traveliano/adminScreens/tourismplace/newTourismPlace2.dart'
    as TPlace;
import 'package:traveliano/addNewresturant.dart' as NR;
import 'package:traveliano/adminScreens/hotel/addImage.dart' as img;
import 'adminScreens/allCities.dart' as allcities;
import 'package:traveliano/wrapper.dart';
import 'package:traveliano/HOMEPAGE/home.dart' as home2;
import 'package:traveliano/adminScreens/restuarant/allRestaurant.dart'
    as allres;
import 'package:traveliano/adminScreens/tourismplace/allTourismPlaces.dart'
    as allTplace;
import 'package:traveliano/adminScreens/hotel/allHotels.dart' as allHotels;
import 'package:traveliano/new/page1.dart' as ad;
import 'package:traveliano/adminScreens/Search2.dart' as ss;
import 'adminScreens/city/city.dart' as citypre;
import 'adminScreens/experience/addExperience.dart';
import 'adminScreens/experience/experience.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'adminScreens/newPaint3.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

FirebaseMessaging _fcm= new FirebaseMessaging();
@override
void initState() { 
  
  _fcm.configure(

onLaunch: (message)async => {print("On Launch :"+ message.toString())},
onMessage: (message)async => {print("On Message :"+ message.toString())},
onResume: (message)async => {print("On Resume :"+ message.toString())},




);
}
  @override
  Widget build(BuildContext context) {



    // TODO: implement build

    

    return StreamProvider<FirebaseUser>.value(
  
      value: user_services().userStream,
  
      child: MaterialApp(
        routes: {
//'cp':(context) => citypre.cityPreview("-M-RRuieslXukW1Z2MA_"),

          'ax': (context) => AddEx(),
          'Ad': (context) => ad.Page1(),
          'paint': (context) => newpaint3(),

          'Home2': (context) => home2.Home(),
          'AdminHome': (context) => Ahome.home(),
          //    'img' :(context) => img.UploadMultipleImageDemo(),
          'Esraa': (context) => NR.newRestaurant(),
          'Login': (context) => login.login(),
          'Home': (context) => home.home_screen(),
          'Register': (context) => register.register(),
       
          'AddCity': (context) => addcity.newCity(null, false),
//'Loc':(context) => locate.MyApp(),
          "AddTPlace": (context) => TPlace.NewTourismPlace(),
          "AddRestaurant": (context) => newrestaurant.NewRestaurant(),
          'AddHotel': (context) => newHotel.NewAccommodation(),
          "AllCities": (context) => allcities.Cities(),
          "AllRestaurants": (context) => allres.restaurants(),
          "AllTplace": (context) => allTplace.tourismPlace(),
          "AllHotels": (context) => allHotels.hotel(),
          "ex": (context) => ex(),
          "x": (context) => ss.citiesPage(),
        //  "Profile" :(context) =>userProfile()
        },
        debugShowCheckedModeBanner: false,
        home: splash(),
      ),
    );
  }
  // This widget is the root of your application.

}
