import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveliano/models/city.dart';
import 'package:traveliano/models/hotel.dart';
import 'package:traveliano/services/admin.dart' as services;
import 'package:traveliano/adminScreens/hotel/location2.dart' as location;

class CityAccommodation extends StatefulWidget {
  City city = new City();
  CityAccommodation(City city) {
    this.city = city;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CityAccommodationState(this.city);
  }
}

class CityAccommodationState extends State<CityAccommodation> {


  final formkey = GlobalKey<FormState>();
  
   Hotel hotel = new Hotel();

  City city = new City();
  
  CityAccommodationState(City city) 
  {
  
    this.city = city;
  }
 
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    // _latitude.dispose();
    // _longitude.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

floatingActionButton: FloatingActionButton(
  
  
  child: Icon(Icons.navigate_next,size: 45,),backgroundColor: Colors.red[300],
  
  onPressed: () async {

if (formkey.currentState.validate()) {
                       
              
formkey.currentState.save();
this.hotel.cityId=this.city.Id;


//print("_-_-_-___-----_____"+this.hotel.minPrice.toString()+
//"############"+this.hotel.maxPrice.toString()+"############## "+this.hotel.Name );
//print("%%%%%%%%%%%%%%%%%%%%%%%%% city name"+this.city.Name+" ID  "+this.city.Id);
  
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>location.MyApp(this.city,this.hotel) ),
  );


//await services.admin_ser().addHotel(this.hotel);






                      }

}

),
      appBar:AppBar(
      iconTheme: new IconThemeData(color: Colors.red[200]),


      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("New Hotel/Hostel",
              //textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.red[300],
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  )),
      /*     Text(
            "New Accommodation ",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.blue,
                fontSize: 10,
                fontWeight: FontWeight.w300,
                ),
          ), */
        ],
      ),

      //centerTitle: true, 
      backgroundColor: Colors.white,
    ),
      body: Container(
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0, top: 30.0),
        margin: EdgeInsets.only(top: 3),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            border: Border.all(color: Colors.white10, width: 2)),
        child: Form(
          key: formkey,
          child: ListView(
            children: <Widget>[
        /*       Padding(
                  padding: const EdgeInsets.only(bottom: 30, top: 0),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          this.city.Name,
                          style: TextStyle(fontSize: 50),
                        ),
                        Text(this.city.Country)
                      ],
                    ),
                  )),
 */
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TextFormField(
                
                onSaved: (val){
this.hotel.Name=val;


                },
                
                  validator: (val) {
                    if (val.length == 0)
                      return " Name is required !!!";
                  },
                  cursorWidth: 1.2,
                  obscureText: false,
              //    controller: _Accommodation_Name,
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  autofocus: false,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: .5,
                    wordSpacing: 1.5,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationColor: Colors.red,
                  ),
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    errorStyle: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w500),
                    labelText: 'Name...',
                    hintText: "Enter Hotel/Hostel Name...",
                    contentPadding: EdgeInsets.all(20),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.greenAccent,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                      gapPadding: 40.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 3.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),

////**********************************************************///
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TextFormField(

onSaved: (val){

this.hotel.maxPrice= int.parse(val);

},

                  validator: (val) {
                    if (val.length == 0)
                      return "Max price is required !!!";
                  },
                  cursorWidth: 1.2,
                  obscureText: false,
            //      controller: _Max_price,
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  autofocus: false,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: .5,
                    wordSpacing: 1.5,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationColor: Colors.red,
                  ),
                  decoration: InputDecoration(
                        suffixStyle: TextStyle(fontSize: 12),
                    suffixText: "Per Night",
                    suffixIcon: Icon(Icons.attach_money),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    errorStyle: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w500),
                    labelText: 'Max price .... ',
                    hintText: "Enter Hotel/Hostel Max price ...",
                    contentPadding: EdgeInsets.all(20),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.greenAccent,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                      gapPadding: 40.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 3.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),

////**********************************************************//

              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TextFormField(
                  onSaved: (val){
this.hotel.minPrice=int.parse(val);


                  },
                  validator: (val) {
                    if (val.length == 0)
                      return "Min price is required !!!";
                  },
                  cursorWidth: 1.2,
                  obscureText: false,
                //  controller: _Min_price,
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  autofocus: false,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: .5,
                    wordSpacing: 1.5,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationColor: Colors.red,
                  ),
                  decoration: InputDecoration(
                        suffixStyle: TextStyle(fontSize: 12),
                        suffixText:"Per Night" ,
                         suffixIcon: Icon(Icons.attach_money),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    errorStyle: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w500),
                    labelText: 'Min price...',
                    hintText: "Enter Hotel/Hostel Min price...",
                    contentPadding: EdgeInsets.all(20),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.greenAccent,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                      gapPadding: 40.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 3.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),


                Text(' Services&Facilities:',style: TextStyle(fontSize:15,fontWeight: FontWeight.w300 ),)

,
 Container(height: MediaQuery.of(context).size.height/1.5,
   child: Padding(
     padding: const EdgeInsets.fromLTRB(15,5,15,10),
     child: ListView(
            children: this.hotel.services.keys.map((String key) {
              return CheckboxListTile( 
                dense: true,
                isThreeLine: false,
                activeColor: Colors.blue,
            //    secondary: Icon(Icons.done_all),
             //   subtitle: Text("1"),
controlAffinity: ListTileControlAffinity.platform,
               selected:this.hotel.services[key], 
               
                title: Text(key,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500
                ,fontFamily: "Bitter"
                ),),
                value: this.hotel.services[key],
                onChanged: (bool value) {
                  setState(() {
                  this.hotel.services[key] = value;
                  });
                },
              );
            }).toList(),
          ),
   ),
 )


////***********************************************************************************************************
        /*       Padding(
                padding: const EdgeInsets.only(
                    top: 25, bottom: 5, left: 50, right: 50),
                child: RaisedButton(
                    child: Text(
                      "Next",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    ),
                    color: Colors.green,
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(120.0),
                        side: BorderSide(color: Colors.green, width: 1.2)),
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 40,
                      bottom: MediaQuery.of(context).size.height / 30,
                      left: MediaQuery.of(context).size.width / 10,
                      right: MediaQuery.of(context).size.width / 10,
                    ),
                    onPressed: () async {
                      if (formkey.currentState.validate()) {
                       
              
formkey.currentState.save();
this.hotel.cityId=this.city.Id;


//print("_-_-_-___-----_____"+this.hotel.minPrice.toString()+
//"############"+this.hotel.maxPrice.toString()+"############## "+this.hotel.Name );
//print("%%%%%%%%%%%%%%%%%%%%%%%%% city name"+this.city.Name+" ID  "+this.city.Id);
  
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>location.MyApp(this.city,this.hotel) ),
  );


//await services.admin_ser().addHotel(this.hotel);






                      }
                    }),
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
