import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveliano/models/city.dart';
import 'package:traveliano/models/restuarant.dart';
import 'package:traveliano/adminScreens/restuarant/location3.dart' as location;

//////////////////without city drop down


class NewCityRestaurant extends StatefulWidget {
  City city=new City();
  
  NewCityRestaurant(City city){

this.city=city;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewCityRestaurantState(this.city);
  }
}

class NewCityRestaurantState extends State<NewCityRestaurant> {

City _city=new City();
Restuarant _restuarant = new Restuarant();

NewCityRestaurantState(City city){

  this._city=city;



}



  final formkey = GlobalKey<FormState>();

 // var _latitude,_longitude ,_Food_value , _Resturant_Rate,_Image,_City_Name;
//

  var food_type =["Meat","chicken"];



  //TextEditingController  _Restaurant_Name =TextEditingController();
 ///TextEditingController  _Restaurant_Cost =TextEditingController();



  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  //  _Restaurant_Name.dispose();
    //_Restaurant_Cost.dispose();

    // _latitude.dispose();
    // _longitude.dispose();
  }





  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(



floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
floatingActionButton: FloatingActionButton(
backgroundColor: Colors.amber,
child: Icon(Icons.navigate_next,size: 40,),


                    onPressed: ()async{

                      if (formkey.currentState.validate()) {
                        ///save your state

                         formkey.currentState.save();
                        this._restuarant.cityId=this._city.Id;
                        this._restuarant.rate=0;
                  
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>location.MyApp(this._city,this._restuarant) ),
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
              Text("New Restaurant",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Comfortaa')),
        /*       Text(
                "Add New Resturant ",
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
          // autovalidate: true,
          child: ListView(




            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TextFormField(
onSaved: (val){


  this._restuarant.Name=val;
},
                  validator: (val) {
                    if (val.length == 0) return "Resturant name is required !!!";
                  },


                  cursorWidth: 1.2,   obscureText: false,

                  //controller:_Restaurant_Name,

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

                    labelText: 'Restaurant Name',

                    hintText: "Enter Restaurant Name..",

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
                padding: const EdgeInsets.only(bottom: 20),

                child: DropdownButtonFormField(
                  //isDense: true,isExpanded: true,

                  value: this._restuarant.foodType,
          //        icon: Icon(Icons.keyboard_arrow_down),
            //      iconEnabledColor: Colors.blue,
                  hint: Text("Select Food Type..."),
              //    disabledHint: Text("Enter Food Type..."),
                  onChanged: (val){
                    setState(() {
                      this._restuarant.foodType=val;
                    });
                  },
                  items: this.food_type.map<DropdownMenuItem<String>>((String value){

                    return DropdownMenuItem<String>(child: Text(value),value: value,);

                  }).toList(),
                ),
              ),

////**********************************************************//





              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TextFormField(
                  validator: (val) {
                    if (val.length == 0) return "Resturant cost is required !!!";
                  },


                  onSaved: (val) {
                  this._restuarant.cost=int.parse(val);
                  
                  },

                  cursorWidth: 1.2,   obscureText: false,

                  //     autocorrect: true,

               //   controller: _Restaurant_Cost ,
                  //onChanged: (value){this.Restaurant_Cost= value;},
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
                    // prefixIcon: Icon(Icons.text_format),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),

                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),

                    errorStyle:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w500),

                    labelText: 'Resturant Cost',

                    hintText: "Enter Resturant Cost..",

                    //  filled: true,

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
                child:



                RaisedButton(

focusColor: Colors.red,
                    child: Text("Next>",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300),),

                    color: Colors.green,

                    elevation: 8.0,



                    shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(120.0),

                        side: BorderSide(color: Colors.green,width: 1.2)

                    ),



                    padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/40,



                      bottom: MediaQuery.of(context).size.height/30,



                      left: MediaQuery.of(context).size.width/11,



                      right: MediaQuery.of(context).size.width/11,



                    ),


                ),
              ), */


            ],
          ),
        ),
      ),
    );
  }


}




