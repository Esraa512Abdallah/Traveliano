import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:traveliano/models/city.dart';
import 'package:traveliano/models/hotel.dart';
//import './addNewcity.dart' as ci;
import 'package:traveliano/adminScreens/addNewCity2.dart' as ci2;

import 'package:traveliano/adminScreens/tourismplace/addImage.dart' as TplaceImg;
import 'package:traveliano/models/restuarant.dart';
import 'package:traveliano/models/tourismplace.dart';

//import 'hotel/addImage.dart';

class MyApp extends StatefulWidget {

City city=new City();
TourismPlace _tourismplace =new TourismPlace();


MyApp(City city,TourismPlace  tourismplace){
this._tourismplace=tourismplace;
this.city=city;
}

  @override
  MyAppState createState() => MyAppState(city,_tourismplace);
}

class MyAppState extends State<MyApp> {


 
TourismPlace _tourismplace =new TourismPlace();
City city =new City();

MyAppState(City city1,TourismPlace tourismPlace){
this._tourismplace=tourismPlace;
city=city1;
}


GoogleMapController mapController;
bool _markerAdded=false;
static  LatLng _center = LatLng(30,30);

//////////////new attribute
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.hybrid;

  static final CameraPosition _position1 = CameraPosition(
    bearing: 192.833,
    target: _center,
    tilt: 59.440,
    zoom: 9.0,
  );

  Future<void> _gotoPosition1() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_position1));
  }

  _onCamaraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }




  searchandNavigate() {
    Geolocator().placemarkFromAddress(this._tourismplace.Name).then((result) {


setState(() {
  
//_lastMapPosition=CameraPosition(target: ).target;
  
  
 _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: LatLng(result[0].position.latitude,result[0].position.longitude),
        infoWindow: InfoWindow(
          title: this._tourismplace.Name,
          snippet: this.city.Name,
     
        ),
        icon: BitmapDescriptor.defaultMarker,
      )
      );
   
   _markerAdded=!_markerAdded;





});









  setState(() {
      this._tourismplace.latitude=result[0].position.latitude;
    this._tourismplace.longtude=result[0].position.longitude;

  });

   mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
   // bearing:360,
    target: LatLng(result[0].position.latitude,result[0].position.longitude),
    tilt: 59.440,
    zoom: 15.0,
  )
  )
  );
 
    });

   
  }











  void _addMarkerPressed() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: this._tourismplace.Name,
          snippet: this.city.Name,
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: "btn1",
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
                target: LatLng(this.city.latitude, this.city.longtude),
                zoom: 9.0,
              ),
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCamaraMove,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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

 _markerAdded==true?FloatingActionButton(
   heroTag: "btn3",
                      backgroundColor: Colors.transparent,
                      onPressed: (){

//save in City class
this._tourismplace.latitude=_lastMapPosition.latitude;

this._tourismplace.longtude=_lastMapPosition.longitude;


/*
print("###################-----------------------+++++++++++++++++++++++++++++++");
print(this.city.Id.toString()+"-----"+this.hotel.Id.toString());

print("###################---------------Marker Added--------+++++++++++++++++++++++++++++++");


*/


  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => TplaceImg.UploadImage(this.city,this._tourismplace),
  ));
  





//print(city.Country+"//////////"+city.info+"////////"+city.Name+"//////"+city.Travelwith+
//"//////latitude"+city.latitude+"////////longtude"+city.longtude);
//print("###################-----------------------+++++++++++++++++++++++++++++++");

                      },
                      child: Icon(
                        Icons.navigate_next,
                        size: 60,
                        color: Colors.blue,
                      ),

                    ):FloatingActionButton(
                      heroTag: "btn4",
                      backgroundColor: Colors.transparent,
                      onPressed: (){},
                      child: Icon(
                        Icons.navigate_next,
                        size: 60,
                        color: Colors.white70,
                      ),

                    )





                  ],
                ),






              ),
            )
          ],
        ),
      
    );
  }
}
