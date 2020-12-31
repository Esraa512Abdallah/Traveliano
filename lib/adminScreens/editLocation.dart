import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import './addNewcity.dart' as ci;



class MyApp extends StatefulWidget {
dynamic object;
String col;
MyApp({this.object,this.col});
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  GoogleMapController mapController;
bool _markerAdded=false;
  static const LatLng _center = LatLng(29.521563, 31.677433);

//////////////new attribute
  //Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.hybrid;

  static final CameraPosition _position1 = CameraPosition(
    bearing: 192.833,
    target: _center,
    tilt: 59.440,
    zoom: 11.0,
  );
double zoom=10.0;

  _onCamaraMove(CameraPosition position) {
   
    _lastMapPosition = position.target;
  
  }
  void _addMarkerPressed() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: "City Name",
          snippet: "Country",
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
  
  }


@override
  void initState() {
    // TODO: implement initState
    super.initState();


setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: LatLng(widget.object.latitude,widget.object.longtude),
        infoWindow: InfoWindow(
          title: "City Name",
          snippet: "Country",
        ),
        icon: BitmapDescriptor.defaultMarker,
      )
      );
   
   _markerAdded=!_markerAdded;
   
    });

_lastMapPosition=LatLng(widget.object.latitude,widget.object.longtude);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 15.0,
          backgroundColor: Colors.transparent,
          onPressed: _markerAdded==true?(){setState(() {
            _markerAdded=!_markerAdded;

          });;_markers={};}: _addMarkerPressed,
          child: _markerAdded==false?Icon(
            Icons.add_location,
            color: Colors.white,
            size: 40.0,
          ):Icon(
            Icons.delete_outline,
            color: Colors.red,
            size: 40.0,
          )
        ),
     
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(widget.object.latitude,widget.object.longtude),
                zoom:zoom,
              ),
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCamaraMove,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: <Widget>[
                    FloatingActionButton(
                      backgroundColor: Colors.transparent,
                      onPressed: _mapTypePressed,
                      child: Icon(
                        Icons.map,
                        size: 35,
                        color: Colors.white,
                      ),

                    ),

 FloatingActionButton(mini: true,
                      backgroundColor: Colors.transparent,
                      onPressed: (){
zoom=zoom+1;
//save in City class
   mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
   // bearing:360,
    target: LatLng(_lastMapPosition.latitude,_lastMapPosition.longitude),
  
    zoom: zoom,
  )
  )
  );

                      },
                      child: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),

                    ),FloatingActionButton(
                      mini: true,
                      heroTag: "hgjkh",
                      backgroundColor: Colors.transparent,
                      onPressed: (){
zoom=zoom-1;
   mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
   // bearing:360,
    target: LatLng(_lastMapPosition.latitude,_lastMapPosition.longitude),
  
    zoom: zoom,
   )));
                      },
                      child: Icon(
                        FontAwesomeIcons.minus,
                        size: 25,
                        color: Colors.white70,
                      ),

                    )





                  ],
                ),






              ),
            ),



Align(
  alignment: Alignment.bottomCenter,
  child:   Padding(
    padding: const EdgeInsets.all(8.0),
    child: FloatingActionButton(onPressed: () async {



if(_markerAdded){



await Firestore.instance.collection(widget.col).document(widget.object.Id).updateData({

"latitude":_lastMapPosition.latitude,
"longitude":_lastMapPosition.longitude

});


Navigator.pop(context);



}


    },
    
    
    
    backgroundColor: Colors.white12,
    
    heroTag: "kjhkjh",
    
    child: _markerAdded?  Icon(
    
                                Icons.navigate_next,
    
                                size: 60,
    
                                color: Colors.blue,
    
                              ):Icon(
    
                                Icons.navigate_next,
    
                                size: 60,
    
                                color: Colors.grey,
    
                              ),
    
    
    
    ),
  ),
)


          ],
        ),
      
    );
  }
}
