import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveliano/models/city.dart';
import 'package:traveliano/models/tourismplace.dart';
import 'package:traveliano/adminScreens/tourismplace/location4.dart' as location;




class CityTourismPlace extends StatefulWidget {

   City city=new City();
  
  CityTourismPlace(City city){

this.city=city;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CityTourismPlaceState(this.city);
  }
}

class CityTourismPlaceState extends State<CityTourismPlace> {
  City city=new City();
  
  CityTourismPlaceState(City city){

this.city=city;
  }
  final formkey = GlobalKey<FormState>();

  

TourismPlace _tourismPlace =new TourismPlace();
 


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  //  _TourismPlace_Name.dispose();
    //_TourismPlace_Cost.dispose();
    //_TourismPlace_Description.dispose();


    // _latitude.dispose();
    // _longitude.dispose();
  }





  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(




floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
floatingActionButton: FloatingActionButton(

  child: Center(child: Icon(Icons.navigate_next,size: 45,)),
  backgroundColor: Colors.orange,
  
                    onPressed: ()async{

                      if (formkey.currentState.validate()) {

formkey.currentState.save();
this._tourismPlace.rate=0;



Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>location.MyApp(this.city,this._tourismPlace) ),
  );
                       
                      }
                    }
),





      appBar: AppBar(
          iconTheme: new IconThemeData(color: Colors.green),
          //   leading: Icon(Icons.filter_list,color: Colors.green,) ,

          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("New Tourism Place",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Comfortaa')),
            /*   Text(
                "Add New TourismPlace ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Comfortaa'),
              ), */
            ],
          ),

          centerTitle: true, backgroundColor: Colors.white,
        ),
      body: Container(
        padding:EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0,top:40.0),
        margin: EdgeInsets.only(top: 3),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            border: Border.all(color: Colors.white10, width: 2)),
        child: Form(
          key:formkey,



          child: ListView(




            children: <Widget>[




              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TextFormField(

                  validator: (val) {
                    if (val.length == 0) return "TourismPlace name is required !!!";
                  },
onSaved: (val){

this._tourismPlace.Name=val;


},

                  cursorWidth: 1.2,   obscureText: false,

          //        controller:_TourismPlace_Name,

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

                    errorStyle:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w500),

                    labelText: 'Tourism Place Name...',

                    hintText: "Enter Tourism Place Name...",

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

                  validator: (val) {
                    if (val.length == 0) return "Tourism Place description is required !!!";
                  },
onSaved: (val){

  this._tourismPlace.description=val;
},

                  cursorWidth: 1.2,   obscureText: false,

               //   controller:_TourismPlace_Description,

                  textAlign: TextAlign.left,

                  textDirection: TextDirection.ltr,

                  autofocus: false,

                  cursorColor: Colors.black,

                  keyboardType: TextInputType.text,

                  maxLines: 3 ,

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

                    errorStyle:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w500),

                    labelText: 'TourismPlace description.. ',

                    hintText: "Enter TourismPlace description ..",

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
                  validator: (val) {
                    if (val.length == 0) return "TourismPlace  cost is required !!!";
                  },


onSaved: (val){


  this._tourismPlace.cost=int.parse(val);
},

                  cursorWidth: 1.2,

                  obscureText: false,

               //   controller: _TourismPlace_Cost ,

                  textAlign: TextAlign.left,

                  textDirection: TextDirection.ltr,

                  autofocus: false,

                  cursorColor: Colors.black,

                  keyboardType:  TextInputType.numberWithOptions(
                      decimal: true
                  ),

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

                    errorStyle:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w500),

                    labelText: 'TourismPlace Cost..',

                    hintText: "Enter TourismPlace Cost...",


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

////***********************************************************************************************************
          /*     Padding(
                padding: const EdgeInsets.only(top: 25,bottom: 5,left: 50,right: 50),
                child: RaisedButton(



                    child: Text("Next",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300),),

                    color: Colors.green,

                    elevation: 8.0,



                    shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(120.0),

                        side: BorderSide(color: Colors.green,width: 1.2)

                    ),



                    padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/40,



                      bottom: MediaQuery.of(context).size.height/30,



                      left: MediaQuery.of(context).size.width/10,



                      right: MediaQuery.of(context).size.width/10,



                    ),

                    onPressed: ()async{

                      if (formkey.currentState.validate()) {

formkey.currentState.save();
this._tourismPlace.rate=0;



Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>location.MyApp(this.city,this._tourismPlace) ),
  );
                       
                      }
                    }



                ),
              ),
 */

            ],
          ),
        ),
      ),
    );
  }

}




