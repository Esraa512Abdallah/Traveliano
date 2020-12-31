import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:traveliano/adminScreens/allCities.dart';
import 'package:traveliano/models/city.dart';
import '../load.dart';
import './addNewcity.dart' as ci;
import 'package:traveliano/adminScreens/addNewCity2.dart' as ci2;



class MyApp extends StatefulWidget {
bool isUpdate;
City city=new City();
MyApp(City city,bool isUpdate){
this.isUpdate=isUpdate;
this.city=city;

}

  @override
  MyAppState createState() => MyAppState(city,this.isUpdate);
}

class MyAppState extends State<MyApp> {
bool isUpdate;
City city=new City();
MyAppState(City city,bool isUpdate){
this.isUpdate=isUpdate;
this.city=city;

}
  GoogleMapController mapController;
bool _markerAdded=false;
  static const LatLng _center = LatLng(29.521563, 31.677433);

//////////////new attribute
  //Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.hybrid;




  _onCamaraMove(CameraPosition position) {
   
    _lastMapPosition = position.target;
  
  }

  void _addMarkerPressed() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position:_lastMapPosition,
        infoWindow: InfoWindow(
          title: this.city.Name,
          snippet: this.city.Country,
        ),
        icon: BitmapDescriptor.defaultMarker,
      )
      );
   
   _markerAdded=!_markerAdded;
   
    });

    print("###" +
        _lastMapPosition.latitude.toString() +
        "---------" +
        _lastMapPosition.longitude.toString() +
        "-_---__");
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
 searchandNavigate();


    print("IS Update Map...................."+this.isUpdate.toString());
  }





  searchandNavigate() {
    Geolocator().placemarkFromAddress(this.city.Name).then((result) {


setState(() {
  
//_lastMapPosition=CameraPosition(target: ).target;
  
  
 _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: LatLng(result[0].position.latitude,result[0].position.longitude),
        infoWindow: InfoWindow(
          title: this.city.Name,
          snippet: this.city.Country,
        ),
        icon: BitmapDescriptor.defaultMarker,
      )
      );
   
   _markerAdded=!_markerAdded;





});









  setState(() {
      city.latitude=result[0].position.latitude;
      city.longtude=result[0].position.longitude;

  });

   mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
   // bearing:360,
    target: LatLng(result[0].position.latitude,result[0].position.longitude),
    tilt: 59.440,
    zoom: 10.0,
  )
  )
  );
 
    });

   
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 1.0,
              ),
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCamaraMove,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FloatingActionButton(
                      heroTag: "btn2",
                      backgroundColor: Colors.transparent,
                      onPressed: _mapTypePressed,
                      child: Icon(
                        Icons.map,
                        size: 35,
                        color: Colors.white,
                      ),

                    ),
     FloatingActionButton(
          heroTag: "btn1",
          elevation: 15.0,
          backgroundColor: Colors.transparent,
          onPressed: _markerAdded==true?(){setState(() {
            _markerAdded=!_markerAdded;

          });_markers={};}: _addMarkerPressed,
          child: _markerAdded==false?Icon(
            Icons.add_location,
            color: Colors.white,
            size: 40.0,
          ):Icon(
            Icons.delete_outline,
            color: Colors.red,
            size: 35.0,
          )
        ),
    

                  ],
                ),





              ),
            )


            ,
 if ( this._markerAdded | isUpdate==true) Align(
alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
       
       heroTag: "btn3",
      
                          backgroundColor: Colors.transparent,
                          onPressed: () async {

//save in City class
city.latitude=_lastMapPosition.latitude;
city.longtude=_lastMapPosition.longitude;
if(!isUpdate){
city.maxBudget=0;city.minBudget=0;
city.rate=0.0;city.recommended_Type="";
city.recommended_Weather="";



      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ci2.newCity(this.city),
      ));
   } else{

//load("Saving Changes.....");
await Firestore.instance.collection("Cities").document(city.Id).updateData({
        "longitude": city.longtude,
          "latitude": city.latitude,
          "country": city.Country,
          "Name": city.Name,
  //       "travelWith": city.Travelwith,
          "info": city.info,
}
)
;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>Cities(),
      ));

   }
               },
                          child: Icon(
                            Icons.navigate_next,
                            size: 60,
                            color: Colors.blue,
                          ),

                        ),
    ),
 ) else Align(
alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
                          heroTag: "btn4",
                          backgroundColor: Colors.transparent,
                          onPressed: (){},
                          child: Icon(
                            Icons.navigate_next,
                            size: 60,
                            color: Colors.white70,
                          ),

                        ),
    ),
 )




          ],
        ),
      
    );
  }
}
