import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:traveliano/models/city.dart';
import 'package:traveliano/models/hotel.dart';
import './addNewcity.dart' as ci;
import 'package:traveliano/adminScreens/addNewCity2.dart' as ci2;



class MyApp extends StatefulWidget {

double _lati;
double _longi;
//String Name;
MyApp(double latitude,double longitude){

this._lati=latitude;
this._longi=longitude;


}
  @override
  MyAppState createState() => MyAppState(this._lati,this._longi);
}

class MyAppState extends State<MyApp> {

double _lati;
double _longi;

MyAppState(double latitude,double longitude){

this._lati=latitude;
this._longi=longitude;


}



double _zoom=10.0;

 GoogleMapController mapController;



//////////////new attribute

  Set<Marker> _markers = {};


  MapType _currentMapType = MapType.hybrid;






  Future<void> _gotoPosition1() async {
   // final GoogleMapController controller = await mapController.;
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
   // bearing:360,
    target: LatLng(this._lati, this._longi),
    tilt: 40.440,
    zoom: 15.0,
  )
  )
  );
  }
  Future<void> _gotoPosition2() async {
   // final GoogleMapController controller = await mapController.;
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
   // bearing:360,
    target: LatLng(this._lati, this._longi),
    tilt: 59.440,
    zoom: 2.0,
  )
  )
  );
  }



  void _addMarkerPressed() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_longi.toString()),
        position: LatLng(this._lati, this._longi),
        infoWindow: InfoWindow(
          title: "City Name",
          snippet: "Country",
        ),
        icon: BitmapDescriptor.defaultMarker,
      )
      );
   

   
    });

   
  }

  void _mapTypePressed() {
 
    setState(() {
      _currentMapType == MapType.normal
          ? _currentMapType = MapType.hybrid
          : _currentMapType = MapType.normal;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
      _addMarkerPressed();

_gotoPosition1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        body: Stack(
          children: <Widget>[
     
     
            GoogleMap(
              compassEnabled: false,
           indoorViewEnabled: true,
          
              onMapCreated: _onMapCreated,
          zoomGesturesEnabled: true,  
              initialCameraPosition: CameraPosition(
                target: LatLng(this._lati, this._longi),
                zoom: 11,
          //      bearing: 119.0
          
            
            tilt: 50.0  ),
              mapType: _currentMapType,
              markers: _markers,
    
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                   
                    InkWell(


                      onTap: _mapTypePressed,
                                            child: Icon(
                        Icons.map,
                        size: 35,
                        color: Colors.green,
                      ),
                    ),
                         




        
    InkWell(

onDoubleTap: _gotoPosition2,
                      
                                            child: FloatingActionButton(
                                              heroTag: "dsf",
                                              backgroundColor: Colors.blue[700],
                                      onPressed: _gotoPosition1,
                                    
                              child: Icon(
                        Icons.my_location,
                        size: 25,
                        color: Colors.white,
                        
                      ),
                                            ),
                    ),





                  ],
                ),






              ),
            )
          ],
        ),
      
    );
  }
}
