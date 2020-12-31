import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ُesraa


class newRestaurant extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return newRestaurantState();
  }
}

class newRestaurantState extends State<newRestaurant> {

  final formkey = GlobalKey<FormState>();

/*
  TextEditingController Restaurant_Name=TextEditingController();
  TextEditingController Restaurant_Food_Type=TextEditingController();
  TextEditingController Restaurant_Location=TextEditingController();
  TextEditingController Restaurant_Cost=TextEditingController();
*/


//here we add restuarant class but i have added attributes directly

var Restaurant_Name,Restaurant_Food_Type,Restaurant_Location,Restaurant_Cost;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    Restaurant_Name.dispose();
    Restaurant_Food_Type.dispose();
    Restaurant_Location.dispose();
    Restaurant_Cost.dispose();
  }





  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          iconTheme: new IconThemeData(color: Colors.green),
          //   leading: Icon(Icons.filter_list,color: Colors.green,) ,

          title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Traveliano",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.w900)),
              Text(
                "Add New Resturant ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 10,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),

          centerTitle: true, backgroundColor: Colors.white,
        ),


        preferredSize: Size.fromHeight(75),
      ),
      body: Container(
        padding:EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 3),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            border: Border.all(color: Colors.white10, width: 2)),
        child: Form(   key:formkey,
                  child: ListView(

            


            children: <Widget>[



              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TextFormField(


                  validator: (value) {
                    if (value.isEmpty) return "Resturant name is required !!!";
                  
                  },
                 /* validator: (val) {
                    if (val.length == 0) return "Restaurant name is required !!!";
                  },*/

                 /* onSaved: (val) {
             //     firstName = val;
                  },*/

                  cursorWidth: 1.2,   obscureText: false,

                  //     autocorrect: true,
                 controller:Restaurant_Name,
                //  onChanged: ,

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
                    // prefixIcon: Icon(Icons.text_format),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),

                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),

                    errorStyle:
                        TextStyle(color: Colors.red, fontWeight: FontWeight.w500),

                    labelText: 'Restaurant Name',

                    hintText: "Enter Restaurant Name.....",

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
//********************************************************************************************************************


              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TextFormField(
                  /*validator: (val) {
                    if (val.length == 0) return " is required !!!";
                  },*/
                  validator: (value) {
                    if (value.isEmpty)  return "Resturant food type is required !!!";
                  
                  },

                  /*onSaved: (val) {
             //     firstName = val;
                  },
      */
                  cursorWidth: 1.2,   obscureText: false,

                  //     autocorrect: true,

                    controller:Restaurant_Food_Type,
                //  onChanged: ,
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

                    labelText: 'Restaurant Food Type',

                    hintText: "Enter Restaurant Food Type..",

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
                  /*validator: (val) {
                    if (val.length == 0) return "Restaurant location is required !!!";
                  },*/
                  validator: (value) {
                    if (value.isEmpty) 
                      return "Resturant location is required !!!";
                    
                  },

                /*  onSaved: (val) {
                    //     firstName = val;
                  },*/

                  cursorWidth: 1.2,   obscureText: false,

                  //     autocorrect: true,

                  controller:Restaurant_Location,
                 // onChanged:
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

                    labelText: 'Restaurant Location',

                    hintText: "Enter Restaurant Location..",

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
                /*  validator: (val) {
                    if (val.length == 0) return "Resturant cost is required !!!";
                  },*/

                  validator: (value) {
                    if (value.isEmpty) 
                      return "Resturant cost is required !!!";
                    
                  },

                 /* onSaved: (val) {
             //     firstName = val;
                  },*/

                  cursorWidth: 1.2,   obscureText: false,

                  //     autocorrect: true,

                  controller: Restaurant_Cost ,          /********************/
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
/////*****************************************************************************************
            /*  Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child:row
              ),*/






////*******************************************************************************************
            Padding(
              padding: const EdgeInsets.only(top: 25,bottom: 5,left: 50,right: 50),
              child:



               RaisedButton(



                  child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300),),

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
                                    ///save your state
                                    ///
                                    formkey.currentState.save();
                                 await   Firestore.instance.collection('restaurants')
                                        .document().setData({
                                      'name': Restaurant_Name,
                                      'food_type': Restaurant_Food_Type,
                                      'location': Restaurant_Location,
                                      'cost': Restaurant_Cost,

                                    })
                                        .then((data) {

                                      /* setState(() {
                                            print('add');
                                          }); */


                                      Restaurant_Name= '';
                                      Restaurant_Food_Type = '';
                                      Restaurant_Location= '';
                                      Restaurant_Cost = '';
                                      ///////////for only check////////
                                    });




                                   }
                                    else{
                                      print ("error in .....");
                                                    }}



              ),
            ),

               
                ],
          ),
        ),
      ),
    );
  }
}




